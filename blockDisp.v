//Author:Kevan Pigott
module blockDisp(in,out);
input [4:0]in;
output reg [6:0]out;

//..0
//5...1
//..6
//4...2
//..3
//
//
//
//
//
//ORIGINAL:parameter empty=3'd0, air=3'd1, dirt=3'd2, ground=3'd3, queen=3'd4, wall=3'd5, errorblock=3'd6, tunnel=3'd7;
parameter empty=3'd0, tunnel=3'd1, ground=3'd2, air=3'd3,  dirt=3'd4, queen=3'd5, wall=3'd6, errorblock=3'd7;
always@(*)
begin
	if(in[2:0]==queen)begin
		out<=7'b0011101;//queen
	end else if(in[3]==1'b1)begin
		out<=7'b0001000;//ant
	end else if(in[4]==1'b1) begin
		out<=7'b0010010;//sugar
	end else begin
		case({in[2:0]})
		empty:out<=7'b1111111;//empty
		air:out<=7'b1011111;//air
		dirt:out<=7'b0110001;//dirt
		ground:out<=7'b1001001;//ground
		queen:out<=7'b0011101;//queen
		errorblock:out<=7'b0000110;//ant
		wall:out<=7'b0010010;//sugar
		tunnel:out<=7'b1110110;//tunnel
		default:out <= 7'b0000000;
		endcase
	end
end
endmodule