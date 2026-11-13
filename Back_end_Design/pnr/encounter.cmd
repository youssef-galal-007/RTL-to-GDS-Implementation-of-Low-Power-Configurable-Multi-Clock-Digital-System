#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Tue Oct  6 20:01:06 2026                #
#                                                     #
#######################################################

#@(#)CDS: First Encounter v08.10-p004_1 (32bit) 11/04/2008 14:34 (Linux 2.6)
#@(#)CDS: NanoRoute v08.10-p008 NR081027-0018/USR58-UB (database version 2.30, 67.1.1) {superthreading v1.11}
#@(#)CDS: CeltIC v08.10-p002_1 (32bit) 10/23/2008 22:04:14 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CTE v08.10-p016_1 (32bit) Oct 26 2008 15:11:51 (Linux 2.6.9-67.0.10.ELsmp)
#@(#)CDS: CPE v08.10-p009

setUIVar rda_Input ui_topcell SYS_TOP
setUIVar rda_Input ui_netlist /home/ahesham/Projects/System_pnr/DFT/netlists/(SYS_TOP)post_DFT.v
setUIVar rda_Input ui_timelib,min /home/ahesham/Projects/System_pnr/std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib
setUIVar rda_Input ui_timelib,max /home/ahesham/Projects/System_pnr/std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib
setUIVar rda_Input ui_timelib /home/ahesham/Projects/System_pnr/std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib
setUIVar rda_Input ui_leffile {/home/ahesham/Projects/System_pnr/std_cells/lef/tsmc13fsg_7lm_tech.lef /home/ahesham/Projects/System_pnr/std_cells/lef/tsmc13_m_macros.lef /home/ahesham/Projects/System_pnr/pnr/import/SYS_TOP_5.lef}
setUIVar rda_Input ui_captbl_file /home/ahesham/Projects/System_pnr/std_cells/captables/tsmc13fsg.capTbl
setUIVar rda_Input ui_timingcon_file /home/ahesham/Projects/System_pnr/DFT/sdc/(SYS_TOP)post_DFT.sdc
setUIVar rda_Input ui_pwrnet VDD
setUIVar rda_Input ui_gndnet VSS
commitConfig
create_library_set -name min_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib"
create_library_set -name max_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib"
create_library_set -name typ_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"
create_constraint_mode -name func_mode -sdc_files {../DFT/sdc/(SYS_TOP)post_DFT_func.sdc}
create_constraint_mode -name scan_mode -sdc_files {../DFT/sdc/(SYS_TOP)post_DFT_scan.sdc}
create_constraint_mode -name capture_mode -sdc_files {../DFT/sdc/(SYS_TOP)post_DFT_capture.sdc}
create_rc_corner -name RCcorner -cap_table "../std_cells/captables/tsmc13fsg.capTbl"
create_delay_corner -name min_corner -library_set min_library -rc_corner RCcorner
create_delay_corner -name max_corner -library_set max_library -rc_corner RCcorner
create_analysis_view -name setup1_analysis_view -delay_corner max_corner -constraint_mode func_mode
create_analysis_view -name hold1_analysis_view  -delay_corner min_corner -constraint_mode func_mode
create_analysis_view -name setup2_analysis_view -delay_corner max_corner -constraint_mode capture_mode
create_analysis_view -name hold2_analysis_view  -delay_corner min_corner -constraint_mode capture_mode
create_analysis_view -name setup3_analysis_view -delay_corner max_corner -constraint_mode scan_mode
create_analysis_view -name hold3_analysis_view  -delay_corner min_corner -constraint_mode scan_mode
set_analysis_view -setup {setup1_analysis_view setup2_analysis_view setup3_analysis_view } \
                  -hold { hold1_analysis_view hold2_analysis_view hold3_analysis_view}
floorPlan -d 240.47 200.47 6.0 6.0 6.0 6.0
zoomBox -3.403 22.529 16.785 -9.492
zoomBox -2.781 9.005 5.473 -3.526
zoomBox -9.028 149.543 16.654 72.841
zoomBox -4.822 123.102 8.518 93.922
zoomBox -1.754 110.913 2.595 99.541
zoomBox -8.001 18.397 16.996 -5.572
zoomBox 23.502 22.849 108.079 -8.312
zoomBox 121.776 17.027 171.427 -18.242
zoomBox 236.486 23.191 260.455 -20.981
zoomBox 239.108 21.476 245.898 19.144
addRing -spacing_bottom .5 -width_left 1 -width_bottom 1 -width_top 1 -spacing_top .5 -layer_bottom METAL5 -center 1 -stacked_via_top_layer METAL7 -width_right 1 -around core -jog_distance 0.205 -offset_bottom 0.205 -layer_top METAL5 -threshold 0.205 -offset_left 0.205 -spacing_right .5 -spacing_left .5 -offset_right 0.205 -offset_top 0.205 -layer_right METAL6 -nets {VSS VDD } -stacked_via_bottom_layer METAL1 -layer_left METAL6
addStripe -block_ring_top_layer_limit METAL7 -max_same_layer_jog_length 0.8 -padcore_ring_bottom_layer_limit METAL5 -set_to_set_distance 40 -stacked_via_top_layer METAL7 -padcore_ring_top_layer_limit METAL7 -spacing .5 -merge_stripes_value 0.205 -layer METAL6 -block_ring_bottom_layer_limit METAL5 -width 1 -nets {VSS VDD } -stacked_via_bottom_layer METAL1
selectWire 7.6500 1.8250 8.6500 197.8350 6 VDD
deleteSelectedFromFPlan
selectWire 6.1500 3.3250 7.1500 196.3350 6 VSS
deleteSelectedFromFPlan
sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { 1 6 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer 1 -allowLayerChange 1 -targetViaTopLayer 7 -crossoverViaTopLayer 7 -targetViaBottomLayer 1 -nets { VSS VDD }
saveFPlan /home/ahesham/Projects/System_pnr/pnr/SYS_TOP.fp
verifyGeometry -noMinArea
zoomBox -6.429 207.339 46.887 162.857
zoomBox -6.429 125.000 58.244 107.017
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
placeDesign -inPlaceOpt -prePlaceOpt
addTieHiLo -cell TIELOM -prefix LTIE
addTieHiLo -cell TIEHIM -prefix HTIE
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
clearClockDomains
setClockDomains -all
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_preCTS -outDir timingReports
clockDesign -genSpecOnly Clock.ctstch
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setDrawView fplan
zoomBox -2.328 201.976 246.898 188.726
uiSetTool obstruct
createObstruct 4.546 192.873 236.028 195.111
setDrawView place
clearClockDomains
setClockDomains -all
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_postCTS -outDir timingReports
clearClockDomains
setClockDomains -all
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix SYS_TOP_postCTS -outDir timingReports
optDesign -postCTS
optDesign -postCTS -hold
saveDesign /home/ahesham/Projects/System_pnr/pnr/SYS_TOP_post_cts.enc
refinePlace -preserveRouting
setNanoRouteMode -routeWithEco true
routeDesign -globalDetail -viaOpt -wireOpt
getIoFlowFlag
clearClockDomains
setClockDomains -all
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_postRoute -outDir timingReports
clearClockDomains
setClockDomains -all
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix SYS_TOP_postRoute -outDir timingReports
verifyGeometry -noMinArea
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
verifyProcessAntenna -reportfile SYS_TOP.antenna.rpt -leffile SYS_TOP.antenna.lef -error 1000
addFiller -cell {FILL1M FILL2M FILL4M FILL8M FILL16M FILL32M FILL64M} -prefix FILLER -markFixed
getIoFlowFlag
clearClockDomains
setClockDomains -all
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix SYS_TOP_postRoute -outDir timingReports
clearClockDomains
setClockDomains -all
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix SYS_TOP_postRoute -outDir timingReports
verifyGeometry -noMinArea
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
verifyProcessAntenna -reportfile SYS_TOP.antenna.rpt -leffile SYS_TOP.antenna.lef -error 1000
checkFiller -highlight true
saveDesign /home/ahesham/Projects/System_pnr/pnr/SYS_TOP_chip_finish.enc
saveNetlist export/SYS_TOP.v
saveNetlist export/SYS_TOP_pg.v -includePowerGround
rcOut -spf export/SYS_TOP.spf
delayCal -sdf export/SYS_TOP.sdf -version 3.0
report_power -outfile report/power.rpt
streamOut export/SYS_TOP.gds -mapFile ./import/gds2InLayer.map -libName DesignLib -stripes 1 -units 2000 -mode ALL
getIoFlowFlag
