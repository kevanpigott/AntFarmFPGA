//Author: Kevan Pigott
module dispToBlock(in,out);
parameter empty=3'd0, air=3'd1, dirt=3'd2, ground=3'd3, queen=3'd4, wall=3'd5, errorblock=3'd6, tunnel=3'd7;
//parameter empty=3'd0, tunnel=3'd1, ground=3'd2, air=3'd3,  dirt=3'd4, queen=3'd5, wall=3'd6, errorblock=3'd7;
	input [4:0]in;
	output reg [2:0]out;
	reg [2:0]store;
	always@(*)begin
//ORIGINAL //yee?
		if(in[3]==1'b1)begin//ant
			store<=3'b011;
		end else if(in[4]==1'b1) begin//sugar
			store<=3'b111;
		end else if(in[2:0]==ground) begin
			store<=3'b011;
		end else if((in[2:0]==queen)) begin
			store<=3'b110;
		end else if((in[2:0]==dirt)|(in[2:0]==wall)) begin
			store<=3'b001;
		end else if((in[2:0]==air)) begin
			store<=3'b100;
		end else if((in[2:0]==tunnel)) begin
			store<=3'b100;
		end else begin
			store<=3'b101;
		end

//NEW
//		if(in[3]==1'b1)begin//ant
//			store<=3'b110;
//		end else if(in[4]==1'b1) begin//sugar
//			store<=3'b111;
//		end else if(in[2:0]==ground) begin
//			store<=ground;
//		end else if((in[2:0]==queen)) begin
//			store<=queen;
//		end else if((in[2:0]==tunnel)|(in[2:0]==wall)) begin
//			store<=tunnel;
//		end else begin
//			store<=3'd7;
//		end
		out<=store;
	end


endmodule