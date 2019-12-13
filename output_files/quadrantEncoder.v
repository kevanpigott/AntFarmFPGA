//Author: Kevan Pigott
module quadrantEncoder(clk_in,clk_out,out,quadrantOut,inA,inB,inC,inD,quadrantIn);
input clk_in;
output clk_out=clk_in;

input [1:0]quadrantIn;
output [1:0]quadrantOut=quadrantIn;
input [104:0]inA;
input [104:0]inB;
input [104:0]inC;
input [104:0]inD;
output reg [104:0] out;
parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;
always@(*)begin
	case({quadrantIn})
		A:out=inA;
		B:out=inB;
		C:out=inC;
		D:out=inD;
		endcase
end

endmodule