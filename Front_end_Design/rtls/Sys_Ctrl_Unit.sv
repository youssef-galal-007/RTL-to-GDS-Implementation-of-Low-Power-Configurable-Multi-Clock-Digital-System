module Sys_Ctrl_Unit #( parameter data_width = 8 ,
                                  Addr_Bits  = 4 
)(
    input                            i_ref_clk       ,
    input                            i_rst_n         ,
 
    input [2*data_width - 1 : 0 ]    i_ALU_OUT       ,
    input                            i_VALID_alu     ,

    input [data_width - 1 : 0 ]      i_Synced_Rx_D   , 
    input                            i_Synced_RX_VLD ,

    input [data_width - 1 : 0 ]      i_RdData        ,
    input                            i_Valid         ,

    input                            i_fifo_f        ,                        

    output reg                       o_Gated_clk_en  ,

    output reg                       o_Alu_EN        ,          
    output reg [3:0]                 o_ALU_FUN       ,

    output reg [data_width - 1 : 0 ] o_TX_P_DATA     ,
    output reg                       o_TX_D_VLD      ,

    output reg [Addr_Bits - 1 : 0 ]  o_Addr          , 
    output reg [data_width - 1 : 0 ] o_Wr_D          ,
    output reg                       o_WrEn          ,
    output reg                       o_RdEn          ,

    output                           o_clk_div_en
);

// as it's always on 
assign o_clk_div_en   = 'b1 ;

// system opCodes :
localparam [7:0] RF_Wr_CMD          = 8'haa ,           // Register File Write command
                 RF_Rd_CMD          = 8'hbb ,           // Register File Read command
                 ALU_OPER_W_OP_CMD  = 8'hcc ,           // ALU Operation command with operand
                 ALU_OPER_W_NOP_CMD = 8'hdd ;           // ALU Operation command without operand

// system states encoding :
typedef enum bit [3:0] {
            IDLE               = 'b0000 ,          
            Recieve_RF_Wr_Addr = 'b0001 ,
            Recieve_RF_Wr_data = 'b0011 ,
            Recieve_RF_RD_Addr = 'b0010 ,
            Recieve_OP_A       = 'b0110 ,
            Recieve_OP_B       = 'b0111 ,
            Recieve_Alu_Fun    = 'b0101 ,
            ALU_Excute         = 'b0100 ,
            Send_to_fifo       = 'b1100 
                    } state_e ;

// reserved RegFile addresses for ALU operands (REG0 / REG1)
localparam [Addr_Bits - 1 : 0] OPA_ADDR = {Addr_Bits{1'b0}}          ,
                               OPB_ADDR = {{Addr_Bits-1{1'b0}},1'b1} ;

// states signals
state_e current_s , next_s ;

// storage register :
reg [2*data_width - 1 : 0 ] Alu_out_store ;         // Alu out storing register 
reg [data_width - 1 : 0 ]   Wr_addr_store ;         // write addr storing register
reg [data_width - 1 : 0 ]   Alu_fun_store ;         // write addr storing register


// flags 
reg byte_counter   ,        // to count recieved bytes number from Alu 
    alu_data_saved ,        // flag to check alu_out data is saved 
    alu_func_saved ,        // flag to check alu_func is saved 
    WR_ADDR_saved  ;        // flag to check write_addr is saved 

// state transition
always @ ( posedge i_ref_clk or negedge i_rst_n )
begin
    if ( !i_rst_n )
    begin
        current_s <= IDLE ;
    end
    else
    begin
        current_s <= next_s ;
    end
end

always @(*) 
begin
    // intialization 
    alu_data_saved = 'b0 ;
    alu_func_saved = 'b0 ;
    WR_ADDR_saved  = 'b0 ;

    o_Gated_clk_en = 'b0 ;

    o_Alu_EN       = 'b0 ;  
    o_ALU_FUN      = 'b0 ;

    o_TX_P_DATA    = 'b0 ; 
    o_TX_D_VLD     = 'b0 ; 

    o_Addr         = 'b0 ;
    o_Wr_D         = 'b0 ;
    o_WrEn         = 'b0 ;
    o_RdEn         = 'b0 ;

    case ( current_s )
    // recieving commands state
    IDLE : 
    begin
        if ( i_Synced_RX_VLD )
        begin
            // commands 
            case (i_Synced_Rx_D)   
            // register file write
            RF_Wr_CMD :
            begin
                next_s = Recieve_RF_Wr_Addr  ;
            end

            // register file read
            RF_Rd_CMD :
            begin
                next_s = Recieve_RF_RD_Addr  ;
            end

            // alu operation with operand
            ALU_OPER_W_OP_CMD :
            begin
                next_s = Recieve_OP_A ;
            end

            // alu operation without operand
            ALU_OPER_W_NOP_CMD :
            begin
                next_s = Recieve_Alu_Fun ;
            end

            default :
            begin
                next_s = IDLE ;
            end
            endcase
        end
        else
        begin
            next_s = IDLE ;
        end
    end

    // recieve write address
    Recieve_RF_Wr_Addr :
    begin
        if ( i_Synced_RX_VLD )
        begin
            WR_ADDR_saved = 1'b1 ;

            next_s = Recieve_RF_Wr_data  ;
        end
        else
        begin
            WR_ADDR_saved = 1'b0 ;

            next_s = Recieve_RF_Wr_Addr ;
        end
    end

    // recieve write data
    Recieve_RF_Wr_data :
    begin
        if ( i_Synced_RX_VLD )
        begin
            o_WrEn = 'b1 ;
            o_Addr = Wr_addr_store [3:0] ;
            o_Wr_D = i_Synced_Rx_D       ;

            next_s = IDLE  ;
        end
        else
        begin
            next_s = Recieve_RF_Wr_data ;
        end
    end

    // recieve read address 
    Recieve_RF_RD_Addr :
    begin
        if ( i_Synced_RX_VLD )
        begin
            o_RdEn = 'b1 ;
            o_Addr = i_Synced_Rx_D [3:0] ;

            next_s = Send_to_fifo ;  
        end
        else
        begin
            next_s = Recieve_RF_RD_Addr ;
        end
    end

    // recieve operand A 
    Recieve_OP_A :
    begin
        if ( i_Synced_RX_VLD )
        begin
            o_WrEn = 'b1 ;
            o_Addr = OPA_ADDR ;
            o_Wr_D = i_Synced_Rx_D ;

            next_s = Recieve_OP_B  ;
        end
        else
        begin
            next_s = Recieve_OP_A ;
        end
    end

    // recieve operand B
    Recieve_OP_B :
    begin
        if ( i_Synced_RX_VLD )
        begin
            o_WrEn = 'b1 ;
            o_Addr = OPB_ADDR ;
            o_Wr_D = i_Synced_Rx_D ;

            next_s = Recieve_Alu_Fun  ;
        end
        else
        begin
            next_s = Recieve_OP_B ;
        end
    end

    // recieve Alu Function 
    Recieve_Alu_Fun :
    begin
        o_Gated_clk_en = 'b1 ;
        if ( i_Synced_RX_VLD )
        begin
            alu_func_saved = 'b1 ;

            next_s         = ALU_Excute  ;                      
        end
        else
        begin
            alu_func_saved = 'b1 ;

            next_s         = Recieve_Alu_Fun ;
        end
    end

    // Excuting alu operation 
    ALU_Excute :
    begin
        o_Gated_clk_en = 'b1 ;
        o_Alu_EN       = 'b1 ;
        o_ALU_FUN      = Alu_fun_store[3:0] ;
        if ( i_VALID_alu )
        begin
            alu_data_saved = 'b1  ;

            next_s    = Send_to_fifo  ;  
        end
        else
        begin
            alu_data_saved = 'b0 ;
            next_s    = ALU_Excute ;
        end
    end

    // sending recieved Alu_result or read data to fifo 
    Send_to_fifo : 
    begin
        // read data sending to fifo  
        if ( i_Valid && !i_fifo_f )
        begin
            o_TX_P_DATA = i_RdData ;
            o_TX_D_VLD  =    'b1   ;

            next_s      =   IDLE   ;
        end

        // ALU OUT sending to fifo 
        else if ( !i_fifo_f && byte_counter == 1'b0 )
        begin
            o_TX_D_VLD  = 'b1 ;

            // send first byte
            o_TX_P_DATA = Alu_out_store [7:0] ;         

            next_s = Send_to_fifo  ;
        end
        else if ( !i_fifo_f && byte_counter == 1'b1 )
        begin
            o_TX_D_VLD  = 'b1 ;

            // send second byte
            o_TX_P_DATA = Alu_out_store [2*data_width - 1:8] ;      

            next_s = IDLE ;
        end
        else
        begin
            next_s = Send_to_fifo ;
        end
    end

    default :
    begin
        
        o_Gated_clk_en = 'b0 ;

        o_Alu_EN       = 'b0 ;  
        o_ALU_FUN      = 'b0 ;

        o_TX_P_DATA    = 'b0 ; 
        o_TX_D_VLD     = 'b0 ; 

        o_Addr         = 'b0 ;
        o_Wr_D         = 'b0 ;
        o_WrEn         = 'b0 ;
        o_RdEn         = 'b0 ;

        next_s = IDLE ;
    end

    endcase 
end

// byte counter logic 
always @ ( posedge i_ref_clk or negedge i_rst_n ) 
begin
    if ( !i_rst_n )
    begin
        byte_counter <= 1'b0 ;
    end
    else if ( current_s == Send_to_fifo && !i_Valid && !i_fifo_f && byte_counter == 1'b0 )
    begin
        byte_counter <= 1'b1 ;
    end
    else if ( current_s == Send_to_fifo && !i_Valid && !i_fifo_f && byte_counter == 1'b1 )
    begin
        byte_counter <= 1'b0 ;
    end 
end

// store Alu out 
always @ ( posedge i_ref_clk or negedge i_rst_n ) 
begin
    if ( !i_rst_n )
    begin
        Alu_out_store <= {2*data_width{1'b0}} ;
    end
    else if ( alu_data_saved )
    begin
        Alu_out_store <= i_ALU_OUT ;
    end
end

// store alu func
always @ ( posedge i_ref_clk or negedge i_rst_n ) 
begin
    if ( !i_rst_n )
    begin
        Alu_fun_store <= {data_width{1'b0}} ;
    end
    else if ( alu_func_saved )
    begin
        Alu_fun_store <= i_Synced_Rx_D ;
    end
end

// store Wr_ADDR 
always @ ( posedge i_ref_clk or negedge i_rst_n ) 
begin
    if ( !i_rst_n )
    begin
        Wr_addr_store <= {data_width{1'b0}} ;
    end
    else if ( WR_ADDR_saved )
    begin
        Wr_addr_store <= i_Synced_Rx_D ;
    end
end

endmodule