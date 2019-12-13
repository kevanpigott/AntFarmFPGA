//Author: Kevan Pigott
module row2bus(inA,inB,inC,inD,inE,inF,inG,inH,inI,inJ,inK,inL,inM,out);
input [4:0]inA;
input [4:0]inB;
input [4:0]inC;
input [4:0]inD;
input [4:0]inE;
input [4:0]inF;
input [4:0]inG;
input [4:0]inH;
input [4:0]inI;
input [4:0]inJ;
input [4:0]inK;
input [4:0]inL;
input [4:0]inM;

output reg [38:0]out;
reg [4:0]cur;
wire [2:0]curOut;

dispToBlock inst_dispToBlock(.in(cur),.out(curOut));

always@(*)begin
	cur=inA;
	out[2:0]=curOut;
	cur=inB;
	out[5:3]=curOut;
	cur=inC;
	out[8:6]=curOut;
	cur=inD;
	out[11:9]=curOut;
	cur=inE;
	out[14:12]=curOut;
	cur=inF;
	out[17:15]=curOut;
	cur=inG;
	out[20:18]=curOut;
	cur=inH;
	out[23:21]=curOut;
	cur=inI;
	out[26:24]=curOut;
	cur=inJ;
	out[29:27]=curOut;
	cur=inK;
	out[32:30]=curOut;
	cur=inL;
	out[35:33]=curOut;
	cur=inM;
	out[38:36]=curOut;
end

endmodule

