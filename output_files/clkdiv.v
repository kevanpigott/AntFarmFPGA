module clkdiv(clk,out);
input clk;
output reg out;
reg [63:0]count;
reg store;
initial begin
	count=0;
	store=0;
end

always@(posedge clk) begin
	out<=store;
	if((count%500000)==0) begin
		store<=!store;
		count=count+1;
	end else begin
		count=count+1;
	end
end
endmodule