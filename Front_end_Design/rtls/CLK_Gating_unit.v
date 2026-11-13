
module CLK_Gating_unit (
    input           i_ref_clk ,         // domain 1 clk ( ref_clk )
    input           i_gate_en ,         // Clock Enable

    output          o_gated_clk         // Gated Clock signal
);

reg latch ;

assign o_gated_clk = i_ref_clk & latch ;

always @( i_ref_clk or i_gate_en ) 
begin
    if ( !i_ref_clk )
    begin
        latch <= i_gate_en ;
    end
end

/*
TLATNCAX12M U0_TLATNCAX12M (
    .E      (i_gate_en)  ,
    .CK     (i_ref_clk)  ,
    .ECK    (o_gated_clk)
);*/

endmodule
