module ThreeBitPopRegisterNode(left,right, down, push, pop);

input pop;
input push;
inout reg[2:0]left;
inout reg[2:0]right;
inout reg[2:0]down;//for moving all data to parralel ThreeBitpopRegisterNode
reg [2:0]store;


initial begin
	store<=3'b0;
end

always@(*)

begin
	case({pop,push})
		2'd0: store<=store;
		2'b01: 
			begin
				right<=store;
				store<=left;
			end
		2'b10:
			begin
				left<=store;
				store<=right;
			end
		2'b11:
			begin
				down<=store;
				store<=down;
			end
		default: store<=store;
	endcase
end

endmodule