module MovePopRegister(Left,Right,Push,Pop);
input Push;
input Pop;
inout [2:0]Left;
inout [2:0]Right;
parameter W=3;//node width
parameter S=32;//number of nodes
parameter L=S*W;//overall length of array
reg [L:0]store;//stores 128/4 moves = 32 moves
//inout reg [L:0]Down;
reg [L-W:0]tempStore;
//array Left [0,W,W*2,...,L-W,W*S or L] Right

always@(*)
begin
case({Push,Pop})
	2'd0:	store=store;//push=0, pop=0;
	2'd1:	//push=0 pop=1 
		begin
			Left<=store[W:0];
			tempStore<=store[L:W];
			store[L-W:0]<=tempStore;
			store[L:L-W]<=8'd0;
		end
	2'd2:	//push=1 pop=0;
		begin
			tempStore<=store[L-W:0];
			store[W:0]<=Left;
			store[L:W]<=tempStore;
		end
	2'd3://push=1 pop =1; Transfer all
		begin
			//Down<=store;
			store<=store;
			//store<=Down;
		end
endcase
end

endmodule
