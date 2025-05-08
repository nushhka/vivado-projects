
`timescale 1ns / 1ps

module tb_safe();

    reg clk;
    reg startLoginBtn, logoutBtn, rstpwBtn, cnf, backSpace;
    reg [9:0] keypad;
    wire [3:0] an;
    wire [6:0] seg;
    wire a, b, c, d, p, lck;
    wire [2:0] rgb;
    wire [6:0] error;
    wire clko;

    digital_Safe safe_inst(
        .clk(clk),
        .startLoginBtn(startLoginBtn),
        .logoutBtn(logoutBtn),
        .rstpwBtn(rstpwBtn),
        .cnf(cnf),
        .backSpace(backSpace),
        .keypad(keypad),
        .an(an),
        .seg(seg),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .p(p),
        .rgb(rgb),
        .error(error),
        .clko(clko),
        .lck(lck)
    );

    initial begin
        $dumpfile("tb_safe.vcd");
        $dumpvars(0, tb_safe);

        // Initialize inputs
        clk = 0;
        startLoginBtn = 0;
        logoutBtn = 0;
        rstpwBtn = 0;
        cnf = 0;
        backSpace = 0;
        keypad = 0;

        // Run the simulation for 100 clock cycles
        #100 $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

    // Simulate password entry
    initial begin
        // Wait for a few cycles
        #10;

        // Simulate entering the password "2301"
        // First digit: 2
        keypad = 10'b0000000010;
        #10;
        // Second digit: 3
        keypad = 10'b0000000011;
        #10;
        // Third digit: 0
        keypad = 10'b0000000000;
        #10;
        // Fourth digit: 1
        keypad = 10'b0000000001;
        #10;

        // Wait for a few cycles
        #10;

        // Simulate other inputs (e.g., pressing confirmation button)
        cnf = 1;
        #10;
        cnf = 0;

        // Wait for the simulation to end
        #100;
    end

endmodule

