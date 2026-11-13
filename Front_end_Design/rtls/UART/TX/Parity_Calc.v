module Parity_Calc #(parameter data_width = 8 )(
    input                        i_clk_par        ,
    input                        i_rst_n_par      ,
    input [ data_width - 1 : 0 ] i_P_Data_par     ,
    input                        i_PAR_TYP_par    ,
    input                        i_Data_Valid_par ,
    input                        i_busy_par       ,
    output reg                   o_PAR_Bit_par 
);

always @ (posedge i_clk_par or negedge i_rst_n_par )
begin
    if ( !i_rst_n_par )
    begin
        o_PAR_Bit_par <= 'b0 ;
    end
    else if ( i_Data_Valid_par && !i_busy_par )
    begin
        if ( i_PAR_TYP_par )
        begin
            o_PAR_Bit_par <= ~(^i_P_Data_par) ;             // if odd parity configration
        end
        else
        begin
            o_PAR_Bit_par <= ^i_P_Data_par ;                // if even parity configration
        end
    end
end

endmodule

