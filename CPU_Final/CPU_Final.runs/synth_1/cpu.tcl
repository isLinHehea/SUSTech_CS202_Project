# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.cache/wt [current_project]
set_property parent.project_path D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths d:/BingDownload/SEU_CSE_507_user_uart_bmpg_1.3 [current_project]
set_property ip_output_repo d:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/Controller.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/DMemory.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/Decoder.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/Executer.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/IFetch.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/MemOrIO.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/ProgramROM.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/leds.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/segs.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/switchs.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/vga_let.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/vga_num.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/vgas.v
  D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/new/cpu.v
}
read_ip -quiet D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/cpu_clk/cpu_clk.xci
set_property used_in_implementation false [get_files -all d:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/cpu_clk/cpu_clk_board.xdc]
set_property used_in_implementation false [get_files -all d:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/cpu_clk/cpu_clk.xdc]
set_property used_in_implementation false [get_files -all d:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/cpu_clk/cpu_clk_ooc.xdc]

read_ip -quiet D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/uart_bmpg_0/uart_bmpg_0.xci

read_ip -quiet D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/ROM/ROM.xci
set_property used_in_implementation false [get_files -all d:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/ROM/ROM_ooc.xdc]

read_ip -quiet D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/RAM/RAM.xci
set_property used_in_implementation false [get_files -all d:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/sources_1/ip/RAM/RAM_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/constrs_1/new/cpu.xdc
set_property used_in_implementation false [get_files D:/LearningMaterials/CS202/Project/CS202_Project/CPU_Final/CPU_Final.srcs/constrs_1/new/cpu.xdc]


synth_design -top cpu -part xc7a35tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef cpu.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file cpu_utilization_synth.rpt -pb cpu_utilization_synth.pb"
