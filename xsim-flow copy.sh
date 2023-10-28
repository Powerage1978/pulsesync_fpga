#!/bin/bash

SOURCES_SV=" \
    sim/test/driver.sv \
    sim/test/design.sv \
    sim/test/directed_test.sv \
    sim/test/environment.sv \
    sim/test/generator.sv \
    sim/test/interface.sv \
    sim/test/monitor.sv \
    sim/test/random_test.sv \
    sim/test/scoreboard.sv \
    sim/test/testbench.sv \
    sim/test/transaction.sv \
"

COMP_OPTS_SV=" \
    --incr \
    --nolog \
"

SOURCES_V=" \

"

COMP_OPTS_V=" \
    --incr \
    --nolog \
"

#xvlog $SOURCES_V $COMP_OPTS_V

#if [ $? -ne 0 ]; then
#    echo "### VERILOG COMPILATION FAILED ###"
#    exit 10
#fi

xvlog -sv $SOURCES_SV $COMP_OPTS_SV

if [ $? -ne 0 ]; then
    echo "### SYSTEMVERILOG COMPILATION FAILED ###"
    exit 10
fi

xelab -top testbench -snapshot myip_tb_snapshot -debug all --nolog

if [ $? -ne 0 ]; then
    echo "### ELABORATION FAILED ###"
    exit 10
fi


xsim myip_tb_snapshot --tclbatch tcl/xsim_cfg.tcl --wdb sim/myip_tb_snapshot.wdb --nolog

if [ $? -ne 0 ]; then
    echo "### SIMULATION FAILED ###"
    exit 10
fi

if [ "$1" == "waves" ]; then
    echo "### OPENING WAVES ###"
    xsim --gui sim/myip_tb_snapshot.wdb -view sim/cfg/myip_v1_0_S00_AXI_tb_behav.wcfg -tempDir tmp --nolog
fi
