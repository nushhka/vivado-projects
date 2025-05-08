`timescale 1ns / 1ps

module tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Inputs
  reg clk;
  reg [3:0] data_in;
  reg [1:0] sel;

  // Outputs
  wire [5:0] data_out;

  // Instantiate the module
  Shift dut (
    .clk(clk),
    .data_in(data_in),
    .sel(sel),
    .data_out(data_out)
  );

  // Clock generation
  always #((CLK_PERIOD)/2) clk = ~clk;

  // Test stimulus
  initial begin
    clk = 0;
    data_in = 4'b0000;
    sel = 2'b00;

    #10; // Wait a bit before changing inputs

    // Test case 1: No shift
    data_in = 4'b1010;
    sel = 2'b00;
    #10; // Wait for one clock cycle
    // Expected output: 001010
    $display("Test case 1: No shift, data_out = %b", data_out);

    // Test case 2: 1 bit left shift
    data_in = 4'b1011;
    sel = 2'b01;
    #10; // Wait for one clock cycle
    // Expected output: 010100
    $display("Test case 2: 1 bit left shift, data_out = %b", data_out);

    // Test case 3: 2 bit left shift
    data_in = 4'b1010;
    sel = 2'b10;
    #10; // Wait for one clock cycle
    // Expected output: 101000
    $display("Test case 3: 2 bit left shift, data_out = %b", data_out);

    // Test case 4: 1 bit right shift
    data_in = 4'b1001;
    sel = 2'b11;
    #10; // Wait for one clock cycle
    // Expected output: 010100
    $display("Test case 4: 1 bit right shift, data_out = %b", data_out);

    // Add more test cases if needed

    $finish; // End simulation
  end

endmodule

    // Monitor
//    always @(posedge clk) begin
//        $display("Time = %0t, in_data = %b, sel = %b, ans = %b", $time, in_data, sel, ans);
