`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 12:54:57
// Design Name: 
// Module Name: serialadder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module serialadder(DATA, loadA, loadB, start, clk, regA, regB, rst, co, cout_f);
input [3:0] DATA;
input loadA, loadB, start, clk, rst;
output reg [3:0] regA, regB;
output co;
output reg cout_f;

reg cin;
reg [27:0] count=0;

wire w1,w2,w3,cout,sum;

assign co=count[27];

always@(posedge clk)
    count=count+1;
    
xor(sum, regA[0], regB[0], cin);
and(w1, regA[0], regB[0]);
and(w2, regA[0], cin);
and(w3, regB[0], cin);
or(cout,w1,w2,w3);
always@(posedge clk)
begin
if(rst)
    begin
    regA<=4'b0000;
    regB<=4'b0000;
    cin<=1'b0;
    cout_f<=1'b0;
    end
else if(loadA)
regA<=DATA;
else if(loadB)
regB<=DATA;
else if(start)
    begin
    regB<=regB>>1;
    regA<=regA>>1;
    regA[3]<=sum;
    cin<=cout;
    cout_f<=cout;
    end
end
endmodule
