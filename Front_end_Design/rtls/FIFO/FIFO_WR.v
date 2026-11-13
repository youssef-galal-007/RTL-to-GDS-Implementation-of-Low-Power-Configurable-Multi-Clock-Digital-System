
module FIFO_WR #(parameter  address_W = 4 ,
                            pointer_w = 5
) (
    input wire                        i_w_clk_WR     ,          // domain 1 clk ( ref_clk )
    input wire                        i_w_rst_n_WR   ,          // domain 1 active low reset

    input wire                        i_w_inc_WR     ,          // write increament 
    input wire  [ pointer_w - 1 : 0 ] i_wq2_r_ptr_WR ,          // synchronized r_ptr to write domain 

    output wire [ pointer_w - 1 : 0 ] o_w_ptr_WR     ,          // output write pointer ( gray-coded )
    output wire [ address_W - 1 : 0 ] o_w_addr_WR    ,          // output write address
    output wire                       o_w_full_WR               // full flag
);

// registers to preseve opertions results
reg  [ pointer_w - 1 : 0 ] ptr_inBinary_w   ; 
reg  [ pointer_w - 1 : 0 ] ptr_inGray_w     ;

// internal logic to calculate the next writing address
always @( posedge i_w_clk_WR or negedge i_w_rst_n_WR ) 
begin
    if ( !i_w_rst_n_WR )
    begin
        ptr_inBinary_w <= {pointer_w{1'b0}} ;
        ptr_inGray_w   <= {pointer_w{1'b0}} ;
    end
    else if ( i_w_inc_WR && !o_w_full_WR )
    begin
        ptr_inBinary_w <= ptr_inBinary_w + 1'b1 ;
        // calculating the gray-coded pointer 
        ptr_inGray_w   <= (ptr_inBinary_w + 'b1 ) ^ ( (ptr_inBinary_w + 'b1 ) >> 1 ) ;
    end
end

// sending out the address to the memory in binary 
assign o_w_addr_WR = ptr_inBinary_w [ address_W - 1 : 0 ] ;

// bringing out the gray-coded pointer to check on empty signal in read module 
assign o_w_ptr_WR = ptr_inGray_w ;

// full condition 
assign o_w_full_WR = ( i_wq2_r_ptr_WR[pointer_w - 1]   != ptr_inGray_w[pointer_w - 1]   ) &&
                     ( i_wq2_r_ptr_WR[pointer_w - 2]   != ptr_inGray_w[pointer_w - 2]   ) &&
                     ( i_wq2_r_ptr_WR[pointer_w - 3:0] == ptr_inGray_w[pointer_w - 3:0] )
                     ? 1'b1 : 1'b0 ;

endmodule