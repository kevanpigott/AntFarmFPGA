//Author:Kevan Pigott
module quadrantMux(in4,in2,select,out);
input [1:0]select;
input[1:0]in2;
input[1:0]in4;
output reg [1:0] out;
always@(*) begin
	if(select==2'b00)begin
		out=2'b00;
	end else if (select==2'b01) begin
		out=in2;
	end else if (select==2'b10) begin
		out=in4;
	end else begin
		out=2'b11;
	end
end
endmodule