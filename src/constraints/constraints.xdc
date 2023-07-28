set_property PACKAGE_PIN A22 [get_ports sync_a]
set_property PACKAGE_PIN B22 [get_ports sync_b]
set_property PACKAGE_PIN AB22 [get_ports sync_k]

set_property PACKAGE_PIN Y6 [get_ports sync_in]

set_property PACKAGE_PIN AA9 [get_ports curr_pwm]
set_property PACKAGE_PIN AB7 [get_ports volt_pwm]
set_property PACKAGE_PIN AB4 [get_ports psu_en]

set_property PACKAGE_PIN E16 [get_ports {gate_output_dbg[0]}]
set_property PACKAGE_PIN F16 [get_ports {gate_output_dbg[1]}]
set_property PACKAGE_PIN G16 [get_ports {gate_output_dbg[2]}]
set_property PACKAGE_PIN D15 [get_ports {gate_output_dbg[3]}]

set_property PACKAGE_PIN D16 [get_ports sync_gen]
set_property PACKAGE_PIN A16 [get_ports sync_gen_n]


set_property IOSTANDARD LVCMOS33 [get_ports sync_a]
set_property IOSTANDARD LVCMOS33 [get_ports sync_b]
set_property IOSTANDARD LVCMOS33 [get_ports sync_k]

set_property IOSTANDARD LVCMOS33 [get_ports curr_pwm]
set_property IOSTANDARD LVCMOS33 [get_ports volt_pwm]
set_property IOSTANDARD LVCMOS33 [get_ports psu_en]

set_property IOSTANDARD LVCMOS33 [get_ports sync_in]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sync_out]

set_property IOSTANDARD LVCMOS33 [get_ports {gate_output_dbg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gate_output_dbg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gate_output_dbg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gate_output_dbg[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports sync_gen]
set_property IOSTANDARD LVCMOS33 [get_ports sync_gen_n]

set_operating_conditions -grade extended
