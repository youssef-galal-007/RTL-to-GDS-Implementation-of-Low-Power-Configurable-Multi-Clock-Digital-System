
module data_sampling_unit #(parameter   prescale_bits_DS = 6 
) (
    input                            i_clk_ds            ,
    input                            i_rst_n_ds          ,
    input                            i_rx_in_ds          ,
    input [prescale_bits_DS - 1 : 0] i_edg_cnt_ds        ,
    input [prescale_bits_DS - 1 : 0] i_prescale_ds       ,
    input                            i_dat_samp_en_ds    ,
    
    output                           o_sampled_bit_ds    
);

// internal signals 
wire [prescale_bits_DS - 1 :0] mid_bit;
reg sample_0 , sample_1 , sample_2 ;

// detecting the middle sample 
assign mid_bit = ( i_prescale_ds >> 1 ) ;

// verified sampled bit 
assign o_sampled_bit_ds = ( sample_0 & sample_1 ) | ( sample_1 & sample_2 ) | ( sample_2 & sample_0 ) ;

// always block to take the samples
always @( posedge i_clk_ds or negedge i_rst_n_ds ) 
begin
    if ( !i_rst_n_ds ) 
    begin
        sample_0 <= 'b0 ;
        sample_1 <= 'b0 ;
        sample_2 <= 'b0 ;
    end
    else if ( i_dat_samp_en_ds )
    begin
        // sample_1
        if ( i_edg_cnt_ds == mid_bit - 1 )
        begin
            sample_0 <= i_rx_in_ds ;
        end
        // sample_2 
        if ( i_edg_cnt_ds == mid_bit )
        begin
            sample_1 <= i_rx_in_ds ;
        end
        // sample_3  
        if ( i_edg_cnt_ds == mid_bit + 1 )
        begin
            sample_2 <= i_rx_in_ds ;
        end
    end
end



endmodule
