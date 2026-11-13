
// =============================================================================
// SYS_TOP_tb  --  task-based testbench
//
// Drives SYS_TOP purely through the UART pins (i_RX_IN_sys / o_TX_OUT_sys),
// exactly as the real master would. Structure, matching what was asked for:
//
//   - send_uart_byte()      : bit-bangs one 8N1(+parity) frame onto RX_IN
//   - rf_write()            : task for command 0xAA (3 frames)
//   - rf_read_and_check()   : task for command 0xBB (2 frames) + receive/compare
//   - alu_op_and_check()    : task for command 0xCC (4 frames) + receive/compare
//   - alu_nop_and_check()   : task for command 0xDD (2 frames) + receive/compare
//   - initial block         : example transactions using all 4 commands
//
// Baud: with the default RegFile config (REG3 div_ratio = 32, REG2 prescale
// field = 32), both TX and RX run at UART_CLK/32 = 3.6864MHz/32 = 115200
// baud, with parity enabled/even by default. This testbench keeps that
// config unchanged (it rewrites REG2/REG3 with their reset values, only to
// satisfy the "config write is part of the required init sequence" rule),
// so BIT_PERIOD below is a fixed constant rather than something recomputed
// per test.
//
// Compile with SYS_TOP.v + a COMPLETE Sys_Ctrl_Unit (Sys_Ctrl_Unit_guide.v
// or Sys_Ctrl_Unit_compact.v) -- not the original uploaded skeleton, whose
// empty ALU-collect states will hang the FSM before any reply is produced.
// =============================================================================

`timescale 1ns/100ps

module Sys_tb ;

// -----------------------------------------------------------------------
// timing
// -----------------------------------------------------------------------
localparam        REF_CLK_PERIOD  = 20.0 ;                              // 50 MHz
localparam        UART_CLK_PERIOD = 271.2 ;                             // 3.6864 MHz
localparam        BIT_PERIOD      = UART_CLK_PERIOD * 32 ;              // default baud

// -----------------------------------------------------------------------
// opcodes / ALU function codes (mirror Sys_Ctrl_Unit / Alu_unit)
// -----------------------------------------------------------------------
localparam [7:0] RF_WR_CMD   = 8'haa ,
                 RF_RD_CMD   = 8'hbb ,
                 ALU_OP_CMD  = 8'hcc ,
                 ALU_NOP_CMD = 8'hdd ;

localparam [3:0] ALU_ADD  = 4'b0000 , ALU_SUB  = 4'b0001 , ALU_MUL = 4'b0010 , ALU_DIV = 4'b0011 ,
                 ALU_AND  = 4'b0100 , ALU_OR   = 4'b0101 , ALU_NAND= 4'b0110 , ALU_NOR = 4'b0111 ,
                 ALU_XOR  = 4'b1000 , ALU_XNOR = 4'b1001 , ALU_EQ  = 4'b1010 , ALU_GT  = 4'b1011 ,
                 ALU_LT   = 4'b1100 , ALU_SHR  = 4'b1101 , ALU_SHL = 4'b1110 ;

// -----------------------------------------------------------------------
// DUT hookup
// -----------------------------------------------------------------------
reg  Ref_Clk , Uart_Clk , RST_n , RX_IN ;
wire Stop_Err , Par_Err , TX_OUT ;

integer pass_cnt = 0 ;
integer fail_cnt = 0 ;

// master-side mirror of what it believes REG2 currently holds
reg par_en_cfg  = 1'b1 ; // matches RegFile reset default
reg par_typ_cfg = 1'b0 ; // even, matches RegFile reset default

SYS_TOP DUT (
    .i_Ref_Clk          ( Ref_Clk )  ,
    .i_Uart_Clk         ( Uart_Clk ) ,
    .i_RST_n            ( RST_n )    ,
    .i_RX_IN_sys        ( RX_IN )    ,
    .o_Stop_Error_sys   ( Stop_Err ) ,
    .o_Parity_Error_sys ( Par_Err )  ,
    .o_TX_OUT_sys       ( TX_OUT )
);

initial Ref_Clk = 1'b0 ;
always #(REF_CLK_PERIOD/2.0) Ref_Clk = ~Ref_Clk ;

initial Uart_Clk = 1'b0 ;
always #(UART_CLK_PERIOD/2.0) Uart_Clk = ~Uart_Clk ;

// the "did I receive correctly" half of the check, from the DUT's own
// RX-side error flags -- these should never fire on frames *we* send
always @ ( posedge Stop_Err ) $display("[%0t] WARNING: DUT flagged a stop-bit error on our TX", $time) ;
always @ ( posedge Par_Err )  $display("[%0t] WARNING: DUT flagged a parity error on our TX", $time) ;

// =========================================================================
// TASK: send one UART byte, LSB first, using the master's current
// understanding of the parity config (updated by rf_write() below whenever
// address 0x2 is written)
// =========================================================================
task send_uart_byte ( input [7:0] data ) ;
    integer i ;
    reg     par_bit ;
    begin
        par_bit = par_typ_cfg ? ~(^data) : (^data) ;   // matches Parity_Calc.v

        RX_IN = 1'b0 ;                                  // start bit
        #(BIT_PERIOD) ;

        for ( i = 0 ; i < 8 ; i = i + 1 )
        begin
            RX_IN = data[i] ;                           // LSB first
            #(BIT_PERIOD) ;
        end

        if ( par_en_cfg )
        begin
            RX_IN = par_bit ;
            #(BIT_PERIOD) ;
        end

        RX_IN = 1'b1 ;                                  // stop bit
        #(BIT_PERIOD) ;
    end
endtask

// =========================================================================
// TASK: receive one UART byte, LSB first, from o_TX_OUT_sys
// =========================================================================
task recv_uart_byte ( output [7:0] data , output stop_ok ) ;
    integer i ;
    reg     par_bit ;
    begin
        wait ( TX_OUT === 1'b1 ) ;      // start from a known idle line
        @ ( negedge TX_OUT ) ;          // start-bit edge
        #(BIT_PERIOD * 1.5) ;           // center of data bit 0

        for ( i = 0 ; i < 8 ; i = i + 1 )
        begin
            data[i] = TX_OUT ;
            #(BIT_PERIOD) ;
        end

        if ( par_en_cfg )
        begin
            par_bit = TX_OUT ;          // sampled for completeness; RX-side
            #(BIT_PERIOD) ;             // parity checking is o_Parity_Error_sys's job
        end

        stop_ok = ( TX_OUT === 1'b1 ) ;
    end
endtask

// =========================================================================
// TASK: command 0xAA -- RF write (3 frames), no reply expected
// =========================================================================
task rf_write ( input [3:0] addr , input [7:0] data ) ;
    begin
        send_uart_byte( RF_WR_CMD )        ;
        send_uart_byte( {4'b0000, addr} )  ;
        send_uart_byte( data )             ;

        if ( addr == 4'h2 )                // we just rewrote UART_Config ourselves
        begin
            par_en_cfg  = data[0] ;
            par_typ_cfg = data[1] ;
        end
    end
endtask

// =========================================================================
// TASK: command 0xBB -- RF read (2 frames) + receive & compare
// =========================================================================
task rf_read_and_check ( input [3:0] addr , input [7:0] expected ) ;
    reg [7:0] got     ;
    reg       stop_ok ;
    begin
        send_uart_byte( RF_RD_CMD )       ;
        send_uart_byte( {4'b0000, addr} ) ;

        recv_uart_byte( got , stop_ok ) ;

        if ( got === expected && stop_ok )
        begin
            pass_cnt = pass_cnt + 1 ;
            $display("[%0t] PASS  RF read  addr=0x%0h got=0x%0h", $time, addr, got) ;
        end
        else
        begin
            fail_cnt = fail_cnt + 1 ;
            $display("[%0t] FAIL  RF read  addr=0x%0h expected=0x%0h got=0x%0h stop_ok=%0b",
                       $time, addr, expected, got, stop_ok) ;
        end
    end
endtask

// =========================================================================
// TASK: command 0xCC -- ALU with operand (4 frames) + receive & compare
// reply is 2 bytes (low, then high) since ALU_OUT is 16 bits
// =========================================================================
task alu_op_and_check ( input [7:0] opA , input [7:0] opB , input [3:0] fun , input [15:0] expected ) ;
    reg [7:0]  lo , hi     ;
    reg        stop_lo , stop_hi ;
    reg [15:0] got ;
    begin
        send_uart_byte( ALU_OP_CMD )      ;
        send_uart_byte( opA )             ;
        send_uart_byte( opB )             ;
        send_uart_byte( {4'b0000, fun} )  ;

        recv_uart_byte( lo , stop_lo ) ;
        recv_uart_byte( hi , stop_hi ) ;
        got = {hi, lo} ;

        if ( got === expected && stop_lo && stop_hi )
        begin
            pass_cnt = pass_cnt + 1 ;
            $display("[%0t] PASS  ALU_OP  A=%0d B=%0d fun=%0d got=%0d", $time, opA, opB, fun, got) ;
        end
        else
        begin
            fail_cnt = fail_cnt + 1 ;
            $display("[%0t] FAIL  ALU_OP  A=%0d B=%0d fun=%0d expected=%0d got=%0d",
                       $time, opA, opB, fun, expected, got) ;
        end
    end
endtask

// =========================================================================
// TASK: command 0xDD -- ALU without operand (2 frames) + receive & compare
// reuses whatever is currently latched in RegFile REG0/REG1
// =========================================================================
task alu_nop_and_check ( input [3:0] fun , input [15:0] expected ) ;
    reg [7:0]  lo , hi ;
    reg        stop_lo , stop_hi ;
    reg [15:0] got ;
    begin
        send_uart_byte( ALU_NOP_CMD )     ;
        send_uart_byte( {4'b0000, fun} )  ;

        recv_uart_byte( lo , stop_lo ) ;
        recv_uart_byte( hi , stop_hi ) ;
        got = {hi, lo} ;

        if ( got === expected && stop_lo && stop_hi )
        begin
            pass_cnt = pass_cnt + 1 ;
            $display("[%0t] PASS  ALU_NOP fun=%0d got=%0d", $time, fun, got) ;
        end
        else
        begin
            fail_cnt = fail_cnt + 1 ;
            $display("[%0t] FAIL  ALU_NOP fun=%0d expected=%0d got=%0d", $time, fun, expected, got) ;
        end
    end
endtask

// reference model, used only to compute "expected" values for the checks above
function [15:0] alu_model ( input [7:0] a , input [7:0] b , input [3:0] fun ) ;
    begin
        case ( fun )
            ALU_ADD  : alu_model = a + b ;
            ALU_SUB  : alu_model = a - b ;
            ALU_MUL  : alu_model = a * b ;
            ALU_DIV  : alu_model = ( b == 0 ) ? 16'd0 : a / b ;
            ALU_AND  : alu_model = a & b ;
            ALU_OR   : alu_model = a | b ;
            ALU_NAND : alu_model = ~(a & b) ;
            ALU_NOR  : alu_model = ~(a | b) ;
            ALU_XOR  : alu_model = a ^ b ;
            ALU_XNOR : alu_model = ~(a ^ b) ;
            ALU_EQ   : alu_model = ( a == b ) ? 16'd1 : 16'd0 ;
            ALU_GT   : alu_model = ( a >  b ) ? 16'd2 : 16'd0 ;
            ALU_LT   : alu_model = ( a <  b ) ? 16'd3 : 16'd0 ;
            ALU_SHR  : alu_model = a >> 1 ;
            ALU_SHL  : alu_model = a << 1 ;
            default  : alu_model = 16'd0 ;
        endcase
    end
endfunction

// =========================================================================
// stimulus: initial block with example read/write/ALU transactions
// covering all 4 commands
// =========================================================================
initial
begin

    $dumpfile("VCD/SYS_TOP.vcd");
    $dumpvars(0, Sys_tb);

    RX_IN = 1'b1 ;      // idle line
    RST_n = 1'b0 ;

    #200 ;
    RST_n = 1'b1 ;
    #200 ;

    // required init sequence: config writes to 0x2 / 0x3 (kept at their
    // reset-default values here, so baud/parity stay fixed for this run)
    rf_write( 4'h2 , 8'b1000_0001 ) ;   // prescale=32, par_typ=even, par_en=1
    rf_write( 4'h3 , 8'b0010_0000 ) ;   // div_ratio = 32

    // ---- example 1: RF write then read back --------------------------
    rf_write( 4'h4 , 8'hA5 ) ;
    rf_read_and_check( 4'h4 , 8'hA5 ) ;

    // ---- example 2: a second RF location -------------------------------
    rf_write( 4'h5 , 8'h3C ) ;
    rf_read_and_check( 4'h5 , 8'h3C ) ;

    // ---- example 3: ALU with operand (addition) ------------------------
    alu_op_and_check( 8'd10 , 8'd3 , ALU_ADD , alu_model(8'd10, 8'd3, ALU_ADD) ) ;

    // ---- example 4: ALU without operand -- reuses REG0/REG1 from #3
    //      (still 10 and 3), run subtraction on them
    alu_nop_and_check( ALU_SUB , alu_model(8'd10, 8'd3, ALU_SUB) ) ;

    // ---- example 5: ALU with operand, multiplication -- exercises the
    //      16-bit / two-TX-byte reply path
    alu_op_and_check( 8'd200 , 8'd200 , ALU_MUL , alu_model(8'd200, 8'd200, ALU_MUL) ) ;

    // ---- example 6: one more RF write/read pair ------------------------
    rf_write( 4'hA , 8'hFF ) ;
    rf_read_and_check( 4'hA , 8'hFF ) ;

    #(BIT_PERIOD * 4) ;

    $display("--------------------------------------------------") ;
    $display("TESTS COMPLETE: %0d passed, %0d failed", pass_cnt, fail_cnt) ;
    $display("--------------------------------------------------") ;

    $finish ;
end

endmodule
