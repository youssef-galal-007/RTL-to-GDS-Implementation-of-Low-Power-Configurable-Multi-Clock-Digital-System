
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "/home/ICer/Final_Sys/DFT/$top_module.svf"

set SSLIB "/home/ICer/Final_Sys/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/Final_Sys/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/Final_Sys/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries

read_db -container REF [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/SYS_TOP.v"

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/Alu_unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/Reg_File.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/CLK_Div_Unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/CLK_Div_mux.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/CLK_Gating_unit.v"

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/Data_synchronizer.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/rst_sync_unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/pulse_gen_unit.v"

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/FIFO/Async_FIFO_Top.v"

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/FIFO/DF_SYNC.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/FIFO/FIFO_MEM_CNTRL.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/FIFO/FIFO_WR.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/FIFO/FIFO_RD.v"

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/Uart_TOP.v"

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/TX/UART_TX_TOP.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/TX/MUX.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/TX/Parity_Calc.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/TX/serializer_unit.v"

read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/Uart_RX_TOP.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/strt_check_unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/parity_check_unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/stop_check_unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/edge_bit_cnt_unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/deserializer_unit.v"
read_verilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/data_sampling_unit.v"

read_sverilog -container REF "/home/ICer/Final_Sys/DFT/rtls/Sys_Ctrl_Unit.sv"
read_sverilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/TX/Control_unit_FSM.sv"
read_sverilog -container REF "/home/ICer/Final_Sys/DFT/rtls/UART/RX/RX_FSM_control_unit.sv"

## set the top Reference Design 

set_reference_design SYS_TOP
set_top SYS_TOP

######################## Implementation Container #########################

## Read Implementation technology libraries

read_db -container IMP [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files

read_verilog -container IMP "/home/ICer/Final_Sys/System_pnr/pnr/export/SYS_TOP.v"
 
## set the top Implementation Design

set_implementation_design SYS_TOP
set_top SYS_TOP

############################### Don't verify #################################

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in

set_dont_verify_point -type port REF:/WORK/*/SI_dft*
set_dont_verify_point -type port IMP:/WORK/*/SI_dft*

#scan_out

set_dont_verify_point -type port REF:/WORK/*/SO_dft*
set_dont_verify_point -type port IMP:/WORK/*/SO_dft*

############################### constants #####################################

# all atpg enable(test_mode, scan_enable) are zero during formal compare

#test_mode

set_constant REF:/WORK/*/test_mode_dft 0
set_constant IMP:/WORK/*/test_mode_dft 0

#scan_enable

set_constant REF:/WORK/*/SE_dft 0
set_constant IMP:/WORK/*/SE_dft 0

########################### matching Compare points ##########################

match

################################# verify #####################################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
