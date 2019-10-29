module testController(left,Inputs,RW,out);
inout [2:0]left;
input [2:0]Inputs;
input [1:0]RW;
output reg [3:0]out;

always@(*)
begin
	case({RW})
	2'b00:out<=Inputs;
	2'b01:out<=left;
	2'b10:left<=Inputs;
	2'b11:out<=4'h15;
	endcase
end
endmodule