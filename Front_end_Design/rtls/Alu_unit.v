
module Alu_unit #(parameter  op_width = 8            
)(
    input                          i_clk_alu       ,            // domain 1 clk ( ref_clk )
    input                          i_rst_n_alu     ,            // active low reset

    input       [op_width - 1:0]   i_OP_A_alu      ,            // Operand A 
    input       [op_width - 1:0]   i_OP_B_alu      ,            // Operand B 
    
    input                          i_Enable_alu    ,            // ALU_Enable 
    input       [3:0]              i_ALU_FUN_alu   ,            // Operation choosing code

    /*output reg        Carry_flag ,  // High at carry in add Or borrow in sub
    output reg        Arith_flag ,  // High when Arith op. happens
    output reg        Logic_flag ,  // High when Logic op. happens
    output reg        CMP_flag ,    // High when CMP op. happens
    output reg        Shift_flag ,*/  // High when Shift op. happens

    output reg  [2*op_width - 1:0] o_ALU_OUT     ,              // System result output
    output reg                     o_VALID_alu                  // high while any operaton 
);

// signal to register operations results
reg [2*op_width - 1:0] ALU_Result_reg ;
reg                    VALID_alu_comb ;

// making the ALU_OUT & VALD sync. with clk
always @ ( posedge i_clk_alu or negedge i_rst_n_alu ) 
begin
    if ( !i_rst_n_alu )
    begin
        o_ALU_OUT   <= 'd0 ;
        o_VALID_alu <= 'd0 ;
    end
    else
    begin
        o_ALU_OUT   <= ALU_Result_reg ;
        o_VALID_alu <= VALID_alu_comb ;
    end
end

// ALU Combinational Logic
always @ (*)
begin
    // Initialization
    ALU_Result_reg = 'd0 ;
    VALID_alu_comb = 'b0 ;

    if ( i_Enable_alu )
    begin
        VALID_alu_comb = 'b1 ;
        // Execute the operation specified by ALU_FUN
        case ( i_ALU_FUN_alu )
            // Addition case 
            4'b0000 :
            begin
                ALU_Result_reg = i_OP_A_alu + i_OP_B_alu ;
            end

            // Subtraction case
            4'b0001 :
            begin
                ALU_Result_reg = i_OP_A_alu - i_OP_B_alu ;
            end

            // Multiplication case
            4'b0010 :
            begin
                ALU_Result_reg = i_OP_A_alu * i_OP_B_alu ;
            end

            // Division case
            4'b0011 :
            begin
                if ( i_OP_B_alu == 'b0 )
                begin
                    ALU_Result_reg = 'd0 ;
                end
                else
                begin
                    ALU_Result_reg = i_OP_A_alu / i_OP_B_alu ;
                end
            end

            // AND case
            4'b0100 :
            begin
                ALU_Result_reg = i_OP_A_alu & i_OP_B_alu ;
            end

            // OR case
            4'b0101 :
            begin
                ALU_Result_reg = i_OP_A_alu | i_OP_B_alu ;
            end

            // NAND case
            4'b0110 :
            begin
                ALU_Result_reg = ~( i_OP_A_alu & i_OP_B_alu ) ;
            end

            // NOR case
            4'b0111 :
            begin
                ALU_Result_reg = ~( i_OP_A_alu | i_OP_B_alu ) ;
            end

            // XOR case
            4'b1000 :
            begin
                ALU_Result_reg = i_OP_A_alu ^ i_OP_B_alu ;
            end

            // XNOR case
            4'b1001 :
            begin
                ALU_Result_reg = ~( i_OP_A_alu ^ i_OP_B_alu ) ;
            end

            // A equal B case
            4'b1010 :
            begin
                ALU_Result_reg = ( i_OP_A_alu == i_OP_B_alu ) ? 'b1 : 'b0  ;
            end

            // A greater than B case
            4'b1011 :
            begin
                ALU_Result_reg = ( i_OP_A_alu > i_OP_B_alu ) ? 'd2 : 'b0  ;
            end

            // A smaller than B case
            4'b1100 :
            begin
                ALU_Result_reg = ( i_OP_A_alu < i_OP_B_alu ) ? 'd3 : 'b0  ;
            end

            // A shifted right by 1 
            4'b1101 :
            begin
                ALU_Result_reg = i_OP_A_alu >> 1  ;
            end

            // A shifted left by 1
            4'b1110 :
            begin
                ALU_Result_reg = i_OP_A_alu << 1  ;
            end

            // No Operation ( NOP )
            default : 
            begin
                ALU_Result_reg = 'd0 ;
            end
        endcase
    end
    else
    begin
        VALID_alu_comb = 'b0 ;
        ALU_Result_reg = 'd0 ;
    end      
end


endmodule