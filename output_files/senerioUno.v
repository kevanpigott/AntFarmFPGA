module senerioUno(outTunnel,outAnt,outSugar,outGround);


output reg [8:0]outTunnel;
output reg [8:0]outAnt;
output reg [8:0]outSugar;
output reg [8:0]outGround;
always@(*)begin
	outTunnel=9'b111000000;
	outAnt=9'b111100000;
	outSugar=9'b111010000;
	outGround=9'b011000000;
end
endmodule