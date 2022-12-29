`timescale 1ns / 1ps
package axi4lite_pkg;
    parameter C_LOG2_BUFFER_SIZE    = 5;
    parameter C_DATA_WIDTH          = 32;
    parameter C_ADDR_WIDTH          = C_LOG2_BUFFER_SIZE + 3;		/*!< lower two bits defines byte access (not used) */
    parameter C_ADDR_LSB            = 2; 						    /*!< equals 32 bit addressing, 3 equals 64 bit */
    parameter C_RAM_DEPTH           = 2 ** C_LOG2_BUFFER_SIZE;
    parameter C_OPT_MEM_ADDR_BITS   = 1;
endpackage