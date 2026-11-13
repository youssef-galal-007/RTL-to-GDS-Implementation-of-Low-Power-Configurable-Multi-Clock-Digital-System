
module DF_SYNC #( parameter pointer_w = 5 ,
                            Num_stg   = 2 
) (
    input wire                            i_sync_clk_dff  ,         // Destination Clock Signal
    input wire                            i_rst_n_dff     ,         // Destination Active Low Reset
    input wire [ pointer_w - 1 : 0 ]      i_Async_bus_dff ,         // Unsynchronized bus ( gray-coded )
    
    output reg [ pointer_w - 1 : 0 ]      o_sync_bus_dff            // synchronized bus ( gray-coded )
);

integer bit_num ;

reg [ Num_stg - 1 : 0 ] sync_flops [ pointer_w - 1 : 0 ] ;

always @ ( posedge i_sync_clk_dff or negedge i_rst_n_dff )
begin
    if ( !i_rst_n_dff )
    begin
        for ( bit_num = 0 ; bit_num < pointer_w ; bit_num = bit_num + 1'b1 )
        begin
            // resetting all stage bits 
            sync_flops [bit_num] <= {Num_stg{1'b0}} ;
        end
    end
    else
    begin
        for ( bit_num = 0 ; bit_num < pointer_w ; bit_num = bit_num + 1'b1 )
        begin
            // synchronizing each bit from stage to another 
            sync_flops [bit_num] <= {sync_flops [bit_num][Num_stg - 2 : 0] , i_Async_bus_dff [bit_num]} ;
        end
    end
end

always @(*) 
begin
    for ( bit_num = 0 ; bit_num < pointer_w ; bit_num = bit_num + 1'b1 )
    begin
        // Excuting output 
        o_sync_bus_dff [bit_num] = sync_flops [bit_num] [Num_stg - 1] ;
    end
end
    
endmodule