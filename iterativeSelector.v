//Author:Kevan Pigott
module iterativeSelector(clk,selectOut);
input clk;
reg [5:0]count;
output reg [5:0]selectOut;
initial begin
	count=6'd0;
end
always@(posedge clk) begin
	selectOut=count;
	count=count+1;
end
endmodule