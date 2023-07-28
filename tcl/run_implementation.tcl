open_project ./pulsesync_fpga/pulsesync_fpga.xpr

update_compile_order -fileset sources_1

reset_run impl_1 -prev_step
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1

close_project
