//Author: Kevan Pigott
module quadrentSelector(clk,out);

input clk;
output reg [1:0]out;

reg [1:0]count;

always@(*)begin
	out=count;
end

always@(posedge clk) begin
	count<=count+1;
end

endmodule