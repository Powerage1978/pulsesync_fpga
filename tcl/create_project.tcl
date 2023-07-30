#*****************************************************************************************
# Vivado (TM) v2022.1 (64-bit)
#
# create-project.tcl: Tcl script for re-creating project 'pulsesync_fpga'
#
# Generated by Vivado on Fri Nov 25 08:57:33 CET 2022
# IP Build 3524634 on Mon Apr 18 20:55:01 MDT 2022
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# NOTE: In order to use this script for source control purposes, please make sure that the
#       following files are added to the source control system:-
#
# 1. This project restoration tcl script (picotem_transceiver.tcl) that was generated.
#
# 2. The following source(s) files that were local or imported into the original project.
#    (Please see the '$orig_proj_dir' and '$origin_dir' variable setting below at the start of the script)
#
# 3. The following remote source files that were added to the original project:-
#
#    <none>
#
#*****************************************************************************************


# Set the reference directory to project root folder
set origin_dir "[pwd]"

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "pulsesync_fpga"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

# Set path to boards
set_param board.repoPaths ${origin_dir}/board_store/TE0720_20_21/1.0/1.0

variable script_file
set script_file "create-project.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/"]"

# Check for paths and files needed for project creation
set validate_required 0
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Tcl file $script_file is not valid. Not all files required for project creation is accesable. "
    return
  }
}

# Create project
create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part xc7z020clg484-2

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part_repo_paths" -value "[file normalize "$origin_dir/board_store"]" -objects $obj
set_property -name "board_part" -value "trenz.biz:te0720_20_2i:part0:1.0" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_resource_estimation" -value "0" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "platform.board_id" -value "te0720_20_2i" -objects $obj
set_property -name "revised_directory_structure" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "2" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "2" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "2" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "2" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "2" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "2" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "78" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
# Import local files from the original project
set files [list \
  [file normalize "${origin_dir}/src/hdl/axi4lite_pkg.sv"]\
  [file normalize "${origin_dir}/src/hdl/gatedriver_pkg.sv"]\
  [file normalize "${origin_dir}/src/hdl/zynq_interface_pkg.sv"]\
  [file normalize "${origin_dir}/src/hdl/sys_pkg.sv"]\
  [file normalize "${origin_dir}/src/hdl/mem_map_pkg.sv"]\
  [file normalize "${origin_dir}/src/hdl/pulsesync_memory_map.sv"]\
  [file normalize "${origin_dir}/src/hdl/pulsesync_memory_block.sv"]\
  [file normalize "${origin_dir}/src/hdl/pulsesync_bram.sv"]\
  [file normalize "${origin_dir}/src/hdl/toplevel.sv"]\
  [file normalize "${origin_dir}/src/hdl/gatedriver.sv"]\
  [file normalize "${origin_dir}/src/hdl/pwm.sv"]\
  [file normalize "${origin_dir}/src/hdl/dcdc.sv"]\
  [file normalize "${origin_dir}/src/hdl/sync_generator.sv"]\
  [file normalize "${origin_dir}/src/hdl/async_rst.sv"]\
]
set added_files [add_files -fileset sources_1 $files]

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "toplevel" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "${origin_dir}/src/constraints/constraints.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "${origin_dir}/src/constraints/constraints.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Import local files from the original project
set files [list \
  [file normalize "${origin_dir}/sim/sim_pkg.sv"]\
  [file normalize "${origin_dir}/sim/axi4lite_bram_tb.sv"]\
  [file normalize "${origin_dir}/sim/axi4lite_tb.sv"]\
  [file normalize "${origin_dir}/sim/blockram_file_tb.sv"]\
  [file normalize "${origin_dir}/sim/gatedriver_tb.sv"]\
  [file normalize "${origin_dir}/sim/bram_tb.sv"]\
  [file normalize "${origin_dir}/sim/pwm_tb.sv"]\
  [file normalize "${origin_dir}/sim/dcdc_tb.sv"]\
  [file normalize "${origin_dir}/sim/sync_generator_tb.sv"]\
  [file normalize "${origin_dir}/sim/toplevel_tb.sv"]\
  [file normalize "${origin_dir}/sim/cfg/axi4lite_bram_tb_behav.wcfg"]\
  [file normalize "${origin_dir}/sim/cfg/blockram_file_tb_behav.wcfg"]\
  [file normalize "${origin_dir}/sim/cfg/bram_tb_behav.wcfg"]\
  [file normalize "${origin_dir}/sim/cfg/gatedriver_tb_behav.wcfg"]\
  [file normalize "${origin_dir}/sim/cfg/pwm_tb_behav.wcfg"]\
  [file normalize "${origin_dir}/sim/cfg/dcdc_tb_behav.wcfg"]\
  [file normalize "${origin_dir}/sim/cfg/toplevel_tb_behav.wcfg"]\
  [file normalize "${origin_dir}/sim/cfg/sync_generator_tb_behav.wcfg"]\
]
set added_files [add_files -fileset sim_1 $files]

# Set 'sim_1' fileset file properties for remote files
# None

# Set 'sim_1' fileset file properties for local files
# None

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "toplevel_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

set_property is_enabled false [get_files  "${origin_dir}/sim/cfg/axi4lite_bram_tb_behav.wcfg"]
set_property is_enabled false [get_files  "${origin_dir}/sim/cfg/blockram_file_tb_behav.wcfg"]
set_property is_enabled false [get_files  "${origin_dir}/sim/cfg/bram_tb_behav.wcfg"]
set_property is_enabled false [get_files  "${origin_dir}/sim/cfg/dcdc_tb_behav.wcfg"]
set_property is_enabled false [get_files  "${origin_dir}/sim/cfg/gatedriver_tb_behav.wcfg"]
set_property is_enabled false [get_files  "${origin_dir}/sim/cfg/pwm_tb_behav.wcfg"]
set_property is_enabled false [get_files  "${origin_dir}/sim/cfg/sync_generator_tb_behav.wcfg"]


# Create block design
source $origin_dir/src/bd/proc_module.tcl

# Generate the wrapper
set design_name [get_bd_designs]
make_wrapper -files [get_files $design_name.bd] -top -import