SHELL := /bin/bash

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

test_pwm: source_svunit
	cd pwm && runSVUnit -s verilator -t pwm_unit_test.sv -c -Wno-WIDTHTRUNC -c "--timescale 1ns/100ps" -c -Wno-WIDTHEXPAND | sed -r -e "s#(PASSED)#${GREEN}\1${WHITE}#" -r -e "s#(FAILED)#${RED}\1${WHITE}#"

test_gatedriver: source_svunit
	cd gatedriver && runSVUnit -s verilator -t gatedriver_unit_test.sv -c -Wno-WIDTHTRUNC -c "--timescale 1ns/100ps" -c -Wno-WIDTHEXPAND

test_dcdc: source_svunit
	cd dcdc && runSVUnit -s verilator -t dcdc_unit_test.sv -c -Wno-WIDTHTRUNC -c "--timescale 1ns/100ps" -c -Wno-WIDTHEXPAND -c -Wno-UNSUPPORTED

source_svunit:
	source /opt/svunit/svunit-3.37.0/Setup.bsh
