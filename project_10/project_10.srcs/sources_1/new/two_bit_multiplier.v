`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 14:09:39
// Design Name: 
// Module Name: two_bit_multiplier
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


module half_adder(
    input A,
    input B,
    output Sum,
    output Cout
);
    assign Sum = A ^ B;
    assign Cout = A & B;
endmodule

module two_bit_multiplier(input [1:0]A, B, output [3:0]P);
wire C;
assign P[0] = A[0] & B[0];

half_adder HA1((A[1] & B[0]), (A[0] & B[1]), P[1], C);
half_adder HA2(C, (A[1] & B[1]), P[2], P[3]);

endmodule
