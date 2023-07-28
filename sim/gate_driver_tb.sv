`timescale 1ns / 100ps



module gate_driver_tb (

);
    import gatedriver_pkg::*;
    import axi4lite_pkg::*;
    import mem_map_pkg::*;
    import sim_pkg::*;

    logic clk;
    logic rst_n;
    logic [C_DATA_WIDTH-1:0]doutb;
    logic [C_DATA_WIDTH-1:0]ctrl_reg;
    logic external_err;
    logic [C_BRAM_REG_ADDR_BITS-1:0]addrb;
    logic [C_DATA_WIDTH-1:0] status;
    logic enb;
    logic regceb;
    logic mode;

    logic sync;
    logic gate_output[C_GATEDRIVE_WIDTH];

gate_driver #(

)
gate_driver_instance (
    .clk            (clk),
    .rst_n          (rst_n),
    .doutb          (doutb),
    .ctrl_reg       (ctrl_reg),
    .addrb          (addrb),
    .status         (status),
    .enb            (enb),
    .regceb         (regceb),
    .mode           (mode),

    // External clock domain
    .sync           (sync),
    .gate_output_pin (gate_output)
);

    initial begin
        clk = 1'b0;
        sync = 1'b0;
    end

    always begin
        #(C_HALF_PERIOD)
        clk = ~clk;
    end

    initial begin
        rst_n = 0;
        doutb[C_DATA_WIDTH-1:0] = {C_DATA_WIDTH{1'b0}};
        ctrl_reg[C_NO_OF_ID_OFFSET+C_NO_OF_ID_SIZE-1 : C_NO_OF_ID_OFFSET] = 5;
        #50
        rst_n = 1;
        doutb[C_GATEDRIVE_WIDTH-1:0] = {C_GATEDRIVE_WIDTH{1'b1}};
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

        #1000 $finish;
    end

endmodule
