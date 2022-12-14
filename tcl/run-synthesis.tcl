open_project picotem-transceiver-fpga/picotem-transceiver-fpga.xpr

update_compile_order -fileset sources_1

reset_run synth_1
launch_runs synth_1 -jobs 16
wait_on_run synth_1

close_project