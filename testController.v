//Author:Kevan Pigott
module testController(leftIn,leftOut,Inputs,RW,out);
input [2:0]leftIn;
output reg [2:0]leftOut;
input [2:0]Inputs;
input [1:0]RW;
output reg [3:0]out;

always@(*)
begin
	case({RW})
	2'b00:out<=Inputs;
	2'b01:out<=leftIn;
	2'b10:leftOut<=Inputs;
	2'b11:out<=4'h15;
	endcase
end
endmodule