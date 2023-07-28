Development
===========

Getting started
---------------

The project is build using Vivado 2022.1 from Xilinx. THis must be installed prior to perform any work on the code base. When the VIvado tool has been installed, it can be used in the command line and via the GUI. To initiate the project it is easier to perform the iniital project initlzation from the command line. First the Vivado settings must be made active in the current shell with the command::

    source <vivado-install-path>/Vivado/2022.1/settings64.sh

This enables all the commands for interacting with Vivado from the command line, and the project can now be initialized when located where the sorce code is checked out with the command::
    
    make project

This creates a new directory named ``pulsesync_fpga`` in current work directory, and when this dircotry is created, it is possible to start the vivado GUI and open the project from here (inside the ``pulsesync_fpga`` directory a ``pulsesync_fpga.xpr`` file is present and can be opened by the Vivado tool).

From the Vivado tool it is now possible to perform simulation, synthesis step, implementation step and creating hardware output used by Yocto builds. The synthesis, implementation and hardware creation can be done from the command line with the following commands:

Synthesis::

    make vivado-synthesis

Implementation::

    make vivado-implementation

Hardware::

    make vivado-hardware

The above three steps can be done with one command::

    make vivado-all

When the hardware has been created, the resulting ``toplevel.sxa`` binary is located in the ``output``.

Working with Vivado
^^^^^^^^^^^^^^^^^^^

When working with source files, any editor can be used for updating the RTL codebase and the steps for creating the output can be done from the command line or from within the GUI. Some of the changes done to the design must be performed from the GUI, this typically involves changes to the ZYNQ platform, adding Xilinx IPs and changing memory mapping of custom AXI devices etc. When updates has been done, the block design must be exported with the command::

    write_bd_tcl src/bd/proc_module.tcl

This generated tcl file is sourced by the ``make project`` command from above, and is required to be kept up to date. When adding new source and simulation files to the project, the files must manually added to the ``.tcl/create_project.tcl`` file and the ``make project`` command must be run again (the command silently removes the existing ``pulsesyng_fpga`` directory and re-creates it). RTL source files going into section ``set obj [get_filesets sources_1]`` and simulation files goes into the section ``set obj [get_filesets sim_1]``.
