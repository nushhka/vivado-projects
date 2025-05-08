`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 14:24:50
// Design Name: 
// Module Name: add_display
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


module full_adder(input X, input Y, input Cin, output Sum, output Cout);
    assign {Cout, Sum} = X + Y + Cin;
endmodule

// 4-bit Adder Module
module four_bit_adder(input [3:0] A, input [3:0] B, output [3:0] S, output Co);
   wire [3:0] C;
   full_adder fa0(A[0], B[0], 0, S[0], C[0]);
   full_adder fa1(A[1], B[1], C[0], S[1], C[1]);
   full_adder fa2(A[2], B[2], C[1], S[2], C[2]);
   full_adder fa3(A[3], B[3], C[2], S[3], Co);
endmodule
module BinaryToDecimal (input [4:0] binary, output reg [4:0] decimal, output reg [3:0] dec_tens, output reg [3:0] dec_ones);
  always @ (binary)
  begin
     case (binary)
            5'b00000: begin decimal = 5'd0; dec_tens = 4'b0000; dec_ones = 4'b0000; end
            5'b00001: begin decimal = 5'd1; dec_tens = 4'b0000; dec_ones = 4'b0001; end
            5'b00010: begin decimal = 5'd2; dec_tens = 4'b0000; dec_ones = 4'b0010; end
            5'b00011: begin decimal = 5'd3; dec_tens = 4'b0000; dec_ones = 4'b0011; end
            5'b00100: begin decimal = 5'd4; dec_tens = 4'b0000; dec_ones = 4'b0100; end
            5'b00101: begin decimal = 5'd5; dec_tens = 4'b0000; dec_ones = 4'b0101; end
            5'b00110: begin decimal = 5'd6; dec_tens = 4'b0000; dec_ones = 4'b0110; end
            5'b00111: begin decimal = 5'd7; dec_tens = 4'b0000; dec_ones = 4'b0111; end
            5'b01000: begin decimal = 5'd8; dec_tens = 4'b0000; dec_ones = 4'b1000; end
            5'b01001: begin decimal = 5'd9; dec_tens = 4'b0000; dec_ones = 4'b1001; end
            5'b01010: begin decimal = 5'd10; dec_tens = 4'b0001; dec_ones = 4'b0000; end
            5'b01011: begin decimal = 5'd11; dec_tens = 4'b0001; dec_ones = 4'b0001; end
            5'b01100: begin decimal = 5'd12; dec_tens = 4'b0001; dec_ones = 4'b0010; end
            5'b01101: begin decimal = 5'd13; dec_tens = 4'b0001; dec_ones = 4'b0011; end
            5'b01110: begin decimal = 5'd14; dec_tens = 4'b0001; dec_ones = 4'b0100; end
            5'b01111: begin decimal = 5'd15; dec_tens = 4'b0001; dec_ones = 4'b0101; end
            5'b10000: begin decimal = 5'd16; dec_tens = 4'b0001; dec_ones = 4'b0110; end
            5'b10001: begin decimal = 5'd17; dec_tens = 4'b0001; dec_ones = 4'b0111; end
            5'b10010: begin decimal = 5'd18; dec_tens = 4'b0001; dec_ones = 4'b1000; end
            5'b10011: begin decimal = 5'd19; dec_tens = 4'b0001; dec_ones = 4'b1001; end
            5'b10100: begin decimal = 5'd20; dec_tens = 4'b0010; dec_ones = 4'b0000; end
            5'b10101: begin decimal = 5'd21; dec_tens = 4'b0010; dec_ones = 4'b0001; end
            5'b10110: begin decimal = 5'd22; dec_tens = 4'b0010; dec_ones = 4'b0010; end
            5'b10111: begin decimal = 5'd23; dec_tens = 4'b0010; dec_ones = 4'b0011; end
            5'b11000: begin decimal = 5'd24; dec_tens = 4'b0010; dec_ones = 4'b0100; end
            5'b11001: begin decimal = 5'd25; dec_tens = 4'b0010; dec_ones = 4'b0101; end
            5'b11010: begin decimal = 5'd26; dec_tens = 4'b0010; dec_ones = 4'b0110; end
            5'b11011: begin decimal = 5'd27; dec_tens = 4'b0010; dec_ones = 4'b0111; end
            5'b11100: begin decimal = 5'd28; dec_tens = 4'b0010; dec_ones = 4'b1000; end
            5'b11101: begin decimal = 5'd29; dec_tens = 4'b0010; dec_ones = 4'b1001; end
            5'b11110: begin decimal = 5'd30; dec_tens = 4'b0011; dec_ones = 4'b0000; end
            5'b11111: begin decimal = 5'd31; dec_tens = 4'b0011; dec_ones = 4'b0001; end
            default: begin decimal = 5'dx; dec_tens = 4'bx; dec_ones = 4'bx; end // Undefined (you can choose a default)
    endcase
  end
endmodule
// BCD to Seven Segment Decoder
module BCD_to_SevenSegment (input [3:0] bcd_input, output reg [6:0] seven_segment_output);
    always @(bcd_input) begin
        case (bcd_input)
            4'b0000: seven_segment_output = 7'b1000000; // 0
            4'b0001: seven_segment_output = 7'b1111001; // 1
            4'b0010: seven_segment_output = 7'b0100100; // 2
            4'b0011: seven_segment_output = 7'b0110000; // 3
            4'b0100: seven_segment_output = 7'b0011001; // 4
            4'b0101: seven_segment_output = 7'b0010010; // 5
            4'b0110: seven_segment_output = 7'b0000010; // 6
            4'b0111: seven_segment_output = 7'b1111000; // 7
            4'b1000: seven_segment_output = 7'b0000000; // 8
            4'b1001: seven_segment_output = 7'b0010000; // 9
            default: seven_segment_output = 7'b0000011; // Display E for undefined BCD input
        endcase
    end
endmodule

module disp_add(input [3:0] dec_tens, input [3:0] dec_ones, output [6:0] s_tens, output [6:0] s_ones);
    BCD_to_SevenSegment tens_(dec_tens, s_tens);
    BCD_to_SevenSegment ones_(dec_ones, s_ones);
endmodule

module fourbitadd_display(input [3:0] A, input [3:0] B, output [6:0] SSD_tens, output [6:0] SSD_ones);
    wire [3:0] s;
    wire c;
    wire [3:0] dec, d_tens, d_ones;
    four_bit_adder FourBAdd(A, B, s, c);
    BinaryToDecimal bin2dec({c, s}, dec, d_tens, d_ones);
    disp_add D_and_A(d_tens, d_ones, SSD_tens, SSD_ones);
endmodule
