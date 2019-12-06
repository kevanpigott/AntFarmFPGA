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

module dispToBlock(in,out);
parameter empty=3'd0, air=3'd1, dirt=3'd2, ground=3'd3, queen=3'd4, wall=3'd5, errorblock=3'd6, tunnel=3'd7;

	input [4:0]in;
	output reg [2:0]out;
	reg [2:0]store;
	always@(*)begin
		if(in[3]==1'b1)begin//ant
			store<=3'd0;
		end else if(in[4]==1'b1) begin//sugar
			store<=3'd1;
		end else if(in[2:0]==ground) begin
			store<=3'd2;
		end else if((in[2:0]==queen)) begin
			store<=3'd3;
		end else if((in[2:0]==dirt)|(in[2:0]==tunnel)|(in[2:0]==wall)) begin
			store<=3'd4;
		end else begin
			store<=3'd7;
		end
		out<=store;
	end


endmodule