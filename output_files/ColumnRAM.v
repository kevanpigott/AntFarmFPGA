//Author: Kevan Pigott
module ColumnRAM(inSelW,inColW,outRead,inW);
input inW;
input [3:0]inSelW;
input [2:0]inColW;
reg [11:0]store;
output reg[11:0]outRead;

always@(*)begin
	case({inSelW})
		3'd0:
		begin
			if(inW==1'b1)begin
				store[2:0]<=inColW;
			end
		end
		3'd1:
		begin
			if(inW==1'b1)begin
				store[5:3]<=inColW;
			end
		end
		3'd2:
		begin
			if(inW==1'b1)begin
				store[8:6]<=inColW;
			end
		end
		3'd3:
		begin
			if(inW==1'b1)begin
				store[11:9]<=inColW;
			end
		end
		default:store<=12'hffffff;
	endcase
end
endmodule

