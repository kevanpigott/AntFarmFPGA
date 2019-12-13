//Author:Kevan Pigott
module row_bus(inA ,inB ,inC ,inD ,inE ,inF ,inG,out); 
	input [2:0]inA;
	input [2:0]inB;
	input [2:0]inC;
	input [2:0]inD;
	input [2:0]inE;
	input [2:0]inF;
	input [2:0]inG;//
	
	
	output reg [20:0]out;
	
	always @(*)begin
		out[2:0]=inA;
		out[5:3]=inB;
		out[8:6]=inC;
		out[11:9]=inD;
		out[14:12]=inE;
		out[17:15]=inF;
		out[20:18]=inG;
	end
endmodule
//14 blocks 5bits each