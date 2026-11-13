
module Reg_File #( parameter R_Width = 8  , 
                             R_Depth = 16 ,
                             R_Adderss_Bits = 4 
)(
    input                                 i_clk_reg     ,           // domain 1 clk ( ref_clk )
    input                                 i_rst_n_reg   ,           // active low reset 

    input                                 i_RdEn_reg    ,           // Read Enable
    input                                 i_WrEn_reg    ,           // Write Enable
    input      [ R_Width - 1 : 0 ]        i_WrData_reg  ,           // Write Data Bus
    input      [ R_Adderss_Bits - 1 : 0 ] i_Address_reg ,           // Address bus

    output     [ R_Width - 1 : 0 ]        o_REG0_reg    ,           // Register at Address 0x0  ( operand A )
    output     [ R_Width - 1 : 0 ]        o_REG1_reg    ,           // Register at Address 0x1  ( operand B )
    output     [ R_Width - 1 : 0 ]        o_REG2_reg    ,           // Register at Address 0x2  ( Uart_config )
    output     [ R_Width - 1 : 0 ]        o_REG3_reg    ,           // Register at Address 0x3  ( Clk_Div_Ratio )

    output reg                            o_Valid_reg   ,           // Read Data Valid 
    output reg [ R_Width - 1 : 0 ]        o_RdData_reg              // Read Data Bus
);

// data memory 
reg [ R_Width - 1 : 0 ] Reg_F [ R_Depth - 1 : 0 ] ;

integer i ;

always @ ( posedge i_clk_reg or negedge i_rst_n_reg )
begin
    if ( !i_rst_n_reg )
    begin
        // resetting each register to it's default  
        for ( i = 0 ; i < R_Depth ; i = i + 1'b1 )
        begin
            if( i == 2 )            // uart_config (default) ---> [7:2] prescale = 32 , [1] par_typ = 0(even), [0] par_en = 1 
            begin
                Reg_F[i] <= 'b100000_01 ;
            end
            else if ( i == 3 )      // clk_div_ratio (default) = 32  
            begin
                Reg_F[i] <= 'b00_100000 ;
            end 
            else                    // reset others to zero normally 
            begin
                Reg_F[i] <= {R_Width{1'b0}} ;
            end    
        end
        o_RdData_reg <= {R_Width{1'b0}} ;
        o_Valid_reg  <= 'b0 ;
    end
    else
    begin
        // write process
        if ( i_WrEn_reg && !i_RdEn_reg )
        begin
            Reg_F [ i_Address_reg ] <= i_WrData_reg ;
        end
        // read process 
        if ( i_RdEn_reg && !i_WrEn_reg )
        begin
            o_RdData_reg <= Reg_F [ i_Address_reg ] ;
            o_Valid_reg  <= 'b1 ;
        end
        else 
        begin
            o_Valid_reg  <= 'b0 ;
        end
    end
end

/*
always @ ( posedge i_clk_reg or negedge i_rst_n_reg )
begin
    if ( !i_rst_n_reg )
    begin
        o_REG2_reg <= {R_Width{1'b0}} ;
    end
    else
    begin
        o_REG2_reg <= Reg_F [2] ;
    end
end*/
 
// instantly update each out registers 
assign o_REG0_reg = Reg_F [0] ;
assign o_REG1_reg = Reg_F [1] ;
assign o_REG2_reg = Reg_F [2] ;
assign o_REG3_reg = Reg_F [3] ;

endmodule
