`timescale 1ns / 1ps

import axi4lite_pkg::*;

module dcdc #(
)
(
    input logic clk,
    input logic rst_n,
    input logic [C_DATA_WIDTH-1 : 0] curr_control,
    input logic [C_DATA_WIDTH-1 : 0] volt_control,
    output logic pwm_out_curr,
    output logic pwm_out_volt,
    output logic ena_curr,
    output logic ena_volt
);

logic [C_DCDC_ENA_SIZE-1 : 0] ena_curr_d;
logic [C_DCDC_ENA_SIZE-1 : 0] ena_volt_d;

assign ena_curr_d = curr_control[C_DCDC_ENA_OFFSET+C_DCDC_ENA_SIZE-1 : C_DCDC_ENA_OFFSET];
assign ena_volt_d = volt_control[C_DCDC_ENA_OFFSET+C_DCDC_ENA_SIZE-1 : C_DCDC_ENA_OFFSET];

pwm #(
)pwm_curr_instance (
    .clk        (clk),
    .rst_n      (rst_n),
    .control    (curr_control),
    .pwm_out    (pwm_out_curr)
);

pwm #(
)pwm_volt_instance (
    .clk        (clk),
    .rst_n      (rst_n),
    .control    (volt_control),
    .pwm_out    (pwm_out_volt)
);

always @ (posedge clk) begin
    if (!rst_n) begin
        ena_curr <= 0;
        ena_volt <= 0;
    end else begin
        ena_curr <= ena_curr_d;
        ena_volt <= ena_volt_d;
    end
end

endmodule