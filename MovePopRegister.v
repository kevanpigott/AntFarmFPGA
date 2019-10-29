module MovePopRegister(moveIn,popTop,Write,Pop);
input Write;
input Pop;
input [2:0]moveIn;
output reg [2:0]popTop;
parameter N=32*4;//32*4
reg [N:0]store;//stores 128/4 moves = 32 moves
always@(*)
begin
case({Write,Pop})
	2'd0:	store=store;//wrie=0, pop=0;
	2'd1:	
	begin
		popTop <= store[N:(N-4)];
	end
	2'd2:	store=store;//write=1 pop=0;
	2'd3:	store=store;//write=1 pop =1;
endcase
end

endmodule

