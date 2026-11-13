
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

############################# Formality Setup File ##########################
                                                   
set_svf $top_module.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/ICer/Final_Sys/std_cells

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set v_format verilog
set sv_format sverilog 

set fh [open system.lst r+]
set rtl [read $fh]
set v_designs ""
set sv_designs ""

regsub -all ".v\n" $rtl ".v " v_designs
regsub -all ".sv\n" $rtl ".sv " sv_designs

analyze -format $v_format $v_designs
analyze -format $sv_format $sv_designs

elaborate -lib work SYS_TOP

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design > reports/check_design.rpt

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source ./cons.tcl

#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix  \
                       -style multiplexed_flip_flop \
                       -replace true -max_length 100 

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

#test_ready compile
compile -scan

################################################################### 
# Setting Test Timing Variables
################################################################### 

# Preclock Measure Protocol (default protocol)
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports scan_clk_dft]    -type ScanClock   -view existing_dft  -timing {50 100}
set_dft_signal -port [get_ports scan_rst_n_dft]  -type Reset       -view existing_dft  -active_state 0
set_dft_signal -port [get_ports test_mode_dft]   -type Constant    -view existing_dft  -active_state 1 
set_dft_signal -port [get_ports test_mode_dft] 	 -type TestMode    -view spec          -active_state 1 
set_dft_signal -port [get_ports SE_dft]          -type ScanEnable  -view spec          -active_state 1   -usage scan
set_dft_signal -port [get_ports SI_dft]          -type ScanDataIn  -view spec 
set_dft_signal -port [get_ports SO_dft]          -type ScanDataOut -view spec

############################# Create Test Protocol #######################
                                           
create_test_protocol

###################### Pre-DFT Design Rule Checking #######################

dft_drc -verbose

############################# Preview DFT ##############################

preview_dft -show scan_summary	

############################# Insert DFT ##############################

insert_dft
compile -scan -incremental

###################### Design Rule Checking #######################

dft_drc -verbose -coverage_estimate 
#> reports/dft_drc_post_DFT.rpt

###################### closing Svf  #######################

set_svf -off 

#############################################################################
# Write out files
#############################################################################

write_file -format verilog -hierarchy -output netlists/($top_module)post_DFT.ddc
write_file -format verilog -hierarchy -output netlists/($top_module)post_DFT.v
write_sdf  sdf/($top_module)post_DFT.sdf
write_sdc  -nosplit sdc/($top_module)post_DFT.sdc

####################### reporting ##########################################

report_area -hierarchy > reports/area_post_DFT.rpt
report_power -hierarchy > reports/power_post_DFT.rpt
report_timing -delay_type min > reports/hold_post_DFT.rpt
report_timing -delay_type max > reports/setup_post_DFT.rpt
report_clock -attributes > reports/clocks_post_DFT.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

dft_drc -verbose -coverage_estimate > reports/dft_drc_post_DFT.rpt

################# starting graphical user interface #######################

#gui_start

#exit
