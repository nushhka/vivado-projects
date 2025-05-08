`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2024 23:38:29
// Design Name: 
// Module Name: decoder_4x16
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

module decoder_4x16 (
    input [3:0] a,
    input en,
    output [15:0] y
);

wire [3:0] w;

decoder_2x4 decoder_inst0 (.a(a[3]), .b(a[2]), .en(en), .y0(w[0]), .y1(w[1]), .y2(w[2]), .y3(w[3]));
decoder_2x4 decoder_inst1 (.a(a[1]), .b(a[0]), .en(w[0]), .y0(y[0]), .y1(y[1]), .y2(y[2]), .y3(y[3]));
decoder_2x4 decoder_inst2 (.a(a[1]), .b(a[0]), .en(w[1]), .y0(y[4]), .y1(y[5]), .y2(y[6]), .y3(y[7]));
decoder_2x4 decoder_inst3 (.a(a[1]), .b(a[0]), .en(w[2]), .y0(y[8]), .y1(y[9]), .y2(y[10]), .y3(y[11]));
decoder_2x4 decoder_inst4 (.a(a[1]), .b(a[0]), .en(w[3]), .y0(y[12]), .y1(y[13]), .y2(y[14]), .y3(y[15]));


endmodule


module decoder_2x4 (
    input a,
    input b,
    input en,
    output y0,
    output y1,
    output y2,
    output y3
);

assign y0 = (~a) & (~b) & en;
assign y1 = (~a) & b & en;
assign y2 = a & (~b) & en;
assign y3 = a & b & en;

endmodule
