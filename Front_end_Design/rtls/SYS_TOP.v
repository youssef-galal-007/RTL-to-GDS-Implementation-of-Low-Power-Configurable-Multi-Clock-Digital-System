
module SYS_TOP 
(
    input                   i_Ref_Clk          ,
    input                   i_Uart_Clk         ,
    input                   i_RST_n            ,
    input                   i_RX_IN_sys        ,

    output                  o_Stop_Error_sys   ,
    output                  o_Parity_Error_sys ,
    output                  o_TX_OUT_sys
);

// important configrations 
localparam  data_w            = 8                         ,
            REG_F_Depth       = 16                        ,
            REG_F_Addr_Bits   = $clog2(REG_F_Depth)       ,

            max_div_ratio_sys = 256                       ,
            div_bits_sys      = $clog2(max_div_ratio_sys) ,

            rst_sync_Num_stg  = 2                         ,
            data_sync_Num_stg = 2                         ,

            fifo_depth_sys    = 16                        ,
            
            prescale_bits     = 6                         ;

// clock gate signals 
wire ALU_CLK ;

// RST SYNC 1 ( domain 1 )
wire Sync_Rst_1 ;

// RST SYNC 2 ( domain 2 )
wire Sync_Rst_2 ;

// TX Clock divider signal
wire TX_clk ;

// RX Clock divider signal
wire RX_clk  ;

// clock divider mux signal 
wire [data_w - 1 : 0] Rx_Div_ratio ;

// pulse generator siganl
wire RD_INC ;

// RX signals
wire [ data_w - 1 : 0 ] unSync_RX_D   ;
wire                    unSync_RX_VLD ;

// TX signal
wire busy ;

// Data Synchronizer 
// to system control 
wire [ data_w - 1 : 0 ] Synced_RX_D   ;
wire                    Synced_RX_VLD ;

// ALU signals 
// to system control 
wire [ 2*data_w - 1 : 0 ] ALU_OUT   ;
wire                      OUT_Valid ;

// FIFO signals 
wire Fifo_full , Fifo_empty     ;
wire [ data_w - 1 : 0 ] RD_DATA ;

// Register File signals
// 1. to system control 
wire [ data_w - 1 : 0 ] Rd_D        ;
wire                    Rd_D_vid    ;
// 2. to Alu 
wire [ data_w - 1 : 0 ] OP_A , OP_B ;
// 3. to Uart & Clk divider mux & Clk divider 
wire [ data_w - 1 : 0 ] Div_Ratio , UART_Config ;

// System control signals 
// 1. to alu 
wire [3:0] Fun ;
wire       EN  ;
// 2. to clock gate 
wire  Gate_EN ;
// 3. to register file 
wire                             WrEn , RdEn ;
wire [ data_w - 1 : 0 ]          Wr_D        ;
wire [ REG_F_Addr_Bits - 1 : 0 ] Addr        ; 
// 4. to fifo
wire                    WR_INC ;
wire [ data_w - 1 : 0 ] WR_DATA ;
// 5. to clk dividers 
wire clock_div_E ;

// Domain 1:

// clock gate 
CLK_Gating_unit GATED_CLK (
    .i_ref_clk      (i_Ref_Clk) ,
    .i_gate_en      (Gate_EN)   ,

    .o_gated_clk    (ALU_CLK) 
);

// 1. Domain 1 rst_sync 
rst_sync_unit #( .Num_stg   (rst_sync_Num_stg)
) RST_SYNC_1 (
    .i_clk         (i_Ref_Clk) ,
    .i_rst_n_Async (i_RST_n)   ,

    .o_rst_n_Sync  (Sync_Rst_1)
);

// Register File
Reg_File #( .R_Width(data_w) ,
            .R_Depth(REG_F_Depth) ,
            .R_Adderss_Bits(REG_F_Addr_Bits) 
) SYS_REG_FILE (
    .i_clk_reg     (i_Ref_Clk)   , 
    .i_rst_n_reg   (Sync_Rst_1)  ,

    .i_RdEn_reg    (RdEn)        ,
    .i_WrEn_reg    (WrEn)        ,
    .i_WrData_reg  (Wr_D)        ,
    .i_Address_reg (Addr)        ,

    .o_REG0_reg    (OP_A)        ,
    .o_REG1_reg    (OP_B)        ,
    .o_REG2_reg    (UART_Config) , 
    .o_REG3_reg    (Div_Ratio)   ,

    .o_Valid_reg   (Rd_D_vid)    ,
    .o_RdData_reg  (Rd_D)
);

// ALU 
Alu_unit #( .op_width   (data_w)
) ALU (
    .i_clk_alu     (ALU_CLK)    ,
    .i_rst_n_alu   (Sync_Rst_1) ,

    .i_OP_A_alu    (OP_A)       ,
    .i_OP_B_alu    (OP_B)       ,

    .i_Enable_alu  (EN)         ,
    .i_ALU_FUN_alu (Fun)        ,

    .o_ALU_OUT     (ALU_OUT)    ,
    .o_VALID_alu   (OUT_Valid)
);

// system control unit 
Sys_Ctrl_Unit #( .Addr_Bits  (REG_F_Addr_Bits) ,
                 .data_width (data_w)
) System_brain (
    .i_ref_clk          (i_Ref_Clk)     ,
    .i_rst_n            (Sync_Rst_1)    ,

    .i_ALU_OUT          (ALU_OUT)       ,
    .i_VALID_alu        (OUT_Valid)     ,

    .i_Synced_Rx_D      (Synced_RX_D)   ,
    .i_Synced_RX_VLD    (Synced_RX_VLD) ,

    .i_RdData           (Rd_D)          ,
    .i_Valid            (Rd_D_vid)      ,

    .i_fifo_f           (Fifo_full)     ,

    .o_Gated_clk_en     (Gate_EN)       ,

    .o_Alu_EN           (EN)            ,
    .o_ALU_FUN          (Fun)           ,
    
    .o_TX_P_DATA        (WR_DATA)       ,
    .o_TX_D_VLD         (WR_INC)        ,

    .o_Addr             (Addr)          ,
    .o_Wr_D             (Wr_D)          ,
    .o_WrEn             (WrEn)          ,
    .o_RdEn             (RdEn)          ,

    .o_clk_div_en       (clock_div_E)
);

// Domain 2 :

// 2. Domain 2 rst_sync
rst_sync_unit #( .Num_stg   (rst_sync_Num_stg)
) RST_SYNC_2 (
    .i_clk         (i_Uart_Clk) ,
    .i_rst_n_Async (i_RST_n)    ,

    .o_rst_n_Sync  (Sync_Rst_2)
);

// clock divider mux
CLK_Div_mux #( .prescale_bits (prescale_bits)
) Div_mux (
    .i_config_prescale (UART_Config[data_w - 1:2]) ,

    .o_config_prescale (Rx_Div_ratio)
);

// clock dividers :
// 1. TX Clock div 
CLK_Div_Unit # ( .max_div_ratio (max_div_ratio_sys) ,
                 .div_bits      (div_bits_sys)   
) TX_CLK_G (
    .i_ref_clk   (i_Uart_Clk)   ,
    .i_rst_n     (Sync_Rst_2)   ,

    .i_clk_en    (clock_div_E)  ,
    .i_div_ratio (Div_Ratio)    ,

    .o_div_clk   (TX_clk)
);

// 2. RX Clock div 
CLK_Div_Unit # ( .max_div_ratio (max_div_ratio_sys) ,
                 .div_bits      (div_bits_sys)   
) RX_CLK_G (
    .i_ref_clk   (i_Uart_Clk)     ,
    .i_rst_n     (Sync_Rst_2)     ,

    .i_clk_en    (clock_div_E)    ,
    .i_div_ratio (Rx_Div_ratio)   ,

    .o_div_clk   (RX_clk)
);

// Pulse Generator 
pulse_gen_unit Pulse_G (
    .i_clk_PG       (TX_clk)     ,
    .i_rst_n_PG     (Sync_Rst_2) ,

    .i_lvl_sig_PG   (busy)       ,
    .o_pulse_sig_PG (RD_INC) 
);

Uart_TOP #( .data_width    (data_w) ,
            .prescale_bits (prescale_bits)
) UART (
    .i_TX_clk          (TX_clk)                    ,
    .i_TX_IN_P         (RD_DATA)                   ,
    .i_TX_data_valid   (!Fifo_empty)               ,

    .i_RX_clk          (RX_clk)                    ,
    .i_RX_IN_S         (i_RX_IN_sys)               ,
    .i_RX_prescale     (UART_Config[data_w - 1:2]) ,

    .i_rst_n           (Sync_Rst_2)                ,
    .i_par_en          (UART_Config[0])            ,
    .i_par_typ         (UART_Config[1])            ,

    .o_TX_OUT_S        (o_TX_OUT_sys)              ,
    .o_TX_Busy         (busy)                      ,

    .o_RX_data_valid   (unSync_RX_VLD)             ,
    .o_RX_Stop_Error   (o_Stop_Error_sys)          ,
    .o_RX_Parity_Error (o_Parity_Error_sys)        ,
    .o_RX_OUT_P        (unSync_RX_D)
);

// Synchronizers

// data synchronizer 
Data_synchronizer #( .data_width (data_w) ,
                     .Num_Stg    (data_sync_Num_stg)
) Data_Sync (
    .i_des_clk    (i_Ref_Clk)     ,  
    .i_des_rst_n  (Sync_Rst_1)    ,

    .i_unsync_bus (unSync_RX_D)   ,
    .i_bus_en     (unSync_RX_VLD) ,

    .o_sync_bus   (Synced_RX_D)   ,
    .o_en_pulse   (Synced_RX_VLD) 
);

// FIFO 
Async_FIFO_Top #( .data_width  (data_w)  ,
                  .fifo_depth  (fifo_depth_sys) ,
                  .NUM_STG_DFF (data_sync_Num_stg)    
) FIFO (
    .i_w_clk   (i_Ref_Clk)  ,
    .i_w_rst_n (Sync_Rst_1) ,
    .i_w_inc   (WR_INC)     ,

    .i_WR_DATA (WR_DATA)    ,

    .i_r_clk   (TX_clk)     ,
    .i_r_rst_n (Sync_Rst_2) ,
    .i_r_inc   (RD_INC)     ,

    .o_RD_DATA (RD_DATA)    ,
    .o_EMPTY   (Fifo_empty) ,
    .o_FULL    (Fifo_full)
);                     

endmodule 
