`timescale 1ns / 100ps

/*
 * Memory region related constants
 */

package axi4lite_pkg;
    parameter C_LOG2_BUFFER_SIZE        = 5;                        // Number of bits defining the memory mapped region and the BRAM region
    parameter C_DATA_WIDTH              = 32;                       // Word size in bits
    parameter C_ADDR_WIDTH              = C_LOG2_BUFFER_SIZE + 3;   // Number of words on total accesable memory region. The sum of BRAM region and memory mapped region.
                                                                    // Lower two bits defines byte access (not used)
    parameter C_ADDR_LSB                = 2; 						// Addressing mode, 2 equals 32 bit (2^2 * 8), 3 equals 64 bit = (2^3 * 8)
    parameter C_RAM_DEPTH               = 2 ** C_LOG2_BUFFER_SIZE;  // Number of RAM locations in each region
    parameter C_BRAM_REG_ADDR_BITS      = C_LOG2_BUFFER_SIZE;
    parameter C_OPT_MEM_ADDR_BITS       = C_LOG2_BUFFER_SIZE;       // Defines number of bit presentation for memory mapped registers
    parameter C_IDX_SIZE                = C_BRAM_REG_ADDR_BITS-1;               // Size of number of id pairs in control reg
endpackage
