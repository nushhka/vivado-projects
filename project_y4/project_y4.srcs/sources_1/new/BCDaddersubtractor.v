`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2024 01:20:34
// Design Name: 
// Module Name: BCDaddersubtractor
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


module BCD_addition_subtraction( 

input [3:0]A,
input [3:0]B, 
input M, 
output reg [4:0]out_value,
output reg [6:0]seg_out,
output reg c_sign);
    
reg [4:0] temp_out_value;
always @(*)
begin if (A<=4'b1001 && B<=4'b0101)
begin
if (M==1)
    begin
    if (A>=B)
      begin
      out_value=A-B;
      c_sign=0;
      end
      
    else
      begin
      out_value=B-A;
      c_sign=1;
    end
    end 
 else
 begin
  temp_out_value= A+B;
  if (temp_out_value >4'b1001)
  begin
    out_value= temp_out_value+ 0110;
  end
  
  else
  begin
   out_value= temp_out_value;
  end
  end
  end
    
 else 
    begin
     out_value= 4'b1111;
    end
    end
    
always @(*)
begin
   case(out_value[3:0])
      4'b0000: seg_out = 7'b1000000; //Display 0
      4'b0001: seg_out = 7'b1111001;   //Display 1
      4'b0010: seg_out = 7'b0100100;  //Display 2
      4'b0011: seg_out = 7'b0110000; //Display 3
      4'b0100: seg_out = 7'b0011001; //Display 4
      4'b0101: seg_out = 7'b0010010; //Display 5
      4'b0110: seg_out = 7'b0000010; //Display 6
      4'b0111: seg_out = 7'b1111000; //Display 7
      4'b1000: seg_out = 7'b0000000; //Display 8
      4'b1001: seg_out = 7'b0010000; //Display 9
      default: seg_out = 7'b1111111;
     endcase
 end
    
//      out_value= A-B;
//      sign=0;
     
//    else  if (M==1 && A<B)
//      begin
//      out_value= B-A;
//      sign=1;
//      }
    
endmodule

module add_sub( input [3:0]A, input [3:0]B, input M, output [6:0] seg_out, output c_out_sign);
BCD_addition_subtraction addition_sub(A,B, M, out_value, seg_out, c_out_sign);
endmodule


module testbench;
   reg[3:0] A;
   reg[3:0] B;
   reg M;
   
   wire C_sign;
   wire [4:0] out_value;
   wire [6:0] seg_out;
   wire [3:0] out;
   
   BCD_addition_subtraction uut(
    .A(A),
    .B(B),
    .M(M),
    .out_value(out_value),
    .seg_out(seg_out),
    .C_sign(C_sign)
   );
   assign out= out_value[3:0];
   
   initial begin
   
   M=1; A=4'b0011;
   B='b0110;
   #40;
   
   M=1; A=4'b0011;
   B=4'b0111;
   #40;
   
   M=1; A=4'b1011;
   B=4'b0101;
   #40;
   
   M=0; A=4'b1001;
   B=4'b1001;
   #40;
   
   M=0; A=4'b0011;
   B=4'b0111;
   #40;
   
   M=0; A=4'b1010;
   B=4'b0110;
   #40;
   $finish;
   end 

endmodule