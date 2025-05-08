`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 11:28:02
// Design Name: 
// Module Name: Shift
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Shift(
    input clk,
    input [3:0] data_in,
    input [1:0] sel,
    output reg [5:0] data_out
);

always @(posedge clk)
begin
    case(sel)
        2'b00: data_out = {2'b00, data_in}; // No shift
        2'b01: data_out = {1'b0, data_in[3:0], 1'b0}; // 1 bit left shift
        2'b10: data_out = {data_in[3:0], 2'b00}; // 2 bit left shift
        2'b11: data_out = {3'b000, data_in[3:1]}; // 1 bit right shift
        default: data_out = {2'b00, data_in}; // Default case, no change
    endcase
end

endmodule


