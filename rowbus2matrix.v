//Author:Kevan Pigott
module rowbus2matrix(inA,inB,inC,inD,inE,out);
input [20:0]inA;
input [20:0]inB;
input [20:0]inC;
input [20:0]inD;
input [20:0]inE;

output reg [104:0]out;

always@(*)begin
	out[20:0]=inA;
	out[41:21]=inB;
	out[62:42]=inC;
	out[83:63]=inD;
	out[104:84]=inE;
end

endmodule