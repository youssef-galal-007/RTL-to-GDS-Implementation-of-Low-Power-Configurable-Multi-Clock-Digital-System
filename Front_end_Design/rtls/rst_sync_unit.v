
module rst_sync_unit #(parameter Num_stg = 2 
) (
    input           i_clk           ,           // Clock Signal
    input           i_rst_n_Async   ,           // Active Low Async Reset
    
    output          o_rst_n_Sync                // Active Low synchronized Reset   
);

reg [ Num_stg - 1 : 0 ] Sync_reg ;

always @ ( posedge i_clk or negedge i_rst_n_Async)
begin
    if ( !i_rst_n_Async )
    begin
        Sync_reg <= {Num_stg{1'b0}} ;
    end
    else
    begin
        Sync_reg <= {Sync_reg[Num_stg - 2 : 0],1'b1} ;          // pushing 1 to make it active low rst sync with clk
    end
end

// out from last stage 
assign o_rst_n_Sync = Sync_reg[Num_stg-1] ;

endmodule