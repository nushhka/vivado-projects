module ha_testbench;
reg a,b;
wire s,c;
    
half_adders HA1(a,b,s,c);

initial begin
a=0;b=0;
#10
a=0;b=1;
#10
a=1;b=0;
#10
a=1;b=1;
#10
$finish();
end

endmodule