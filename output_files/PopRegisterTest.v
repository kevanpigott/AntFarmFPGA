//Author: Kevan Pigott
module PopRegisterTest(PushIn,PopOut,Push,Pop,ReadOut,write, clk);
input Push;
input Pop;
input clk;
input write;
input [2:0]PushIn;

output reg [2:0]PopOut;
output reg [2:0]ReadOut;
parameter W=2;//node width
parameter S=32;//number of nodes should be 32
parameter L=96;//S*W;//overall length of array
reg [L:0]store;//stores 128/4 moves = 32 moves
//inout reg [L:0]Down;
reg [L-W:0]tempStore;
//array top [0,W,W*2,...,L-W,W*S or L] bottom
always@(*)
begin
ReadOut=store[W:0]; 
end
 
always@(posedge clk)
begin
case({Push,Pop})
	2'd0:	store<=store;//push=0, pop=0;
	2'd1:	//push=0 pop=1 
		begin
			PopOut<=store[W:0];
			tempStore<=store[L:W];
			store[L-W:0]<=tempStore;
			store[L:L-W]<=3'd0;
		end
	2'd2:	//push=1 pop=0;
		begin
			tempStore<=store[L-W:0];
			store[W:0]<=PushIn;
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

