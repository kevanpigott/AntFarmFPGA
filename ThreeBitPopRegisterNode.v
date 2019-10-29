module ThreeBitPopRegisterNode(left,right,push, pop);

input pop;
input push;
inout reg[2:0]left;
inout reg[2:0]right;
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
		default: store<=store;
	endcase
end

endmodule