vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 \
"D:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../CS202_Project.srcs/sources_1/ip/uart_bmpg_0/uart_bmpg.v" \
"../../../../CS202_Project.srcs/sources_1/ip/uart_bmpg_0/upg.v" \
"../../../../CS202_Project.srcs/sources_1/ip/uart_bmpg_0/sim/uart_bmpg_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

