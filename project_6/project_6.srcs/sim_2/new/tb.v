`timescale 1ns / 1ps

module tb_decoder_4x16;

    reg [3:0] a;
    reg en;
    wire [15:0] y;

    decoder_4x16 dut (
        .a(a),
        .en(en),
        .y(y)
    );

    initial begin
        en = 1'b0;
        a = 4'bxxxx; // Don't care value
        #10;
        a = 4'b0000;
        en = 1'b1;
        #10;
        a = 4'b0001;
        en = 1'b1;
        #10;
        a = 4'b0010;
        en = 1'b1;
        #10;
        a = 4'b0011;
        en = 1'b1;
        #10;
        a = 4'b0100;
        en = 1'b1;
        #10;
        a = 4'b0101;
        en = 1'b1;
        #10;
        a = 4'b0110;
        en = 1'b1;
        #10;
        a = 4'b0111;
        en = 1'b1;
        #10;
        a = 4'b1000;
        en = 1'b1;
        #10;
        a = 4'b1001;
        en = 1'b1;
        #10;

        $finish;
    end

endmodule