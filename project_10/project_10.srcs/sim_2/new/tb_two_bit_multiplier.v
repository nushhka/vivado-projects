`timescale 1ns / 1ps

module tb_two_bit_multiplier();

reg [1:0] A,B;
wire [3:0] P;

two_bit_multiplier tb(.A(A), .B(B), .P(P));
initial begin
  A = 2'b01;   B = 2'b10;   #10;
  A = 2'b11;   B = 2'b10;   #10;
  A = 2'b00;   B = 2'b01;   #10;
  A = 2'b10;   B = 2'b01;   #10;
  A = 2'b11;   B = 2'b00;   #10;
  A = 2'b01;   B = 2'b01;   #10;
  A = 2'b10;   B = 2'b10;   #10;
  A = 2'b00;   B = 2'b00;   #10;
  $finish;
end;
endmodule