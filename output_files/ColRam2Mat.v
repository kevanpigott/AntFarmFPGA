module ColRam2Mat(Sel,inA,inB,inC,inD,inE,inF,inG,inH,inI,inJ,inK,inL,inM,outCol,outSel);


input [5:0]Sel;
output reg [5:0]outSel;
output reg [2:0]outCol;

input [11:0]inA;
input [11:0]inB;
input [11:0]inC;
input [11:0]inD;
input [11:0]inE;
input [11:0]inF;
input [11:0]inG;
input [11:0]inH;
input [11:0]inI;
input [11:0]inJ;
input [11:0]inK;
input [11:0]inL;
input [11:0]inM;

always@(*) begin
	outSel=Sel;
end


always@(*) begin

	case({Sel})
		6'd0: begin
			outCol=inA[2:0];
			end
		6'd1: begin
			outCol=inB[2:0];
			end
		6'd2: begin
			outCol=inC[2:0];
			end
		6'd3: begin
			outCol=inD[2:0];
			end
		6'd4: begin
			outCol=inE[2:0];
			end
		6'd5: begin
			outCol=inF[2:0];
			end
		6'd6: begin
			outCol=inG[2:0];
			end
		6'd7: begin
			outCol=inH[2:0];
			end
		6'd8: begin
			outCol=inI[2:0];
			end
		6'd9: begin
			outCol=inA[2:0];
			end
		6'd10: begin
			outCol=inJ[2:0];
			end
		6'd11: begin
			outCol=inK[2:0];
			end
		6'd12: begin
			outCol=inL[2:0];
			end
		6'd13: begin
			outCol=inM[2:0];
			end
		6'd14: begin
			outCol=inA[5:3];
			end
		6'd15: begin
			outCol=inB[5:3];
			end
		6'd16: begin
			outCol=inC[5:3];
			end
		6'd17: begin
			outCol=inD[5:3];
			end
		6'd18: begin
			outCol=inE[5:3];
			end
		6'd19: begin
			outCol=inF[5:3];
			end
		6'd20: begin
			outCol=inG[5:3];
			end
		6'd21: begin
			outCol=inH[5:3];
			end
		6'd22: begin
			outCol=inI[5:3];
			end
		6'd23: begin
			outCol=inA[5:3];
			end
		6'd24: begin
			outCol=inJ[5:3];
			end
		6'd25: begin
			outCol=inK[5:3];
			end
		6'd26: begin
			outCol=inL[5:3];
			end
		6'd27: begin
			outCol=inM[5:3];
			end
		6'd28: begin
			outCol=inA[8:6];
			end
		6'd29: begin
			outCol=inB[8:6];
			end
		6'd30: begin
			outCol=inC[8:6];
			end
		6'd31: begin
			outCol=inD[8:6];
			end
		6'd32: begin
			outCol=inE[8:6];
			end
		6'd33: begin
			outCol=inF[8:6];
			end
		6'd34: begin
			outCol=inG[8:6];
			end
		6'd35: begin
			outCol=inH[8:6];
			end
		6'd36: begin
			outCol=inI[8:6];
			end
		6'd37: begin
			outCol=inA[8:6];
			end
		6'd38: begin
			outCol=inJ[8:6];
			end
		6'd39: begin
			outCol=inK[8:6];
			end
		6'd40: begin
			outCol=inL[8:6];
			end
		6'd41: begin
			outCol=inM[8:6];
			end
		6'd42: begin
			outCol=inA[11:9];
			end
		6'd43: begin
			outCol=inB[11:9];
			end
		6'd44: begin
			outCol=inC[11:9];
			end
		6'd45: begin
			outCol=inD[11:9];
			end
		6'd46: begin
			outCol=inE[11:9];
			end
		6'd47: begin
			outCol=inF[11:9];
			end
		6'd48: begin
			outCol=inG[11:9];
			end
		6'd49: begin
			outCol=inH[11:9];
			end
		6'd50: begin
			outCol=inI[11:9];
			end
		6'd51: begin
			outCol=inA[11:9];
			end
		6'd52: begin
			outCol=inJ[11:9];
			end
		6'd53: begin
			outCol=inK[11:9];
			end
		6'd54: begin
			outCol=inL[11:9];
			end
		6'd55: begin
			outCol=inM[11:9];
			end
		default:
			begin
				outCol=3'hf;
			end
		
		endcase
		
		
		end
endmodule