`timescale 1ns / 1ps

module tb;

reg [2:0]opcode;
reg [7:0]A,B;
wire [7:0]result;

alu uut(opcode,A,B,result);

integer i;

initial begin
A = 50; B = 10; opcode = 0;

for(i = 1; i < 8; i = i+ 1)begin
    #10
    opcode = i;
end

#10
$finish();

end

endmodule
