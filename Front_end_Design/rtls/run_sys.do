vlib work    
vlog *.v
vsim -voptargs=+acc work.Sys_tb
do wave.do
run -all