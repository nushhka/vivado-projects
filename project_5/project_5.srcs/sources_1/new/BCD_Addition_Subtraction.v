`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 2:27:29
// Design Name: 
// Module Name: bcd_adder_substractor
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


module BCD_Addition_Subtraction (
  input [3:0] A, // 4-bit BCD input for minuend
  input [3:0] B, // 4-bit BCD input for subtrahend
  input M,       // Selection line (M=1 for subtraction, M=0 for addition)
  output reg [4:0] out_value,
  output reg C_sign  // Output carry or sign (Sign: 1 if negative, 0 otherwise; Carry: 1 representing)
);

  reg [4:0] temp_out_value;

  // Perform subtraction or addition
  always @*
  begin
    if (A <= 4'b1001 && B <= 4'b1001)
    begin
      if (M == 1)
      begin
        if (A >= B)
        begin
          out_value = A - B;
          C_sign = 0;
        end
        else
        begin
          // Negative subtraction
          out_value = B - A;
          C_sign = 1;
        end
      end
      else
      begin
        // Addition
        temp_out_value = A + B;
        if (temp_out_value > 4'b1001)
        begin
          // Carry out if sum exceeds 9
          C_sign = 1;
          out_value = temp_out_value + 4'b0110;
        end
        else
        begin
          out_value = temp_out_value;
          C_sign = 0;
        end
      end
      $display("A = %b, B = %b, Subtraction? = %b, C_out_Sign = %b, Output value = %d", A, B, M, C_sign, out_value);
    end
    else
      out_value = 4'b1111;
  end
endmodule

module add_sub (
  input [3:0] A,
  input [3:0] B,
  input M,
  output [6:0] v,
  output c_out_sign
);
  BCD_Addition_Subtraction addition_sub (.A(A), .B(B), .M(M), .out_value(v), .C_sign(c_out_sign));
endmodule