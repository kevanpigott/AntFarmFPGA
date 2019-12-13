//Author: Kevan Pigott
module probe(select,inCdisp,inBdisp,inAdisp,inDdisp,inAstate,inBstate,inAoutNorth,inBoutSouth,outThousands,outHundreds,outTens,outOnes,clk);
input	[7:0]inAstate;
input	[7:0]inBstate;
input [4:0]inAdisp;
input [4:0]inBdisp;
input [4:0]inCdisp;
input [4:0]inDdisp;
input	[8:0]inAoutNorth;
input	[8:0]inBoutSouth;
input [3:0]select;
input clk;
output reg[6:0]outOnes;
output reg[6:0]outTens;
output reg[6:0]outHundreds;
output reg[6:0]outThousands;
//			|C|
//			 |
//			|B|
//			 |
//			|A|
//			 |
//			|D|

wire [6:0]BDoutA;
wire [6:0]BDoutB;
wire [6:0]BDoutC;
wire [6:0]BDoutD;
blockDisp inst_blockDisp1(.in(inAdisp),.out(BDoutA));
blockDisp inst_blockDisp2(.in(inBdisp),.out(BDoutB));
blockDisp inst_blockDisp3(.in(inCdisp),.out(BDoutC));
blockDisp inst_blockDisp4(.in(inDdisp),.out(BDoutD));

wire [3:0]ADEO;
wire [3:0]ADET;
wire [3:0]ADEH;
displayEncoder inst_displayEncoder1(.in(inAstate),.outTen(ADET),.outOne(ADEO),.outHundred(ADEH));

wire [6:0]ASDO;
wire [6:0]ASDT;
wire [6:0]ASDH;
display inst_11(.in(ADEO),.out(ASDO));
display inst_12(.in(ADET),.out(ASDT));
display inst_13(.in(ADEH),.out(ASDH));

wire [3:0]BDEO;
wire [3:0]BDET;
wire [3:0]BDEH;
displayEncoder inst_displayEncoder2(.in(inBstate),.outTen(BDET),.outOne(BDEO),.outHundred(BDEH));

wire [6:0]BSDO;
wire [6:0]BSDT;
wire [6:0]BSDH;
display inst_21(.in(BDEO),.out(BSDO));
display inst_22(.in(BDET),.out(BSDT));
display inst_23(.in(BDEH),.out(BSDH));
always@(posedge clk)begin
	case({select})
		3'd0:
			begin
					
					outThousands<=BDoutC;
			
					outHundreds<=BDoutB;
					
					outTens<=BDoutA;
					
					outOnes<=BDoutD;
			end
		3'd1:
				begin
					
					outThousands<=BDoutB;
			
					outHundreds<=BDoutA;
					
					if(inBoutSouth[0]==1'b1) begin//receiving
						outTens<=7'b0101000;
					end else begin
						outTens<=7'b1110111;
					end
					
					if(inAoutNorth[1]==1'b1) begin//sending
						outOnes<=7'b0010010;
					end else begin
						outOnes<=7'b1110111;
					end
				end
		3'd2:
			begin
					outThousands<=BDoutA;
			
					outHundreds<=ASDH;
					
					outTens<=ASDT;
					
					outOnes<=ASDO;
			end
		3'd3:
			begin
					outThousands<=BDoutB;
			
					outHundreds<=BSDH;
					
					outTens<=BSDT;
					
					outOnes<=BSDO;
			end
		default:
			begin
				outOnes<=7'b1111111;
				outTens<=7'b1111111;
				outHundreds<=7'b1111111;
				outThousands<=7'b1111111;
			end
	endcase
end
endmodule