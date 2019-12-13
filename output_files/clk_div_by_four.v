//Author: Kevan Pigott
module clk_div_by_four(clk,out);
input clk;
output reg out;
reg [3:0]count;
reg rise=0;
//works well
//[3:0] 2'd7
always@(posedge clk)begin
out<=rise;
if(count==2'd7) begin
rise=!rise;
end
count=count+1;
end
endmodule