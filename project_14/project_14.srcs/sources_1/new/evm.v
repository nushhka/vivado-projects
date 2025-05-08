`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 22:21:28
// Design Name: 
// Module Name: evm
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



module evm (
    input clk, // clock signal
    input rst, // reset signal
    
    input [3:0] buttons, // four input buttons for voting
    input mode, // mode signal to select between voting and winner mode
    output reg co=0, // clock out signal
    output reg [3:0] leds=0 ,
    output reg cooldown=0,
    input c,// four output LED displays for the vote counts,
    output reg [3:0]display=0
);
 reg [3:0] max_votes=0 ;
// Define the votes registers
reg [3:0] c1=4'b0001;
reg [3:0] c2=0;
reg [3:0] c3=0;
reg [3:0] c4=0;


// Define the count register
reg [27:0] count=0;

// Add code for the clk input signal
always @(posedge clk) begin

if(rst == 1)
begin
 c1 <= 4'b0000;
    c2 <= 4'b0000;
    c3 <= 4'b0000;
    c4 <= 4'b0000;
    co<=0;
    max_votes<=4'b0000;
//    cooldown <= 1'b0;
    leds <= 4'b0000;
   
end
    count <= count + 1;
    co <= count[27];
    
    // Add code for the mode input signal
    if (mode == 0) begin
        // Voting mode
        case (buttons)
            
            4'b0001: if (cooldown ==0 ) begin c1 <= c1 + 1;  cooldown <= 1;leds<=4'b0001; end // increment vote for candidate 1 if cooldown flag is not set and button not pressed in this cooldown period
            4'b0010: if (cooldown ==0 ) begin c2 <= c2 + 1;  cooldown <= 1; leds<=4'b0010; end // increment vote for candidate 2 if cooldown flag is not set and button not pressed in this cooldown period
            4'b0100: if (cooldown ==0  ) begin c3 <= c3 + 1;  cooldown <= 1; leds<=4'b0100; end // increment vote for candidate 3 if cooldown flag is not set and button not pressed in this cooldown period
            4'b1000: if (cooldown ==0 ) begin c4 <= c4 + 1; cooldown <= 1; leds<=4'b1000; end // increment vote for candidate 4 if cooldown flag is not set and button not pressed in this cooldown period
            4'b0000:if(buttons==4'b0000)begin cooldown<=0; leds<=4'b0000;end
            default: leds<=4'b0000;
        endcase  
        // Add code for the cooldown flag
//    if (cooldown && count[27]) begin cooldown <= 0; end // cooldown period is 1 second (assuming 1 Hz clock)
    end 
    //win mode starts from here
    if(mode==1)begin 
    if(co)begin
     leds<=4'b0000;
     end
    // Winner mode
    // Find the candidate with the most votes
    
    if (c1 >= c2 && c1 >= c3 && c1 >= c4) begin
        max_votes <= c1;
    end else if (c2 >= c3 && c2 >= c4) begin
        max_votes <= c2;
    end else if (c3 >= c4) begin
        max_votes <= c3;
    end else begin
        max_votes <= c4;
    end

    // turn on the LEDs of the candidate(s) with the most votes
    
    if (c1 == max_votes) begin

             #100 leds[0] <= 1;       
    end 
    
    if (c2 == max_votes ) begin

             #100 leds[1] <= 1;
    end 
    
    if (c3 == max_votes ) begin

            #100 leds[2] <= 1;
    end
    
    if (c4 == max_votes ) begin
             #100 leds[3] <= 1;
    end
    case (buttons)
            
            4'b0001: if (cooldown ==0 ) begin display<=c1; end  
            4'b0010: if (cooldown ==0 ) begin display<=c2; end 
            4'b0100: if (cooldown ==0  ) begin display<=c3; end 
            4'b1000: if (cooldown ==0 ) begin display<=c4; end 
            4'b0000:if(buttons==4'b0000)begin display<=4'b0000;end
            default: leds<=4'b0000;
        endcase  
end
    
end

endmodule
