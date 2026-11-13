
module Async_FIFO_Top #( parameter data_width = 8  ,
                                   fifo_depth = 16 ,
                                   NUM_STG_DFF= 2  
) (
    input  wire                        i_w_clk   ,          // domain 1 clk ( ref_clk )
    input  wire                        i_w_rst_n ,          // domain 1 active low reset
    input  wire                        i_w_inc   ,          // write increament 

    input  wire [ data_width - 1 : 0 ] i_WR_DATA ,          // write data bus 

    input  wire                        i_r_clk   ,          // domain 2 clk ( tx_clk )
    input  wire                        i_r_rst_n ,          // domain 2 active low reset
    input  wire                        i_r_inc   ,          // read increament

    output wire [ data_width - 1 : 0 ] o_RD_DATA ,          // read  data bus 
    output wire                        o_EMPTY   ,          // fifo empty flag 
    output wire                        o_FULL               // fifo full flag 
);

// address & pointer width calculations
localparam  address_W = $clog2 (fifo_depth) ,
            pointer_w = $clog2 (fifo_depth) + 1'b1 ;

// internal signals 
wire [ pointer_w - 1 : 0 ] w_ptr     , r_ptr     ;
wire [ pointer_w - 1 : 0 ] rq2_w_ptr , wq2_r_ptr ;

wire [ address_W - 1 : 0 ] w_addr    , r_addr    ;

// wrtie to read synchronizer 
DF_SYNC #(  .pointer_w (pointer_w) ,
            .Num_stg   (NUM_STG_DFF)
) sync_w2r (
    .i_sync_clk_dff     (i_r_clk)   ,
    .i_rst_n_dff        (i_r_rst_n) ,
    .i_Async_bus_dff    (w_ptr)     ,

    .o_sync_bus_dff     (rq2_w_ptr)
);

// read to write synchronizer 
DF_SYNC #(  .pointer_w (pointer_w) ,
            .Num_stg   (NUM_STG_DFF)
) sync_r2w (
    .i_sync_clk_dff     (i_w_clk)   ,
    .i_rst_n_dff        (i_w_rst_n) ,
    .i_Async_bus_dff    (r_ptr)     ,

    .o_sync_bus_dff     (wq2_r_ptr)
);

// Dual Port RAM
FIFO_MEM_CNTRL #(   .data_width_mem (data_width) ,
                    .fifo_depth_mem (fifo_depth) ,
                    .address_W      (address_W)
) FIFO_MEMO (
    .i_w_clk_mem    (i_w_clk)   ,
    .i_w_rst_n_mem  (i_w_rst_n) ,

    .i_w_inc_mem    (i_w_inc)   ,
    .i_w_full_mem   (o_FULL)    ,

    .i_w_addr_mem   (w_addr)    ,
    .i_r_addr_mem   (r_addr)    ,

    .i_w_data_mem   (i_WR_DATA) ,

    .o_r_data_mem   (o_RD_DATA) 
);

// write module 
FIFO_WR #(  .address_W  (address_W) ,
            .pointer_w  (pointer_w)
) FIFO_WRITE (
    .i_w_clk_WR     (i_w_clk)   ,
    .i_w_rst_n_WR   (i_w_rst_n) ,

    .i_w_inc_WR     (i_w_inc)   ,
    .i_wq2_r_ptr_WR (wq2_r_ptr) ,

    .o_w_ptr_WR     (w_ptr)     ,
    .o_w_addr_WR    (w_addr)    ,
    .o_w_full_WR    (o_FULL)    
);

// read module 
FIFO_RD #(  .address_W  (address_W) ,
            .pointer_w  (pointer_w)
) FIFO_READ (
    .i_r_clk_RD     (i_r_clk)   ,
    .i_r_rst_n_RD   (i_r_rst_n) ,

    .i_r_inc_RD     (i_r_inc)   ,
    .i_rq2_w_ptr_RD (rq2_w_ptr) ,

    .o_r_ptr_RD     (r_ptr)     ,
    .o_r_addr_RD    (r_addr)    ,
    .o_r_empty_RD   (o_EMPTY)    
);

endmodule