open_project ./pulsesync_fpga/pulsesync_fpga.xpr
set_param board.repoPaths ./board_store/TE0720_20_21/1.0/1.0
reset_run impl_1 -prev_step
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1

close_project
