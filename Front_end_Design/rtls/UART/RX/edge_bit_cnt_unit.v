
module edge_bit_cnt_unit #(
    parameter data_width_ebc = 8 ,
              prescale_bits_ebc = 6 ,
              cnt_bits_ebc = $clog2(data_width_ebc) 
)(
    input                                i_clk_ebc       ,
    input                                i_rst_n_ebc     ,
    input                                i_enable_ebc    ,
    input                                i_par_en_ebc    ,
    input      [prescale_bits_ebc - 1:0] i_prescale_ebc  ,

    output reg [cnt_bits_ebc:0]          o_bit_cnt_ebc   ,
    output reg [prescale_bits_ebc - 1:0] o_edg_cnt_ebc   
);

// always to count the bits 
always @( posedge i_clk_ebc or negedge i_rst_n_ebc ) 
begin
    if ( !i_rst_n_ebc )
    begin
        o_bit_cnt_ebc <= {(cnt_bits_ebc+1){1'b0}} ;
    end
    else if ( i_enable_ebc && ( o_edg_cnt_ebc == i_prescale_ebc - 1 ) )
    begin
        if ( i_par_en_ebc )
        begin
            if ( o_bit_cnt_ebc == data_width_ebc + 2 )
            begin
                o_bit_cnt_ebc <= {(cnt_bits_ebc+1){1'b0}} ;
            end
            else
            begin
                o_bit_cnt_ebc <= o_bit_cnt_ebc + 1'd1 ;
            end
        end
        else
        begin
            if ( o_bit_cnt_ebc == data_width_ebc + 1 )
            begin
                o_bit_cnt_ebc <= {(cnt_bits_ebc+1){1'b0}} ;
            end
            else
            begin
                o_bit_cnt_ebc <= o_bit_cnt_ebc + 1'd1 ;
            end
        end
    end
    else if ( !i_enable_ebc )
    begin
        o_bit_cnt_ebc <= {(cnt_bits_ebc+1){1'b0}} ;
    end
end

// alwyas to count the edges in each bit 
always @( posedge i_clk_ebc or negedge i_rst_n_ebc ) 
begin
    if ( !i_rst_n_ebc )
    begin
        o_edg_cnt_ebc <= {prescale_bits_ebc{1'b0}} ;
    end
    else if ( i_enable_ebc )
    begin
        if ( o_edg_cnt_ebc == i_prescale_ebc - 1 )
        begin
            o_edg_cnt_ebc <= {prescale_bits_ebc{1'b0}} ;
        end
        else
        begin
            o_edg_cnt_ebc <= o_edg_cnt_ebc + 1'd1 ;
        end
    end
    else
    begin
        o_edg_cnt_ebc <= {prescale_bits_ebc{1'b0}} ;
    end
end

endmodule 