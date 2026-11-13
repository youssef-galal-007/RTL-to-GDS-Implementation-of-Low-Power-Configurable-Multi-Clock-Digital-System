
module FIFO_RD #(parameter  address_W = 4 ,
                            pointer_w = 5
) (
    input wire                        i_r_clk_RD     ,          // domain 2 clk ( tx_clk )
    input wire                        i_r_rst_n_RD   ,          // domain 2 active low reset

    input wire                        i_r_inc_RD     ,          // read increament 
    input wire  [ pointer_w - 1 : 0 ] i_rq2_w_ptr_RD ,          // synchronized w_ptr to read domain 

    output wire [ pointer_w - 1 : 0 ] o_r_ptr_RD     ,          // output read pointer ( gray-coded )
    output wire [ address_W - 1 : 0 ] o_r_addr_RD    ,          // output read address
    output wire                       o_r_empty_RD              // empty flag     
);

// registers to preseve opertions results  
reg  [ pointer_w - 1 : 0 ] ptr_inBinary_r    ;
reg  [ pointer_w - 1 : 0 ] ptr_inGray_r      ;

// internal logic to calculate the next reading address
always @( posedge i_r_clk_RD or negedge i_r_rst_n_RD ) 
begin
    if ( !i_r_rst_n_RD )
    begin
        ptr_inBinary_r <= {pointer_w{1'b0}} ;
        ptr_inGray_r   <= {pointer_w{1'b0}} ;
    end
    else if ( i_r_inc_RD && !o_r_empty_RD )
    begin
        ptr_inBinary_r <= ptr_inBinary_r + 1'b1 ;
        // calculating the gray-coded pointer
        ptr_inGray_r   <= ( ptr_inBinary_r + 'b1 ) ^ ( ( ptr_inBinary_r + 'b1 ) >> 1 ) ;
    end
end

// sending out the address to the memory in binary 
assign o_r_addr_RD = ptr_inBinary_r [ address_W - 1 : 0 ] ;

// bringing out the gray-coded pointer to check on full signal in write module 
assign o_r_ptr_RD  = ptr_inGray_r ;

// empty condition 
assign o_r_empty_RD = ( i_rq2_w_ptr_RD == ptr_inGray_r ) ? 1'b1 : 1'b0 ;

endmodule