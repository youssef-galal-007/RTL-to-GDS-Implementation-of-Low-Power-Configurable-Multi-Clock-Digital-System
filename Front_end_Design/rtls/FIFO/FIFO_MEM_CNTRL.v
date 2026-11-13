
// Dual port RAM
module FIFO_MEM_CNTRL #(parameter   data_width_mem = 8  ,
                                    fifo_depth_mem = 16 ,
                                    address_W = 4 
) (
    input wire                              i_w_clk_mem     ,               // domain 1 clk ( ref_clk )
    input wire                              i_w_rst_n_mem   ,               // domain 1 active low reset

    input wire                              i_w_inc_mem     ,               // write increament 
    input wire                              i_w_full_mem    ,               // full flag

    input wire [ address_W - 1 : 0 ]        i_w_addr_mem    ,               // write address bus 
    input wire [ address_W - 1 : 0 ]        i_r_addr_mem    ,               // read  address bus 

    input wire [ data_width_mem - 1 : 0 ]   i_w_data_mem    ,               // write data bus 
    
    output     [ data_width_mem - 1 : 0 ]   o_r_data_mem                    // read  data bus 
);

// fifo memory 
reg [ data_width_mem - 1 : 0 ] fifo_memory [ fifo_depth_mem - 1 : 0 ] ;

integer address_i ;
wire i_w_clk_en   ;

// w_clk enable condition  
assign i_w_clk_en = i_w_inc_mem & !i_w_full_mem ;

// write port always-block  
always @ ( posedge i_w_clk_mem or negedge i_w_rst_n_mem )
begin
    if ( !i_w_rst_n_mem )
    begin
        for ( address_i = 0 ; address_i < fifo_depth_mem ; address_i = address_i + 1'b1 )
        begin
            fifo_memory [address_i] <= {data_width_mem{1'b0}} ;
        end
    end
    else if ( i_w_clk_en )
    begin
        // write data 
        fifo_memory [ i_w_addr_mem ] <= i_w_data_mem ;
    end
end

// Excuting read output 
assign o_r_data_mem = fifo_memory [i_r_addr_mem] ;


endmodule