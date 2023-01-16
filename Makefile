SOURCES_SV := \
	src/hdl/axi4lite_pkg.sv \
	src/hdl/gatedriver_pkg.sv \
	src/hdl/zynq_interface_pkg.sv \
	src/hdl/axi4lite_bram.sv \
	src/hdl/bram.sv \
	src/hdl/axi4lite.sv \
	src/hdl/gate_driver.sv \
	src/hdl/toplevel.sv \
	src/hdl/pwm.sv \
	src/hdl/dcdc.sv \
	src/hdl/sync_generator.sv \
	sim/sim_pkg.sv \
	sim/bram_tb.sv \
	sim/axi4lite_bram_tb.sv \
	sim/axi4lite_tb.sv \
	sim/blockram_file_tb.sv \
	sim/gate_driver_tb.sv \
	sim/pwm_tb.sv \
	sim/dcdc_tb.sv \
	sim/sync_generator_tb.sv \
	sim/toplevel_tb.sv

COMP_OPTS_SV := \
    --incr \
    --nolog \

DEFINES_SV :=

SOURCES_V :=    

COMP_OPTS_V := \
    --incr \
    --nolog \

DEFINES_V :=

#SOURCES_VHDL := ""

COMP_OPTS_VHDL := \
    --incr \
    --nolog \

DEFINES_VHDL :=

#TB_TOP := gate_driver_tb

.PHONY : simulate
simulate : $(TB_TOP)_snapshot.wdb

.PHONY : waves
waves : $(TB_TOP)_snapshot.wdb
	@echo "OPENING WAVES"
	xsim --gui sim/$(TB_TOP)_snapshot.wdb -view sim/cfg/$(TB_TOP)_behav.wcfg -tempDir tmp --nolog

$(TB_TOP)_snapshot.wdb : .elab.timestamp
	@echo
	@echo "*** RUNNING SIMULATION ***"
	xsim $(TB_TOP)_snapshot --tclbatch tcl/xsim_cfg.tcl --wdb sim/$(TB_TOP)_snapshot.wdb --nolog

#.elab.timestamp : .comp_sv.timestamp .comp_v.timestamp .comp_vhdl.timestamp
.PHONY : .elab.timestamp
.elab.timestamp : .comp_sv.timestamp .comp_v.timestamp .comp_vhdl.timestamp
	@echo
	@echo "*** ELABORATING ***"
	xelab -debug all -top $(TB_TOP) -snapshot $(TB_TOP)_snapshot --nolog
	touch .elab.timestamp

ifeq ($(SOURCES_SV),)
.comp_sv.timestamp :
	@echo
	@echo "*** NO SYSTEMVERILOG SOURCES GIVEN ***"
	@echo "*** SKIPPED SYSTEMVERILOG COMPILATION ***"
	touch .comp_sv.timestamp
else
.comp_sv.timestamp : $(SOURCES_SV)
	@echo
	@echo "*** COMPILING SYSTEMVERILOG ***"
	xvlog --sv $(COMP_OPTS_SV) $(DEFINES_SV) $(SOURCES_SV)
	touch .comp_sv.timestamp
endif

ifeq ($(SOURCES_V),)
.comp_v.timestamp :
	@echo
	@echo "*** NO VERILOG SOURCES GIVEN ***"
	@echo "*** SKIPPED VERILOG COMPILATION ***"
	touch .comp_v.timestamp
else
.comp_v.timestamp : $(SOURCES_V)
	@echo
	@echo "*** COMPILING VERILOG ***"
	xvlog --sv $(COMP_OPTS_V) $(DEFINES_V) $(SOURCES_V)
	touch .comp_v.timestamp
endif

ifeq ($(SOURCES_VHDL),)
.comp_vhdl.timestamp :
	@echo
	@echo "*** NO VHDL SOURCES GIVEN ***"
	@echo "*** SKIPPED VHDL COMPILATION ***"
	touch .comp_vhdl.timestamp
else
.comp_vhdl.timestamp : $(SOURCES_VHDL)
	@echo
	@echo "*** COMPILING VHDL ***"
	xvhdl $(COMP_OPTS_VHDL) $(SOURCES_VHDL)
	touch .comp_vhdl.timestamp
endif

.PHONY : clean
clean :
# This deletes all files generated by Vivado
	rm -rf *.jou *.log *.pb *.wdb xsim.dir
# This deletes all our timestamps
	rm -rf .*.timestamp      

.PHONY : compile
compile : .comp_sv.timestamp .comp_v.timestamp .comp_vhdl.timestamp

.PHONY : elaborate
elaborate : .elab.timestamp

.PHONY : create-project
create-project :
	vivado -mode batch -source tcl/create-project.tcl

.PHONY : vivado-synthesis
vivado-synthesis : 
	vivado -mode batch -source tcl/run-synthesis.tcl

.PHONY : vivado-implementation
vivado-implementation : 
	vivado -mode batch -source tcl/run-implementation.tcl

.PHONY : vivado-bitstream
vivado-bitstream : 
	vivado -mode batch -source tcl/create-bitstream.tcl
	mkdir -p output
	cp ./picotem-transceiver-fpga/picotem-transceiver-fpga.runs/impl_1/toplevel.bit ./output/

.PHONY : build-docs
build-docs :
	sphinx-build -b html doc/. doc/_build

.PHONY : clean-docs
clean-docs :
	rm -rf doc/_build/