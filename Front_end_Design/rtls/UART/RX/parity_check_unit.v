
module parity_check_unit #(parameter data_width_par = 8) (
    input                               i_clk_par           ,
    input                               i_rst_n_par         ,

    input                               i_errors_rst_par    ,       // input signal to clear the previous output value
    input                               i_par_chk_en_par    ,
    input                               i_par_typ_par       ,
    input                               i_sampled_bit_par   ,
    input   [data_width_par - 1 : 0]    i_P_data_par        ,

    output  reg                         o_par_err_par
);

// internal signal
wire exp_data_typ ;

// parity assignment  
assign  exp_data_typ =  i_par_typ_par ? ~(^i_P_data_par) : (^i_P_data_par) ;

always @( posedge i_clk_par or negedge i_rst_n_par ) 
begin
    if ( !i_rst_n_par )
    begin
        o_par_err_par <= 1'b0 ;
    end
    // clear the output at start of each new frame 
    else if ( i_errors_rst_par )
    begin
        o_par_err_par <= 1'b0 ;
    end
    else if ( i_par_chk_en_par )
    begin
        if ( i_sampled_bit_par != exp_data_typ )            // check parity error 
        begin
            o_par_err_par <= 1'b1 ;
        end
        else
        begin
            o_par_err_par <= 1'b0 ;
        end
    end
end
endmodule 
