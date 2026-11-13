
module serializer_unit #(parameter  data_width = 8
) (
    input                        i_clk_ser        ,
    input                        i_rst_n_ser      ,
    input [ data_width - 1 : 0 ] i_P_Data_ser     ,
    input                        i_SER_EN_ser     ,
    input                        i_Data_Valid_ser ,
    input                        i_busy_ser       ,
    output                       o_ser_done_ser   ,
    output                       o_ser_data_ser 
);

localparam max_count_bits = $clog2( data_width );                   // paramter to calculate the counter bits

integer i ;
reg [ data_width - 1 : 0 ] SERIALIZER_Reg_F ;                       // register to store the input data 
reg [ max_count_bits - 1 : 0 ] counter ;                            // counting elemet

assign o_ser_data_ser = SERIALIZER_Reg_F[0] ;                       // assigning output immediately

// serializer operating logic 
always @( posedge i_clk_ser or negedge i_rst_n_ser ) 
begin
    if ( !i_rst_n_ser )
    begin
        SERIALIZER_Reg_F <= {data_width{1'b0}} ;                    // reseting the Reg_F in one line by {N{value}} which means repeat value , N times 
    end
    else if ( i_Data_Valid_ser && !i_busy_ser )
    begin
        SERIALIZER_Reg_F <= i_P_Data_ser ;                          // to load the data one time 
    end
    else if ( i_SER_EN_ser && !o_ser_done_ser )
    begin
        SERIALIZER_Reg_F <= SERIALIZER_Reg_F >> 1 ;                 // to shift the register one bit each time 
    end
end

// counter logic ( starting & stoping conditions )
always @ ( posedge i_clk_ser or negedge i_rst_n_ser )
begin
    if ( !i_rst_n_ser )
    begin
        counter <= {max_count_bits{1'b0}} ;                         // reseting the counter 
    end
    else if ( i_SER_EN_ser && !o_ser_done_ser )
    begin
        counter <= counter + 'b1 ;                                  // increamenting 
    end
    else if ( o_ser_done_ser )
    begin
        counter <= {max_count_bits{1'b0}} ;                         // reseting the counter 
    end

end

// Excuting the serial done flag 
assign o_ser_done_ser = ( counter == (data_width - 1) ) ? 1'b1 : 1'b0 ;


endmodule 
