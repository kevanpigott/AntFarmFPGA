module kevansVGAtesterthing(clk,out);
output reg [47:0] out;
reg [1:0] count1;
reg [1:0] count2;
reg [1:0] count3;
reg [1:0] count4;
reg [1:0] count5;
reg [1:0] count6;
reg [1:0] count7;
reg [1:0] count8;

input clk;

initial begin
	count1=2'd0;
	count2=2'd0;
	count3=2'd0;
	count4=2'd0;
	count5=2'd0;
	count6=2'd0;
	count7=2'd0;
	count8=2'd0;
end
always@(posedge clk) begin

	count8<=count7;
	count7<=count6;
	count6<=count5;
	count5<=count4;
	count4<=count3;
	count3<=count2;
	count2<=count1;
	count1<=count1+1;
	
	out[1:0]<=count1;
	out[3:2]<=count2;
	out[5:4]<=count3;
	out[9:6]<=count4;
	out[13:10]<=count5;
	out[17:14]<=count6;
	out[21:18]<=count7;
	out[25:22]<=count8;
	
	
end


endmodule