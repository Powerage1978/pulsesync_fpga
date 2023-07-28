`timescale 1ns / 100ps

module bram_tb (

);
    import axi4lite_pkg::*;

    localparam C_HALF_PERIOD = 5;


    logic clk;
    logic rst_n;
    logic axi_awready;
    logic regceb;
    logic enb;
	logic wea;
	logic [C_DATA_WIDTH-1 : 0] dina;
    logic [C_DATA_WIDTH-1 : 0] doutb;
	logic [$clog2(C_RAM_DEPTH-1)-1 : 0] addra;
    logic [C_ADDR_WIDTH-4 : 0] addrb;

pulsesync_bram #(
) pulsesync_bram_instance(
    .clk(clk),
    .rst_n(rst_n),
    .regceb(regceb),
    .enb(enb),
    .wea(wea),
    .dina(dina),
    .addra(addra),
    .addrb(addrb),
    .doutb(doutb)
);


    // Clock generation
    initial begin
        clk <= 0;
        forever #(C_HALF_PERIOD) clk = ~clk;
    end

    
    // Reset generation
    initial begin
        rst_n = 1'b0;
        #20
        rst_n = 1'b1;
    end

    // Test stimuli
    initial begin
        integer ram_index;
        regceb = 1'b1;
        // Set address
        for (ram_index = 0; ram_index < C_RAM_DEPTH; ram_index = ram_index + 1) begin
            addrb = ram_index;
            enb = 1'b1;         /*!< read enable */
            #10;
            enb = 1'b0;         /*!< read disable */
            #50;
        end

        #200 $finish;
    end

    task automatic enforce_bram_read;
        input [C_ADDR_WIDTH - 1 : 0] addr;
        input [C_DATA_WIDTH - 1 : 0] expected_data;
        begin
            $display("Running BRAM read test begin");
            
            @(posedge clk) #1;
    //        enb = 1'b1;
    //        regceb = 1'b1;
            addrb = addr;
                
            repeat (3) @(posedge clk);
            
        
            if (doutb != expected_data) begin
            $display("Error: Mismatch in BRAM read at %x: ", addr,
                "expected %x, received %x",
                expected_data, doutb);
            end

            @(posedge clk) #1;
    //        enb = 1'b0;
    //        regceb = 1'b0;
            $display("Running BRAM read test end");
        end
    endtask

endmodule
