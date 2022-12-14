open_project picotem-transceiver-fpga/picotem-transceiver-fpga.xpr

reset_run impl_1 -prev_step
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1

close_project