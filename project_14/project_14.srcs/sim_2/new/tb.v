`timescale 1ns / 1ps

module evm_tb;

    // Declare signals
    reg clk, rst, mode;
    reg [3:0] buttons;
    wire co, cooldown;
    wire [3:0] leds, display;
    
    // Instantiate the EVM module
    evm uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .buttons(buttons),
        .co(co),
        .leds(leds),
        .cooldown(cooldown),
        .c(1'b0),
        .display(display)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
        rst = 1;
        mode = 0;
        buttons = 4'b0000;
        #10 rst = 0;
        #50 mode = 1;
        #100 buttons = 4'b0001; // Simulate button press for candidate 1
        #150 buttons = 4'b0000; // Simulate button release
        // Add more test cases as needed
        #200 $finish;
    end

    // Monitor
    always @(posedge clk) begin
        $display("clk=%b, rst=%b, mode=%b, buttons=%b, co=%b, leds=%b, cooldown=%b, display=%b", clk, rst, mode, buttons, co, leds, cooldown, display);
    end

endmodule
