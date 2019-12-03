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

always@(*)
begin
	if(in[2:0]==3'd4)begin
		out<=7'b0011101;//queen
	end else if(in[3]==1'b1)begin
		out<=7'b0001000;//ant
	end else if(in[4]==1'b1) begin
		out<=7'b0010010;//sugar
	end else begin
		case({in[2:0]})
		3'd0:out<=7'b1111111;//empty
		3'd1:out<=7'b1011111;//air
		3'd2:out<=7'b0110001;//dirt
		3'd3:out<=7'b1001001;//ground
		3'd4:out<=7'b0011101;//queen
		3'd5:out<=7'b0001000;//ant
		3'd6:out<=7'b0010010;//sugar
		3'd7:out<=7'b1110110;//tunnel
		default:out <= 7'b0000000;
		endcase
	end
end
endmodule