
module pulse_gen_unit 
(
    input               i_clk_PG        ,           // domain 2 clk ( Uart_tx_clk )
    input               i_rst_n_PG      ,           // domain 2 Active low Reset 

    input               i_lvl_sig_PG    ,           // Level signal

    output              o_pulse_sig_PG              // output generated pulse 
);

// double flop to metegate metastability 
reg pulse_gen_ff ;

// pulse generation logic 
assign o_pulse_sig_PG = i_lvl_sig_PG & ~(pulse_gen_ff) ;

always @(posedge i_clk_PG or negedge i_rst_n_PG ) 
begin
    if ( !i_rst_n_PG )
    begin
        pulse_gen_ff <= 'b0 ;
    end
    else
    begin
        pulse_gen_ff <= i_lvl_sig_PG ;
    end
end

endmodule 