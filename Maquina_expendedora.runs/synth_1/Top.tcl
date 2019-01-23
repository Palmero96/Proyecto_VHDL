# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
set_param synth.incrementalSynthesisCache C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/.Xil/Vivado-12568-DESKTOP-4MBK26K/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.cache/wt [current_project]
set_property parent.project_path C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/imports/Desktop/Coin_manager.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Debouncer.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Decoder.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Display.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Multiplexor.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Output.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Returns.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Show.vhd
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/new/Standby.vhd
  {C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/imports/Desktop/State Machine.vhd}
  C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/sources_1/imports/Desktop/Top.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/constrs_1/imports/Desktop/Nexys-4-DDR-Master.xdc
set_property used_in_implementation false [get_files C:/Users/Alvaro/Documents/GitHub/Proyecto_VHDL/Maquina_expendedora.srcs/constrs_1/imports/Desktop/Nexys-4-DDR-Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Top -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
