
module Uart_RX_TOP #(parameter data_width_TOP    = 8 ,
                               prescale_bits_TOP = 6                    
) (
    input                               i_CLK_TOP           ,           // domian 2 clk ( Uart_tx_clk )
    input                               i_RST_n_TOP         ,           // domian 2 Active low reset

    input                               i_RX_IN_TOP         ,           // Serial Data IN

    input [ prescale_bits_TOP - 1 : 0 ] i_Prescale_TOP      ,           // Oversampling Prescale
    input                               i_PAR_EN_TOP        ,           // Parity_Enable
    input                               i_PAR_TYP_TOP       ,           // Parity Type

    output                              o_data_valid_TOP    ,           // Data Byte Valid signal
    output                              o_Stop_Error_TOP    ,           // Frame Stop Error
    output                              o_Parity_Error_TOP  ,           // Frame Parity Error

    output [ data_width_TOP - 1 : 0]    o_P_DATA_TOP                    // Frame Data Byte         
);

// internal logic to calculate the needed bits for bits counter 
localparam cnt_bits_TOP = $clog2(data_width_TOP) ;

// internal signals 
wire [ cnt_bits_TOP : 0 ]          bit_cnt_TOP      ;
wire [ prescale_bits_TOP - 1 : 0 ] edg_cnt_TOP      ;

wire       errors_rst_TOP   ;
wire       enable_ebc_TOP   ;
wire       dat_samp_en_TOP  ;
wire       deser_en_TOP     ;
wire       par_chk_en_TOP   ;
wire       stp_chk_en_TOP   ;
wire       strt_chk_en_TOP  ;

wire       strt_glitch_TOP  ;

wire       sampled_bit_TOP  ;


RX_FSM_control_unit #( .data_width_fsm      (data_width_TOP) ,
                       .prescale_bits_fsm   (prescale_bits_TOP)
) RX_FSM_CU (
    .i_clk_fsm          (i_CLK_TOP)             ,
    .i_rst_n_fsm        (i_RST_n_TOP)           ,

    .i_rx_in_fsm        (i_RX_IN_TOP)           ,
    .i_par_en_fsm       (i_PAR_EN_TOP)          ,

    .i_bit_cnt_fsm      (bit_cnt_TOP)           ,       
    .i_edg_cnt_fsm      (edg_cnt_TOP)           ,
    .i_prescale_fsm     (i_Prescale_TOP)        ,
       
    .i_par_err_fsm      (o_Parity_Error_TOP)    ,
    .i_stp_err_fsm      (o_Stop_Error_TOP)      ,
    .i_strt_glitch_fsm  (strt_glitch_TOP)     ,

    .o_errors_rst_fsm   (errors_rst_TOP)        ,
    .o_deser_en_fsm     (deser_en_TOP)          ,
    .o_enable_ebc_fsm   (enable_ebc_TOP)        ,
    .o_par_chk_en_fsm   (par_chk_en_TOP)        ,
    .o_stp_chk_en_fsm   (stp_chk_en_TOP)        ,
    .o_strt_chk_en_fsm  (strt_chk_en_TOP)       ,
    .o_dat_samp_en_fsm  (dat_samp_en_TOP)       ,

    .o_data_valid_fsm   (o_data_valid_TOP)      
);

edge_bit_cnt_unit #( .data_width_ebc    (data_width_TOP) ,
                     .prescale_bits_ebc (prescale_bits_TOP) 
) EBC_U (
    .i_clk_ebc      (i_CLK_TOP)         ,
    .i_rst_n_ebc    (i_RST_n_TOP)       ,
    .i_enable_ebc   (enable_ebc_TOP)    ,
    .i_par_en_ebc   (i_PAR_EN_TOP)      ,
    .i_prescale_ebc (i_Prescale_TOP)    ,

    .o_bit_cnt_ebc  (bit_cnt_TOP)       ,
    .o_edg_cnt_ebc  (edg_cnt_TOP)       
);

data_sampling_unit #( .prescale_bits_DS (prescale_bits_TOP) 
) DS_U (
    .i_clk_ds           (i_CLK_TOP)       ,
    .i_rst_n_ds         (i_RST_n_TOP)     ,

    .i_rx_in_ds         (i_RX_IN_TOP)     , 

    .i_edg_cnt_ds       (edg_cnt_TOP)     ,
    .i_prescale_ds      (i_Prescale_TOP)  ,
    .i_dat_samp_en_ds   (dat_samp_en_TOP) ,

    .o_sampled_bit_ds   (sampled_bit_TOP) 
);

deserializer_unit #( .data_width_deser (data_width_TOP) ,
                     .prescale_bits_deser (prescale_bits_TOP)
) DESER_U (
    .i_clk_deser            (i_CLK_TOP)         ,
    .i_rst_n_deser          (i_RST_n_TOP)       ,

    .i_bit_cnt_deser        (bit_cnt_TOP)       ,
    .i_edg_cnt_deser        (edg_cnt_TOP)       ,
    .i_prescale_deser       (i_Prescale_TOP)    ,

    .i_deser_en_deser       (deser_en_TOP)      ,
    .i_sampled_bit_deser    (sampled_bit_TOP)   ,

    .o_P_data_deser         (o_P_DATA_TOP)
);

parity_check_unit #(.data_width_par (data_width_TOP)) PAR_U (
    .i_clk_par          (i_CLK_TOP)       ,
    .i_rst_n_par        (i_RST_n_TOP)     ,

    .i_P_data_par       (o_P_DATA_TOP)    ,
    .i_par_typ_par      (i_PAR_TYP_TOP)   ,
    .i_par_chk_en_par   (par_chk_en_TOP)  ,
    .i_errors_rst_par   (errors_rst_TOP)  ,
    .i_sampled_bit_par  (sampled_bit_TOP) ,

    .o_par_err_par      (o_Parity_Error_TOP)     
);

stop_check_unit STP_U (
    .i_clk_stp          (i_CLK_TOP)       ,
    .i_rst_n_stp        (i_RST_n_TOP)     ,

    .i_stp_chk_en_stp   (stp_chk_en_TOP)  ,
    .i_errors_rst_stp   (errors_rst_TOP)  ,
    .i_sampled_bit_stp  (sampled_bit_TOP) ,

    .o_stp_err_stp      (o_Stop_Error_TOP)
);

strt_check_unit STR_U (
    .i_strt_chk_en_strt (strt_chk_en_TOP) ,
    .i_sampled_bit_strt (sampled_bit_TOP) ,
    
    .o_strt_glitch      (strt_glitch_TOP)
);

endmodule
