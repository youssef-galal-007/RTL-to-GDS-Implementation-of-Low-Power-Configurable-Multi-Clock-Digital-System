onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Sys_tb/DUT/i_RX_IN_sys
add wave -noupdate -color White /Sys_tb/DUT/System_brain/alu_data_saved
add wave -noupdate -color White /Sys_tb/DUT/System_brain/WR_ADDR_saved
add wave -noupdate -color White /Sys_tb/DUT/System_brain/alu_func_saved
add wave -noupdate -color White /Sys_tb/DUT/System_brain/current_s
add wave -noupdate -expand -group Uart_Rx -color {Blue Violet} -radix hexadecimal /Sys_tb/DUT/unSync_RX_D
add wave -noupdate -expand -group {Data sync o/p} -color Yellow -radix hexadecimal /Sys_tb/DUT/Synced_RX_D
add wave -noupdate -expand -group {Data sync o/p} -color Yellow /Sys_tb/DUT/Synced_RX_VLD
add wave -noupdate -expand -group {reg file o/p} -color Cyan /Sys_tb/DUT/WrEn
add wave -noupdate -expand -group {reg file o/p} -color Cyan -radix hexadecimal /Sys_tb/DUT/Wr_D
add wave -noupdate -expand -group {reg file o/p} -color Cyan /Sys_tb/DUT/RdEn
add wave -noupdate -expand -group {reg file o/p} -color Cyan -radix hexadecimal /Sys_tb/DUT/Rd_D
add wave -noupdate -expand -group {reg file o/p} -color Cyan /Sys_tb/DUT/Rd_D_vid
add wave -noupdate -expand -group {alu o/p} -color Coral /Sys_tb/DUT/ALU_CLK
add wave -noupdate -expand -group {alu o/p} -color Coral /Sys_tb/DUT/Gate_EN
add wave -noupdate -expand -group {alu o/p} -color Coral -radix unsigned /Sys_tb/DUT/OP_A
add wave -noupdate -expand -group {alu o/p} -color Coral -radix unsigned /Sys_tb/DUT/OP_B
add wave -noupdate -expand -group {alu o/p} -color Coral -radix unsigned /Sys_tb/DUT/Fun
add wave -noupdate -expand -group {alu o/p} -color Coral /Sys_tb/DUT/EN
add wave -noupdate -expand -group {alu o/p} -color Coral -radix unsigned /Sys_tb/DUT/ALU_OUT
add wave -noupdate -expand -group {alu o/p} -color Coral /Sys_tb/DUT/OUT_Valid
add wave -noupdate -expand -group {fifo o/p sig} -color {Spring Green} /Sys_tb/DUT/WR_INC
add wave -noupdate -expand -group {fifo o/p sig} -color {Spring Green} -radix hexadecimal /Sys_tb/DUT/WR_DATA
add wave -noupdate -expand -group {fifo o/p sig} -color {Spring Green} /Sys_tb/DUT/RD_INC
add wave -noupdate -expand -group {fifo o/p sig} -color {Spring Green} -radix hexadecimal /Sys_tb/DUT/RD_DATA
add wave -noupdate -expand -group {fifo o/p sig} -color {Spring Green} /Sys_tb/DUT/Fifo_full
add wave -noupdate -expand -group {fifo o/p sig} -color {Spring Green} /Sys_tb/DUT/Fifo_empty
add wave -noupdate -expand -group Uart_Tx -color Magenta /Sys_tb/DUT/o_TX_OUT_sys
add wave -noupdate -expand -group Uart_Tx -color Magenta /Sys_tb/DUT/busy
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2422222800 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 119
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2939176500 ps} {5719926700 ps}

