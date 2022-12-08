`timescale 1ns / 1ps

module gate_driver_tb (

);
    localparam integer COUNT_SIZE = 25;
    localparam integer IDX_SIZE = 5;
    localparam integer OUTPUT_WIDTH = 4;
    localparam integer WORD_SIZE = 32;
    localparam integer NO_OF_STATES_OFFSET = 8;
    localparam integer T_TOLERANCE = 0;

    logic clk;
    logic rst_n;
    logic [WORD_SIZE-1:0]doutb;
    logic [WORD_SIZE-1:0]ctrl_reg;
    logic external_err;
    logic [IDX_SIZE-1:0]addrb;
    logic [WORD_SIZE-1:0] status;

    logic sync;
    logic gate_output[OUTPUT_WIDTH];

gate_driver #(
    .COUNT_SIZE             (COUNT_SIZE),
    .IDX_SIZE               (IDX_SIZE),
    .OUTPUT_WIDTH           (OUTPUT_WIDTH),
    .WORD_SIZE              (WORD_SIZE),
    .NO_OF_STATES_OFFSET    (NO_OF_STATES_OFFSET),
    .T_TOLERANCE            (T_TOLERANCE)
)
gate_driver_dut (
    .clk            (clk),
    .rst_n          (rst_n),
    .doutb          (doutb),
    .ctrl_reg       (ctrl_reg),
    .external_err   (external_err),
    .addrb          (addrb),
    .status         (status),

    // External clock domain
    .sync           (sync),
    .gate_output    (gate_output)
);

    initial begin
        clk = 0;
        sync = 1'b0;
    end
    
    always 
    #5 clk = ~clk;

    initial begin
        rst_n = 0;
        doutb[WORD_SIZE-1:0] = {WORD_SIZE{1'b0}};
        external_err = 1'b0;
        ctrl_reg[NO_OF_STATES_OFFSET+IDX_SIZE-1 : NO_OF_STATES_OFFSET] = 5;
        #50
        rst_n = 1;
        doutb[OUTPUT_WIDTH-1:0] = 4'b1111;
        #50
        ctrl_reg[0] = 1'b1;
        #50
        sync = 1'b1;
        #10
        sync = 1'b0;

        #180
        sync = 1'b1;
        #10
        sync = 1'b0;
        
        #180
        sync = 1'b1;
        #10
        sync = 1'b0;

        #200 $finish;
    end

endmodule