###################################################################

# Created by write_sdc on Wed Oct 7 01:41:03 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports i_RX_IN_sys]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI_dft[4]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI_dft[3]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI_dft[2]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI_dft[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI_dft[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports SE_dft]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports test_mode_dft]
set_load -pin_load 0.1 [get_ports {SO_dft[4]}]
set_load -pin_load 0.1 [get_ports {SO_dft[3]}]
set_load -pin_load 0.1 [get_ports {SO_dft[2]}]
set_load -pin_load 0.1 [get_ports {SO_dft[1]}]
set_load -pin_load 0.1 [get_ports {SO_dft[0]}]
set_load -pin_load 0.1 [get_ports o_Stop_Error_sys]
set_load -pin_load 0.1 [get_ports o_Parity_Error_sys]
set_load -pin_load 0.1 [get_ports o_TX_OUT_sys]
set_case_analysis 1 [get_ports test_mode_dft]
create_clock [get_ports i_Ref_Clk]  -name REF_CLK  -period 20  -waveform {0 10}
set_clock_latency 0  [get_clocks REF_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLK]
set_clock_transition -min -fall 0.1 [get_clocks REF_CLK]
set_clock_transition -max -fall 0.1 [get_clocks REF_CLK]
set_clock_transition -min -rise 0.1 [get_clocks REF_CLK]
set_clock_transition -max -rise 0.1 [get_clocks REF_CLK]
create_clock [get_ports i_Uart_Clk]  -name UART_CLK  -period 271.2  -waveform {0 135.6}
set_clock_latency 0  [get_clocks UART_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLK]
set_clock_transition -min -fall 0.1 [get_clocks UART_CLK]
set_clock_transition -max -fall 0.1 [get_clocks UART_CLK]
set_clock_transition -min -rise 0.1 [get_clocks UART_CLK]
set_clock_transition -max -rise 0.1 [get_clocks UART_CLK]
create_generated_clock [get_pins GATED_CLK/o_gated_clk]  -name ALU_CLK  -source [get_ports i_Ref_Clk]  -master_clock REF_CLK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
create_generated_clock [get_pins TX_CLK_G/o_div_clk]  -name TX_CLK  -source [get_ports i_Uart_Clk]  -master_clock UART_CLK  -divide_by 32  -add
set_clock_uncertainty -setup 0.2  [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks TX_CLK]
create_generated_clock [get_pins RX_CLK_G/o_div_clk]  -name RX_CLK  -source [get_ports i_Uart_Clk]  -master_clock UART_CLK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks RX_CLK]
create_clock [get_ports scan_clk_dft]  -name CLK_DFT  -period 1000  -waveform {0 500}
set_clock_uncertainty -setup 0.025  [get_clocks CLK_DFT]
set_clock_uncertainty -hold 0.01  [get_clocks CLK_DFT]
set_clock_transition -min -fall 0.05 [get_clocks CLK_DFT]
set_clock_transition -min -rise 0.05 [get_clocks CLK_DFT]
set_clock_transition -max -fall 0.05 [get_clocks CLK_DFT]
set_clock_transition -max -rise 0.05 [get_clocks CLK_DFT]
set_input_delay -clock RX_CLK  54.24  [get_ports i_RX_IN_sys]
set_input_delay -clock CLK_DFT  200  [get_ports {SI_dft[4]}]
set_input_delay -clock CLK_DFT  200  [get_ports {SI_dft[3]}]
set_input_delay -clock CLK_DFT  200  [get_ports {SI_dft[2]}]
set_input_delay -clock CLK_DFT  200  [get_ports {SI_dft[1]}]
set_input_delay -clock CLK_DFT  200  [get_ports {SI_dft[0]}]
set_input_delay -clock CLK_DFT  200  [get_ports SE_dft]
set_input_delay -clock CLK_DFT  200  [get_ports test_mode_dft]
set_output_delay -clock TX_CLK  54.24  [get_ports o_TX_OUT_sys]
set_output_delay -clock RX_CLK  54.24  [get_ports o_Parity_Error_sys]
set_output_delay -clock RX_CLK  54.24  [get_ports o_Stop_Error_sys]
set_output_delay -clock CLK_DFT  200  [get_ports {SO_dft[4]}]
set_output_delay -clock CLK_DFT  200  [get_ports {SO_dft[3]}]
set_output_delay -clock CLK_DFT  200  [get_ports {SO_dft[2]}]
set_output_delay -clock CLK_DFT  200  [get_ports {SO_dft[1]}]
set_output_delay -clock CLK_DFT  200  [get_ports {SO_dft[0]}]
set_clock_groups -logically_exclusive -name REF_CLK_2 -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]] -group [get_clocks CLK_DFT]
set_clock_groups -logically_exclusive -name UART_CLK_1 -group [list [get_clocks UART_CLK] [get_clocks TX_CLK] [get_clocks RX_CLK]] -group [get_clocks CLK_DFT]
set_clock_groups -asynchronous -name REF_CLK_1 -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]] -group [list [get_clocks UART_CLK] [get_clocks TX_CLK] [get_clocks RX_CLK]]
