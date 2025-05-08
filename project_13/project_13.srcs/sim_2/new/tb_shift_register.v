module tb_shift_register;
reg [3:0] data_in;
reg clock;
reg load;
reg w;
wire [3:0] data_out;

shift_register dut(load,w,clock,data_in,data_out);

always #5 clock = ~clock;

initial begin
clock = 0; w=0; load =1;
data_in = 4'b1010;

#20 load = 1; data_in = 4'b1110;
#20 load = 0; w = 0;
#20 load = 0; w=1;
#10;
$finish;
end
endmodule