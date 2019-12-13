//Author: Kevan Pigott
module disp2VGAencoder(disp,outCol);


//disp out from matrix Z means Zero, O means one, t means 2, bottom left is ZZ, top right is tO.
input [4:0]disp;


output reg [2:0]outCol;

parameter empty=3'd0, air=3'd1, dirt=3'd2, ground=3'd3, queen=3'd4, wall=3'd5, errorblock=3'd6, tunnel=3'd7;



always@(*)begin

			begin
				
				//storeSel<=3'd0;
				
				if(disp[4]==1'b1)begin//sugar
					outCol<=3'd1;
				end else if(disp[3]==1'b1)begin//ant
					outCol<=3'd0;
				end else begin
					if(disp[2:0]==ground) begin
						outCol<=3'd2;
					end else if((disp[2:0]==tunnel)|(disp[2:0]==wall))begin
						outCol<=3'd4;
					end else begin
						outCol<=3'd7;
					end
				end

			end
end
endmodule