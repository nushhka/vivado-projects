//Testbench

//Testbench 
module tb;

reg [3:0] A, B;

wire [3:0] S;

wire Cout;

four_bit_adder B4add(A, B, S, Cout);

// Test values

initial begin

// Test Case 1:3+5=8 A = 4'b0011; B = 4'b0101; #20;

// Test Case 2:12 + 10 = 22 (6 with carry)

A = 4'b1100; B = 4'b1010; #20;
// Test Case 3: 7 + 9 = 16 (0 with carry) 
A=4'b0111 ; B=4'b1001 ; #20;

// Test Case 4: 15+1 = 16 (0 with carry) 
A=4'b1111; B=4'b0001 ; #20;

// Test Case 5:8 + 7 = 15 
A=4'b1000; B='b0111 ; #20;

// Stop simulation

$finish;

end

endmodule;