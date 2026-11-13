
module stop_check_unit (
    input       i_clk_stp           ,
    input       i_rst_n_stp         ,
    input       i_stp_chk_en_stp    ,
    input       i_sampled_bit_stp   ,

    input       i_errors_rst_stp    ,           // input signal to clear the previous output value

    output reg  o_stp_err_stp       
);

always @( posedge i_clk_stp or negedge i_rst_n_stp ) 
begin
    if ( !i_rst_n_stp )
    begin
        o_stp_err_stp <= 1'b0 ;
    end
    // clear the output at start of each new frame 
    else if ( i_errors_rst_stp )
    begin
        o_stp_err_stp <= 1'b0 ;
    end
    
    else if ( i_stp_chk_en_stp )
    begin
        if ( i_sampled_bit_stp != 1'b1 )            // check stop error
        begin
            o_stp_err_stp <= 1'b1 ;
        end
        else
        begin
            o_stp_err_stp <= 1'b0 ;
        end
    end
end
endmodule
