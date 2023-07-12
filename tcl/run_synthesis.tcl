open_project ./pulsesync_fpga/pulsesync_fpga.xpr

set_msg_config -id "Synth 8-7129" -limit 10000
set_msg_config -id {Synth 8-7129} -string "^.*?gen_ctrl.*?sync_generator.*?$" -new_severity {INFO} -regexp
set_msg_config -id {Synth 8-7129} -string "^.*?ctrl_reg.*?gate_driver.*?$" -new_severity {INFO} -regexp
set_msg_config -id {Synth 8-7129} -string "^.*?doutb.*?gate_driver.*?$" -new_severity {INFO} -regexp
set_msg_config -id {Synth 8-7129} -string "^.*?pwm_control.*?dcdc.*?$" -new_severity {INFO} -regexp


update_compile_order -fileset sources_1

reset_run synth_1
launch_runs synth_1 -jobs 16
wait_on_run synth_1

close_project
