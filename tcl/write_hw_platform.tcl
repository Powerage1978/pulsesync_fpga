open_project ./pulsesync_fpga/pulsesync_fpga.xpr

write_hw_platform -fixed -include_bit -force -file ./output/toplevel.xsa

close_project
