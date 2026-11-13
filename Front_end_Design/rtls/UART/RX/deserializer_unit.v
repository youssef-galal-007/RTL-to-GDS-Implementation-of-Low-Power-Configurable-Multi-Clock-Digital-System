
module deserializer_unit #(
    parameter data_width_deser = 8 ,
              prescale_bits_deser = 6 ,
              cnt_bits_deser = $clog2(data_width_deser)
)(
    input                                   i_clk_deser           ,
    input                                   i_rst_n_deser         ,
    input                                   i_deser_en_deser      ,
    input                                   i_sampled_bit_deser   ,
    input      [cnt_bits_deser : 0]         i_bit_cnt_deser       ,
    input      [prescale_bits_deser - 1 : 0]i_edg_cnt_deser       ,
    input      [prescale_bits_deser - 1 : 0]i_prescale_deser      ,

    output reg [data_width_deser - 1 : 0]   o_P_data_deser        
);

// internal register 
reg [ data_width_deser - 1 : 0 ] stored_data ;

//  P_data logic 
always @( posedge i_clk_deser or negedge i_rst_n_deser ) 
begin
    if ( !i_rst_n_deser ) 
    begin
        o_P_data_deser <= {data_width_deser{1'b0}} ;
    end
    // output excuting condition 
    else if ( i_deser_en_deser && i_bit_cnt_deser == data_width_deser && i_edg_cnt_deser == i_prescale_deser - 1  )
    begin
        o_P_data_deser <= stored_data ;
    end
end

//  stored register logic
always @( posedge i_clk_deser or negedge i_rst_n_deser ) 
begin
    if ( !i_rst_n_deser ) 
    begin
        stored_data <= {data_width_deser{1'b0}} ;
    end
    else if ( i_deser_en_deser && i_bit_cnt_deser <= data_width_deser && i_edg_cnt_deser == i_prescale_deser - 2 )
    begin
        // shifting bits in the store register   
        stored_data <= { i_sampled_bit_deser , stored_data[data_width_deser - 1 :1] } ;

        /*  another shifting method
        stored_data <= { stored_data[data_width_deser - 2 :0] , i_sampled_bit_deser } ;
        */
    end
end


endmodule