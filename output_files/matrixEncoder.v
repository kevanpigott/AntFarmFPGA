module matrixEncoder(clk,ZZ,ZO,OZ,OO,tZ,tO,outSel,outCol);

input clk;

//disp out from matrix Z means Zero, O means one, t means 2, bottom left is ZZ, top right is tO.
input [4:0]ZZ;
input [4:0]ZO;
input [4:0]OZ;
input [4:0]OO;
input [4:0]tZ;
input [4:0]tO;

output reg [5:0]outSel;
output reg [2:0]outCol;

reg [2:0] CS;
reg [2:0] NS;
reg [5:0] storeSel;
reg [2:0] storeCol;
parameter empty=3'd0, air=3'd1, dirt=3'd2, ground=3'd3, queen=3'd4, wall=3'd5, errorblock=3'd6, tunnel=3'd7;

always@(*)begin
CS<=NS;
end

always@(posedge clk)begin
	case({CS})
		3'd0:
			begin
				//storeSel<=3'd0;
				outSel<=storeSel;
				if(ZZ[4]==1'b1)begin//sugar
					storeCol<=3'd1;
				end else if(ZZ[3]==1'b1)begin//ant
					storeCol<=3'd0;
				end else begin
					if(ZZ[2:0]==ground) begin
						storeCol<=3'd2;
					end else if((ZZ[2:0]==tunnel)|(ZZ[2:0]==wall))begin
						storeCol<=3'd4;
					end else begin
						storeCol<=3'd7;
					end
				end
				outSel<=storeSel;
				outCol<=storeCol;
				NS<=3'd1;
			end
		3'd1:
			begin
				storeSel<=3'd1;
				if(ZO[4]==1'b1)begin//sugar
					storeCol<=3'd1;
				end else if(ZO[3]==1'b1)begin//ant
					storeCol<=3'd0;
				end else begin
					if(ZO[2:0]==ground) begin
						storeCol<=3'd2;
					end else if((ZO[2:0]==tunnel)|(ZO[2:0]==wall))begin
						storeCol<=3'd4;
					end else begin
						storeCol<=3'd7;
					end
				end
				outSel<=storeSel;
				outCol<=storeCol;
				NS<=3'd2;
			end
		3'd2:
			begin
				storeSel<=3'd2;
				if(OZ[4]==1'b1)begin//sugar
					storeCol<=3'd1;
				end else if(OZ[3]==1'b1)begin//ant
					storeCol<=3'd0;
				end else begin
					if(OZ[2:0]==ground) begin
						storeCol<=3'd2;
					end else if((OZ[2:0]==tunnel)|(OZ[2:0]==wall))begin
						storeCol<=3'd4;
					end else begin
						storeCol<=3'd7;
					end
				end
				outSel<=storeSel;
				outCol<=storeCol;
				NS<=3'd3;
			end
		3'd3:
			begin
				storeSel<=3'd3;
				if(OO[4]==1'b1)begin//sugar
					storeCol<=3'd1;
				end else if(OO[3]==1'b1)begin//ant
					storeCol<=3'd0;
				end else begin
					if(OO[2:0]==ground) begin
						storeCol<=3'd2;
					end else if((OO[2:0]==tunnel)|(OO[2:0]==wall))begin
						storeCol<=3'd4;
					end else begin
						storeCol<=3'd7;
					end
				end
				outSel<=storeSel;
				outCol<=storeCol;
				NS<=3'd4;
			end
		3'd4:
			begin
				storeSel<=3'd4;
				if(tZ[4]==1'b1)begin//sugar
					storeCol<=3'd1;
				end else if(tZ[3]==1'b1)begin//ant
					storeCol<=3'd0;
				end else begin
					if(tZ[2:0]==ground) begin
						storeCol<=3'd2;
					end else if((tZ[2:0]==tunnel)|(tZ[2:0]==wall))begin
						storeCol<=3'd4;
					end else begin
						storeCol<=3'd7;
					end
				end
				outSel<=storeSel;
				outCol<=storeCol;
				NS<=3'd5;
			end
		3'd5:
			begin
				storeSel<=3'd5;
				if(tO[4]==1'b1)begin//sugar
					storeCol<=3'd1;
				end else if(tO[3]==1'b1)begin//ant
					storeCol<=3'd0;
				end else begin
					if(tO[2:0]==ground) begin
						storeCol<=3'd2;
					end else if((tO[2:0]==tunnel)|(tO[2:0]==wall))begin
						storeCol<=3'd4;
					end else begin
						storeCol<=3'd6;
					end
				end
				outSel<=storeSel;
				outCol<=storeCol;
				NS<=3'd1;
			end
		default:
			begin
				NS<=3'd0;
			end
	endcase
end
endmodule