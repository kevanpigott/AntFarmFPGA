//Author: Kevan Pigott
module senerioUno(outTunnel,outAnt,outSugar,outGround,outError,outQueen,outAir,outAirSugar,outWall);

parameter empty=3'd0, air=3'd1, dirt=3'd2, ground=3'd3, queen=3'd4, wall=3'd5, errorblock=3'd6, tunnel=3'd7;
//NEW:parameter empty=3'd0, tunnel=3'd1, ground=3'd2, air=3'd3,  dirt=3'd4,   queen=3'd5, wall=3'd6, errorblock=3'd7;
output reg [8:0]outTunnel;
output reg [8:0]outAnt;
output reg [8:0]outSugar;
output reg [8:0]outGround;
output reg [8:0]outError;
output reg [8:0]outQueen;
output reg [8:0]outAir;
output reg [8:0]outAirSugar;
output reg [8:0]outWall;
always@(*)begin

	//ORIGINAL
	outTunnel=9'b111000000;
	outAnt=9'b111100000;
	outSugar=9'b111010000;
	outGround=9'b011000000;
	outError=9'b111111111;
	
	//NEW
//	outTunnel=9'b001000000;
//	outAnt=9'b001100000;
//	outSugar=9'b001010000;
//	outGround=9'b010000000;
//	outError=9'b111111111;
//	outQueen=9'b100000000;
//	outAir=9'b011010000;
//	outAirSugar=9'b000000000;
//	outWall=9'b110000000;
end
endmodule