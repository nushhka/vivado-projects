`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 13:27:52
// Design Name: 
// Module Name: sevensegdisplay
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

// common anode SSD - LED glows if input is 0
module sevensegdisplay(input A3, A2, A1, A0, output a, b, c, d, e, f, g);

assign a = ~(A3 | A1 | (A2 & A0) | (~A2 & ~A0));

assign b = ~(~A2 | (~A1 & ~A0) | (A1 & A0));

assign c = ~(A2 | ~A1 | A0);

assign d = ~(A3 | (~A2 & A1) | (~A2 & ~A0) | (A1&~A0) | (A2 & ~A1 & A0));

assign e = ~((A1&~A0) | (~A2 & ~A0));

assign f = ~(A3 | (~A1&~A0) | (A2 & ~A1) | (A2 & ~A0));

assign g = ~(A3 | (A2&~A1) | (~A2 & A1) | (A1 & ~A0));

endmodule

//Verilog module.
//module sevensegdisplay(input A3, A2, A1, A0, output a, b, c, d, e, f, g);

//wire input_above_1001 = (A3 | A2 | A1 | A0) > 4'b1001;

//assign a = ~(A3 | A1 | (A2 & A0) | (~A2 & ~A0));
//assign b = ~(~A2 | (~A1 & ~A0) | (A1 & A0));
//assign c = ~(A2 | ~A1 | A0);
//assign d = ~(A3 | (~A2 & A1) | (~A2 & ~A0) | (A1&~A0) | (A2 & ~A1 & A0));
//assign e = ~((A1&~A0) | (~A2 & ~A0));
//assign f = ~(A3 | (~A1&~A0) | (A2 & ~A1) | (A2 & ~A0));

//assign g = input_above_1001 ? 0 : ~(A3 | (A2&~A1) | (~A2 & A1) | (A1 & ~A0));

//endmodule


