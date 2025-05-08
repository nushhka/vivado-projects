`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 00:03:23
// Design Name: 
// Module Name: pe
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


module priority_encoder(
    input [3:0] in,
    input en,
    output reg [1:0] out
);

always @(*)
begin
    if(en==1)
      begin
        if(in[3]==1) out = 2'b11;
        else if(in[2]==1) out = 2'b10;
        else if(in[1]==1) out = 2'b01;
        else out = 2'b00;
      end
    else out=2'bzz;
end
endmodule
