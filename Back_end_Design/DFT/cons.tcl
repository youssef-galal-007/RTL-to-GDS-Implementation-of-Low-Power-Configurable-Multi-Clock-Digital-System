####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
set Ref_CLK_NAME REF_CLK
set Ref_CLK_PER 20

set Uart_CLK_NAME UART_CLK
set Uart_CLK_PER 271.2

set CLK_SETUP_SKEW 0.2 
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_TRANSITION 0.1

#1. Master Clocks

# REF_CLK
create_clock -name REF_CLK -period $Ref_CLK_PER -waveform "0 [expr $Ref_CLK_PER/2]" [get_ports i_Ref_Clk]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks REF_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW  [get_clocks REF_CLK]
set_clock_transition  -rise  $CLK_TRANSITION [get_clocks REF_CLK]
set_clock_transition  -fall  $CLK_TRANSITION [get_clocks REF_CLK]
set_clock_latency $CLK_LAT [get_clocks REF_CLK]

# Uart_CLK
create_clock -name UART_CLK -period $Uart_CLK_PER -waveform "0 [expr $Uart_CLK_PER/2]" [get_ports i_Uart_Clk]

set_clock_uncertainty -setup $CLK_SETUP_SKEW  [get_clocks UART_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW   [get_clocks UART_CLK]
set_clock_transition  -rise  $CLK_TRANSITION  [get_clocks UART_CLK]
set_clock_transition  -fall  $CLK_TRANSITION  [get_clocks UART_CLK]
set_clock_latency $CLK_LAT [get_clocks UART_CLK]

#2. Generated clocks

# ALU
create_generated_clock -master_clock REF_CLK -source [get_ports i_Ref_Clk] \
                       -name ALU_CLK [get_port GATED_CLK/o_gated_clk] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW  [get_clocks ALU_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW   [get_clocks ALU_CLK]

# TX_CLK
create_generated_clock -master_clock UART_CLK -source [get_ports i_Uart_Clk] \
                       -name TX_CLK [get_port TX_CLK_G/o_div_clk] \
                       -divide_by 32
set_clock_uncertainty -setup $CLK_SETUP_SKEW  [get_clocks TX_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW   [get_clocks TX_CLK]

# RX_CLK
create_generated_clock -master_clock UART_CLK -source [get_ports i_Uart_Clk] \
                       -name RX_CLK [get_port RX_CLK_G/o_div_clk] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW  [get_clocks RX_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW   [get_clocks RX_CLK]

#3. Don't touch networks 
set_dont_touch_network [get_clocks "REF_CLK UART_CLK ALU_CLK TX_CLK RX_CLK"]

# Scan Clk	
set DFT_CLK_NAME CLK_DFT
set DFT_CLK_PER 1000
set DFT_CLK_SETUP_SKEW 0.025
set DFT_CLK_HOLD_SKEW 0.01
set DFT_CLK_LAT 0
set DFT_CLK_TRANSITION 0.05

create_clock -period $DFT_CLK_PER -name $DFT_CLK_NAME [get_ports scan_clk_dft]
set_clock_uncertainty -setup $DFT_CLK_SETUP_SKEW [get_clocks CLK_DFT]
set_clock_uncertainty -hold $DFT_CLK_HOLD_SKEW [get_clocks CLK_DFT]
set_clock_transition $DFT_CLK_TRANSITION [get_clocks CLK_DFT]

set_dont_touch_network [get_ports "scan_clk_dft"]

####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "REF_CLK ALU_CLK"] \
                               -group [get_clocks "UART_CLK TX_CLK RX_CLK"]

set_clock_groups -logically_exclusive -group [get_clocks "REF_CLK ALU_CLK"] \
                                      -group [get_clocks "$DFT_CLK_NAME"]

set_clock_groups -logically_exclusive -group [get_clocks "UART_CLK TX_CLK RX_CLK"] \
                                      -group [get_clocks "$DFT_CLK_NAME"]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

#Design 
set Ref_in_delay  [expr 0.2*$Ref_CLK_PER]
set Ref_out_delay [expr 0.2*$Ref_CLK_PER]

set Uart_in_delay  [expr 0.2*$Uart_CLK_PER]
set Uart_out_delay [expr 0.2*$Uart_CLK_PER]

#Constrain Input Paths
set_input_delay $Uart_in_delay -clock RX_CLK [get_port i_RX_IN_sys]

#Constrain Output Paths
set_output_delay $Uart_out_delay -clock TX_CLK [get_port o_TX_OUT_sys]

set_output_delay $Uart_out_delay -clock RX_CLK [get_port o_Parity_Error_sys]
set_output_delay $Uart_out_delay -clock RX_CLK [get_port o_Stop_Error_sys]

# DFT 
set dft_in_delay  [expr 0.2*$DFT_CLK_PER]
set dft_out_delay [expr 0.2*$DFT_CLK_PER]

# DFT_inputs 
set_input_delay $dft_in_delay -clock $DFT_CLK_NAME [get_ports "SI_dft SE_dft test_mode_dft"]

# DFT_outputs
set_output_delay $dft_out_delay -clock $DFT_CLK_NAME [get_ports "SO_dft"]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

# Design inputs 
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port i_RX_IN_sys]

# Dft inputs 
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SI_dft]

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SE_dft]

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port test_mode_dft]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
# Design outputs 
set out_load 0.1 

set_load $out_load [get_port o_TX_OUT_sys]
set_load $out_load [get_port o_Stop_Error_sys]
set_load $out_load [get_port o_Parity_Error_sys]

# Dft outputs 
set dft_out_load 0.1 

set_load $dft_out_load [get_ports "SO_dft"]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

#set_wire_load_model -name "tsmc13_wl30" -library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 8 : case analysis ####
           #########################################################
####################################################################################

set_case_analysis 1 [get_port test_mode_dft]

####################################################################################


