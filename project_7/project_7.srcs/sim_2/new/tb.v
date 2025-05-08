`timescale 1ns / 1ps

module priority_encoder_tb;

reg [3:0] in;
reg en;
wire [1:0] out;

priority_encoder DUT(
    .in(in),
    .en(en),
    .out(out)
);
integer i;
initial begin
    for (i = 0; i < 16; i = i + 1) begin
        in = i;
        en = 1;
        #10;
        $display("Input: %b, Output: %b", in, out);
    end
    $finish;
end

endmodule
