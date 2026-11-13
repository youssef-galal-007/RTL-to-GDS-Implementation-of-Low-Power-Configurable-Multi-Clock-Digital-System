
module UART_TX_TOP #(parameter  data_width_Top = 8 
) (
    input                            i_clk_Top        ,         // domian 2 clk ( Uart_tx_clk )
    input                            i_rst_n_Top      ,         // domian 2 Active low reset

    input                            i_DATA_VALID_Top ,         // Input data valid signal
    input [ data_width_Top - 1 : 0 ] i_P_DATA_Top     ,         // Input data byte

    input                            i_PAR_EN_Top     ,         // Parity_Enable
    input                            i_PAR_TYP_Top    ,         // Parity Type

    output                           o_TX_OUT_Top     ,         // Serial Data OUT
    output                           o_Busy_Top                 // Busy flag ---> High during transmission
);

// internal signals 
wire ser_en , ser_done , ser_data ;

wire par_bit ;

wire [1:0] mux_sel ;

wire start_bit , stop_bit ;

// values for start and stop bits 
assign start_bit = 'b0 ;
assign stop_bit  = 'b1 ;

MUX M_Top (
    .i_mux_sel_M (mux_sel) ,
    .i_start_bit_M (start_bit) ,
    .i_stop_bit_M (stop_bit) ,
    .i_ser_data_M (ser_data) ,
    .i_par_bit_M (par_bit) ,
    .o_TX_OUT_M (o_TX_OUT_Top)
);

Control_unit_FSM FSM_Top (
    .i_clk_fsm (i_clk_Top) ,
    .i_rst_n_fsm (i_rst_n_Top) ,
    .i_Data_Valid_fsm (i_DATA_VALID_Top) ,
    .i_ser_done_fsm (ser_done) ,
    .i_PAR_EN_fsm (i_PAR_EN_Top) ,
    .o_ser_en_fsm (ser_en) ,
    .o_busy_fsm (o_Busy_Top) ,
    .o_mux_sel_fsm (mux_sel)
);

Parity_Calc #(.data_width(data_width_Top)
) PAR_Top (
    .i_clk_par (i_clk_Top) ,
    .i_rst_n_par (i_rst_n_Top) ,
    .i_P_Data_par (i_P_DATA_Top) ,
    .i_PAR_TYP_par (i_PAR_TYP_Top) ,
    .i_Data_Valid_par (i_DATA_VALID_Top) ,
    .i_busy_par (o_Busy_Top) ,
    .o_PAR_Bit_par (par_bit)
);

serializer_unit #(.data_width(data_width_Top)
) SER_Top (
    .i_clk_ser (i_clk_Top) ,
    .i_rst_n_ser (i_rst_n_Top) ,
    .i_P_Data_ser (i_P_DATA_Top) ,
    .i_SER_EN_ser (ser_en) ,
    .i_Data_Valid_ser (i_DATA_VALID_Top) ,
    .i_busy_ser (o_Busy_Top) ,
    .o_ser_done_ser (ser_done) ,
    .o_ser_data_ser (ser_data)
);

endmodule
