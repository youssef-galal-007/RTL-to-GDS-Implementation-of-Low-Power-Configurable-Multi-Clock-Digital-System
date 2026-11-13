module CLK_Div_Unit #(parameter max_div_ratio = 256 ,               // maximum divsion value 
                                div_bits      = 8                   // calculating needed bites 
)(
    input  wire                      i_ref_clk   ,          // domain 2 clk ( uart_clk )
    input  wire                      i_rst_n     ,          // domain 2 active low reset
    input  wire                      i_clk_en    ,          // clock enable
    input  wire [ div_bits - 1 : 0 ] i_div_ratio ,          // division ratio 

    output wire                      o_div_clk              // output divided clock 
);

// internal signals 
reg [ div_bits - 1 : 0 ]  clk_counter ;             // clock counter

wire                      clk_div_en  ;             // clock division enable 

wire [ div_bits - 1 : 0 ] half        ;  
wire                      odd         ;

reg                       toggle_flag ;
reg                       div_clk     ;              

// dividing div_ratio by 2 
assign half = i_div_ratio >> 1 ;  
// detecting if the div_ratio is odd by LSB in it       
assign odd  = i_div_ratio[0]   ;        

wire clock_sel ;

assign clock_sel = i_clk_en && ( i_div_ratio == 'd1 ) || ( i_div_ratio == 'd0 ) ;

// bypassing ref_clk if ( 0 & 1 ) else div_clk 
assign o_div_clk = clock_sel ? i_ref_clk : div_clk ;

// division enable condition 
assign clk_div_en = ( i_clk_en ) && ( i_div_ratio != 'd0 ) && ( i_div_ratio != 'd1 ) ;

// clock toggling logic 
always @( posedge i_ref_clk or negedge i_rst_n ) 
begin
    if ( !i_rst_n )
    begin
        div_clk     <= 'b0 ;
        toggle_flag <= 'b0 ;
    end
    else if ( clk_div_en )
    begin
        if ( !odd && (clk_counter == half - 1) )      // even condition 
        begin
            div_clk <= ~div_clk ;
        end
        else if (odd && ( ( (clk_counter == half - 1) && toggle_flag ) || ( (clk_counter == half) && !toggle_flag ) ) )    // odd condition
        begin
            div_clk     <= ~div_clk     ;
            toggle_flag <= ~toggle_flag ;
        end
    end
    else
    begin
        div_clk     <= 'b0 ;
        toggle_flag <= 'b0 ;
    end
end

// counter logic 
always @( posedge i_ref_clk or negedge i_rst_n ) 
begin
    if ( !i_rst_n )
    begin
        clk_counter <= {div_bits{1'b0}} ;
    end
    else if ( clk_div_en )
    begin
        if ( !odd && (clk_counter == half - 1 ) )    // even condition 
        begin
            clk_counter <= {div_bits{1'b0}} ;
        end
        else if (odd && ( ( (clk_counter == half - 1) && toggle_flag ) || ( (clk_counter == half) && !toggle_flag ) ) )    // odd condition
        begin
            clk_counter <= {div_bits{1'b0}} ;
        end
        else      // incrementing
        begin
            clk_counter <= clk_counter + 1'b1 ;
        end
    end
    else
    begin
        clk_counter <= {div_bits{1'b0}} ;
    end

end


endmodule
