`timescale 1ns / 1ps

module tb_example();

    // Inputs
    reg clk, rst, loadA, loadB, start;
    reg [3:0] DATA;

    // Outputs
    wire [3:0] regA, regB;
    wire co,cout_f;

    // Instantiate the design module
    serialadder dut (
        .clk(clk),
        .rst(rst),
        .loadA(loadA),
        .loadB(loadB),
        .start(start),
        .regA(regA),
        .regB(regB),
        .DATA(DATA),
        .co(co),
        .cout_f(cout_f)
    );

    // Clock generation
always #5 clk = ~clk;
    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        loadA = 0;
        loadB = 0;
        start = 0;
        DATA = 4'b1010; // Example input

        // Apply reset
        #10;
        rst=0;
       

        // Load data into register A
        loadA = 1;
        DATA = 4'b1100; // New example input for register A
        #10;
        loadA = 0;
       

        // Load data into register B
        loadB = 1;
        DATA = 4'b0110; // New example input for register B
        #10;
        loadB = 0;
        

        // Start the process
        start = 1;
        #40;
        start = 0;
        #10;
        rst=1;
        #10;
        
      
        rst=1;
        DATA=4'b0010;
        #10;
        
        rst=0;
        loadA=1;
        #10;
        loadA=0;
        #10;
        DATA=4'b0101;
        loadB=1;
        #20;
        loadB=0;
        start=1;
        #40;
        start=0;
        #20
        
        
        
        // End simulation
        $finish;
    end

endmodule
