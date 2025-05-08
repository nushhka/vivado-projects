`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 15:46:29
// Design Name: 
// Module Name: shift_register
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


module shift_register(load,w,clock,data_in,data_out);
    input load;
    input w;
    input [3:0] data_in;
    input clock;
    output reg [3:0] data_out;
    always@(posedge clock)
    begin
    if(load==0)
    begin
        data_out[0] <= data_out[1];
        data_out[1] <= data_out[2];
        data_out[2] <= data_out[3];
        data_out[3] <= w;
    end
    else if(load==1)
        data_out = data_in;
    end
endmodule
