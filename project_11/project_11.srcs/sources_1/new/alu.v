`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 14:43:09
// Design Name: 
// Module Name: alu
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

//8-bit arithmetic and logical unit
module alu(
input [2:0]opcode,
input [7:0] A,B,
output reg [7:0]result
    );
    
always @(*) begin
case(opcode)
3'b000:
    result = 8'b00000000;  //reset
3'b001:
    result = A + B; //add
3'b010:
    result = A - B; //sub
3'b011:
    result = A & B;  //and
3'b100:
    result = A | B; //or
3'b101:
    result = A ^ B; //xor
3'b110:
    result = A ~^ B;  //xnor
3'b111:
    result = 8'b11111111;  //preset
default:
    result = 0;
    endcase
end

endmodule
