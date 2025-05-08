`timescale 1ns / 1ps

module testbench;
  // Inputs
  reg [3:0] A; // Minuend input
  reg [3:0] B; // Subtrahend input
  reg M;       // Mode input

  // Outputs
  wire C_sign;      // Sign output
  wire [4:0] out_value;
  wire [3:0] out;

  // Instantiate the BCD_Addition_Subtraction module
  BCD_Addition_Subtraction uut (
    .A(A),
    .B(B),
    .M(M),
    .out_value(out_value),
    .C_sign(C_sign)
  );

  assign out = out_value[3:0];

  // Test case
  initial begin
    // Initialize inputs
    M = 1;
    A = 4'b1001; // 9 in BCD
    B = 4'b0110; // 6 in BCD
    #40;

    // Apply inputs
    M = 1;
    A = 4'b0011; // 3 in BCD
    B = 4'b0111; // 7 in BCD
    #40;

    // Apply inputs
    M = 1;
    A = 4'b1011; // Invalid BCD
    B = 4'b0101; // 5 in BCD
    #40;

    // Apply inputs
    M = 0;
    A = 4'b1001; // 9 in BCD
    B = 4'b1001; // 9 in BCD
    #40;

    // Apply inputs
    M = 0;
    A = 4'b0011; // 3 in BCD
    B = 4'b0111; // 7 in BCD
    #40;

    // Apply inputs
    M = 0;
    A = 4'b1010; // Invalid BCD
    B = 4'b0110; // 6 in BCD
    #40;

    // End simulation
    $finish;
  end
endmodule