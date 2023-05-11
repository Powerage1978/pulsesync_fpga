`timescale 1ns / 100ps

/*
 * Defines constants for the Zynq platform.
 */
package zynq_interface_pkg;
    parameter C_DDR_ADDR_WIDTH = 15;
    parameter C_DDR_DATA_WIDTH = 32;
    parameter C_DDR_DATASTROBE_WIDTH = 4;
    parameter C_DDR_DATAMASK_WIDTH = 4;
    parameter C_DDR_BANKADDR_WIDTH = 3;
    parameter C_MIO_WIDTH = 54;
endpackage