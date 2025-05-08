`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 14:42:05
// Design Name: 
// Module Name: four_bit_adder
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


// Full Adder Module 
module full_adder(input X, input Y, input Cin, output Sum, output Cout); 
assign {Cout, Sum} = X + Y + Cin;
endmodule

//4-bit Adder Module

module four_bit_adder(input [3:0] A, input [3:0] B, output [3:0] S, output Co);

wire [3:0] C;

full_adder fa0(A[0], B[0], 0, S[0], C[0]);

full_adder fa1(A[1], B[1], C[0], S[1], C[1]);

full_adder fa2(A[2], B[2], C[1], S[2], C[2]);

full_adder fa3(A[3], B[3], C[2], S[3], Co);

endmodule


