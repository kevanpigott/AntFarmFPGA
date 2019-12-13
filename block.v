//Author:Kevan Pigott
module block(previousMoves,command,North,South,East,West);
parameter E = 4'b00, 
			 G = 4'b01,
			 T = 4'b10,
			 Q = 2'b11;
reg [3:0]type;
reg [1:0]contains;
input [4:0]command;
inout reg [32:0]previousMoves;
reg	[4:0]operation;
inout [5:0]North;
inout	[5:0]South;
inout [5:0]East;
inout [5:0]West;

always@(*)
begin
if(command>4'b0)
	operation=command;
else if(North>=4'b1)//repeat for all directions
	operation=North;//operation should be last four of north
else
	case({operation})//binary length = num commands^2 -1
	5'd0:type=type;
	5'd1:type=E;//empty
	5'd2:type=G;//ground
	5'd3:type=T;//tunnel
	5'd4:type=Q;//queen
	5'd5:contains=2'd0;//no sugar, no ant
	5'd6:contains=2'd1;//no sugar, ant
	5'd7:contains=2'd2;//sugar, no ant
	5'd8:contains=2'd3;//sugar, ant
	default: //game rules here
	begin	
		//if((North!=4'd1)&&contains==2'd1)
		//check surroundings ,send and receive
			type=type;
		//end
	end
	endcase
end

endmodule