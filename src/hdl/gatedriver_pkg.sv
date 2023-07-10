`timescale 1ns / 100ps

package gatedriver_pkg;
    parameter C_COUNT_SIZE = 25;            // sync signal delay caounter size
    parameter C_IDX_SIZE = 4;               // Size of number of id pairs in control reg
    parameter C_OUTPUT_WIDTH = 4;           // Output width of transistor driver
    parameter C_WORD_SIZE = 32;             // Word size of registers for BRAM contents
    parameter C_NO_OF_STATES_OFFSET = 8;    // Offset in control reg, where number of sync pairs are located
    parameter C_T_TOLERANCE = 100;          // Tolereance window for sync signal
    parameter C_STATUS_SIZE = 3;            // Number of states within state machine, used to map into status reg to read out current state
endpackage