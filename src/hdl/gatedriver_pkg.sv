`timescale 1ns / 100ps

package gatedriver_pkg;
    parameter C_GATEDRIVE_WIDTH = 4;        // Output width of transistor driver
    parameter C_T_TOLERANCE = 100;          // Tolereance window for sync signal
    parameter C_GATE_IDLE_VALUE = 4'b0100;  // Default gate drive value
endpackage
