
module Uart_TOP #(parameter data_width    = 8 ,
                            prescale_bits = 6 
) (
    // tx i/p
    input                       i_TX_clk          ,       // domian 2 clk ( Uart_tx_clk )
    input [data_width - 1:0]    i_TX_IN_P         ,       // Input data byte
    input                       i_TX_data_valid   ,       // Input data valid signal
    
    // rx i/p
    input                       i_RX_clk          ,       // domian 2 clk ( Uart_rx_clk )
    input                       i_RX_IN_S         ,       // Serial Data IN
    input [prescale_bits - 1:0] i_RX_prescale     ,       // Oversampling Prescale

    // common i/p
    input                       i_rst_n           ,       // domian 2 Active low reset
    input                       i_par_en          ,       // Parity_Enable
    input                       i_par_typ         ,       // Parity Type

    // tx o/p
    output                      o_TX_OUT_S        ,       // Serial Data OUT
    output                      o_TX_Busy         ,       // Busy flag ---> High during transmission

    // rx o/p
    output                      o_RX_data_valid   ,       // Data Byte Valid signal
    output                      o_RX_Stop_Error   ,       // Frame Stop Error
    output                      o_RX_Parity_Error ,       // Frame Parity Error
    output [data_width - 1:0]   o_RX_OUT_P                // Frame Data Byte
);

// TX
UART_TX_TOP #(.data_width_Top   (data_width) 
) U_TX (
    .i_clk_Top          (i_TX_clk)        ,
    .i_rst_n_Top        (i_rst_n)         ,

    .i_DATA_VALID_Top   (i_TX_data_valid) ,
    .i_P_DATA_Top       (i_TX_IN_P)       ,

    .i_PAR_EN_Top       (i_par_en)        ,
    .i_PAR_TYP_Top      (i_par_typ)       ,

    .o_TX_OUT_Top       (o_TX_OUT_S)      ,
    .o_Busy_Top         (o_TX_Busy)
);

// RX
Uart_RX_TOP #(  .data_width_TOP    (data_width) ,
                .prescale_bits_TOP (prescale_bits)
) U_RX (
    .i_CLK_TOP          (i_RX_clk)          ,
    .i_RST_n_TOP        (i_rst_n)           ,

    .i_RX_IN_TOP        (i_RX_IN_S)         ,
    .i_Prescale_TOP     (i_RX_prescale)     ,

    .i_PAR_EN_TOP       (i_par_en)          ,
    .i_PAR_TYP_TOP      (i_par_typ)         ,

    .o_data_valid_TOP   (o_RX_data_valid)   ,
    .o_Stop_Error_TOP   (o_RX_Stop_Error)   ,
    .o_Parity_Error_TOP (o_RX_Parity_Error) ,

    .o_P_DATA_TOP       (o_RX_OUT_P)
);

endmodule 