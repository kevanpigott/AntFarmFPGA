//Author: Kevan Pigott, Brian Egolf
module VGAlong(clk,rst_btn,pixelMemory,hsync,vsync,VGA_R,VGA_G,VGA_B);

input wire clk,rst_btn;


output wire hsync;
output wire vsync;

output reg [3:0] VGA_R;    // 4-bit VGA red output
output reg [3:0] VGA_G;
output reg [3:0] VGA_B;  
//pixel clock
reg [15:0] cnt;

reg pix_stb;




integer setL=2;
wire blocks=24;	//should be actual number of blocks - 1
//blocks per row, for 3 blocks per row set it to 4
parameter inL=9;//i beleive this should be equal to (setL*blocks)-1
input [167:0]pixelMemory;

always @(posedge clk) begin 
    {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000	
end
reg cur;
reg [3:0]prev_R;
reg [3:0]prev_G;
reg [3:0]prev_B;
integer i;
reg [3:0]cur_R;
reg [3:0]cur_G;
reg [3:0]cur_B;
always@(posedge clk)begin
				//7 should be thenumber of blocks
					//((x > (50*1)) & (y > (50*row)) & (x < (50*(1+1))) & (y < (50*(row+1))));
					//------------------------------------------------------------
		

				if(pixelMemory[1*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 1)) & (y > (50 * (1/12))) & (x < (50 * (1+1))) & (y < (50 *((1/12)+1)))));
				end

				if(pixelMemory[2*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 2)) & (y > (50 * (2/12))) & (x < (50 * (2+1))) & (y < (50 *((2/12)+1)))));
				end

				if(pixelMemory[3*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 3)) & (y > (50 * (3/12))) & (x < (50 * (3+1))) & (y < (50 *((3/12)+1)))));
				end

				if(pixelMemory[4*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 4)) & (y > (50 * (4/12))) & (x < (50 * (4+1))) & (y < (50 *((4/12)+1)))));
				end

				if(pixelMemory[5*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 5)) & (y > (50 * (5/12))) & (x < (50 * (5+1))) & (y < (50 *((5/12)+1)))));
				end

				if(pixelMemory[6*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 6)) & (y > (50 * (6/12))) & (x < (50 * (6+1))) & (y < (50 *((6/12)+1)))));
				end

				if(pixelMemory[7*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 7)) & (y > (50 * (7/12))) & (x < (50 * (7+1))) & (y < (50 *((7/12)+1)))));
				end

				if(pixelMemory[8*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 8)) & (y > (50 * (8/12))) & (x < (50 * (8+1))) & (y < (50 *((8/12)+1)))));
				end

				if(pixelMemory[9*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 9)) & (y > (50 * (9/12))) & (x < (50 * (9+1))) & (y < (50 *((9/12)+1)))));
				end

				if(pixelMemory[10*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 10)) & (y > (50 * (10/12))) & (x < (50 * (10+1))) & (y < (50 *((10/12)+1)))));
				end

				if(pixelMemory[11*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 11)) & (y > (50 * (11/12))) & (x < (50 * (11+1))) & (y < (50 *((11/12)+1)))));
				end

				if(pixelMemory[12*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 12)) & (y > (50 * (12/12))) & (x < (50 * (12+1))) & (y < (50 *((12/12)+1)))));
				end

				if(pixelMemory[13*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 13)) & (y > (50 * (13/12))) & (x < (50 * (13+1))) & (y < (50 *((13/12)+1)))));
				end

				if(pixelMemory[14*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 14)) & (y > (50 * (14/12))) & (x < (50 * (14+1))) & (y < (50 *((14/12)+1)))));
				end

				if(pixelMemory[15*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 15)) & (y > (50 * (15/12))) & (x < (50 * (15+1))) & (y < (50 *((15/12)+1)))));
				end

				if(pixelMemory[16*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 16)) & (y > (50 * (16/12))) & (x < (50 * (16+1))) & (y < (50 *((16/12)+1)))));
				end

				if(pixelMemory[17*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 17)) & (y > (50 * (17/12))) & (x < (50 * (17+1))) & (y < (50 *((17/12)+1)))));
				end

				if(pixelMemory[18*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 18)) & (y > (50 * (18/12))) & (x < (50 * (18+1))) & (y < (50 *((18/12)+1)))));
				end

				if(pixelMemory[19*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 19)) & (y > (50 * (19/12))) & (x < (50 * (19+1))) & (y < (50 *((19/12)+1)))));
				end

				if(pixelMemory[20*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 20)) & (y > (50 * (20/12))) & (x < (50 * (20+1))) & (y < (50 *((20/12)+1)))));
				end

				if(pixelMemory[21*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 21)) & (y > (50 * (21/12))) & (x < (50 * (21+1))) & (y < (50 *((21/12)+1)))));
				end

				if(pixelMemory[22*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 22)) & (y > (50 * (22/12))) & (x < (50 * (22+1))) & (y < (50 *((22/12)+1)))));
				end

				if(pixelMemory[23*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 23)) & (y > (50 * (23/12))) & (x < (50 * (23+1))) & (y < (50 *((23/12)+1)))));
				end

				if(pixelMemory[24*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 24)) & (y > (50 * (24/12))) & (x < (50 * (24+1))) & (y < (50 *((24/12)+1)))));
				end

				if(pixelMemory[25*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 25)) & (y > (50 * (25/12))) & (x < (50 * (25+1))) & (y < (50 *((25/12)+1)))));
				end

				if(pixelMemory[26*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 26)) & (y > (50 * (26/12))) & (x < (50 * (26+1))) & (y < (50 *((26/12)+1)))));
				end

				if(pixelMemory[27*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 27)) & (y > (50 * (27/12))) & (x < (50 * (27+1))) & (y < (50 *((27/12)+1)))));
				end

				if(pixelMemory[28*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 28)) & (y > (50 * (28/12))) & (x < (50 * (28+1))) & (y < (50 *((28/12)+1)))));
				end

				if(pixelMemory[29*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 29)) & (y > (50 * (29/12))) & (x < (50 * (29+1))) & (y < (50 *((29/12)+1)))));
				end

				if(pixelMemory[30*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 30)) & (y > (50 * (30/12))) & (x < (50 * (30+1))) & (y < (50 *((30/12)+1)))));
				end

				if(pixelMemory[31*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 31)) & (y > (50 * (31/12))) & (x < (50 * (31+1))) & (y < (50 *((31/12)+1)))));
				end

				if(pixelMemory[32*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 32)) & (y > (50 * (32/12))) & (x < (50 * (32+1))) & (y < (50 *((32/12)+1)))));
				end

				if(pixelMemory[33*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 33)) & (y > (50 * (33/12))) & (x < (50 * (33+1))) & (y < (50 *((33/12)+1)))));
				end

				if(pixelMemory[34*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 34)) & (y > (50 * (34/12))) & (x < (50 * (34+1))) & (y < (50 *((34/12)+1)))));
				end

				if(pixelMemory[35*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 35)) & (y > (50 * (35/12))) & (x < (50 * (35+1))) & (y < (50 *((35/12)+1)))));
				end

				if(pixelMemory[36*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 36)) & (y > (50 * (36/12))) & (x < (50 * (36+1))) & (y < (50 *((36/12)+1)))));
				end

				if(pixelMemory[37*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 37)) & (y > (50 * (37/12))) & (x < (50 * (37+1))) & (y < (50 *((37/12)+1)))));
				end

				if(pixelMemory[38*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 38)) & (y > (50 * (38/12))) & (x < (50 * (38+1))) & (y < (50 *((38/12)+1)))));
				end

				if(pixelMemory[39*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 39)) & (y > (50 * (39/12))) & (x < (50 * (39+1))) & (y < (50 *((39/12)+1)))));
				end

				if(pixelMemory[40*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 40)) & (y > (50 * (40/12))) & (x < (50 * (40+1))) & (y < (50 *((40/12)+1)))));
				end

				if(pixelMemory[41*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 41)) & (y > (50 * (41/12))) & (x < (50 * (41+1))) & (y < (50 *((41/12)+1)))));
				end

				if(pixelMemory[42*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 42)) & (y > (50 * (42/12))) & (x < (50 * (42+1))) & (y < (50 *((42/12)+1)))));
				end

				if(pixelMemory[43*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 43)) & (y > (50 * (43/12))) & (x < (50 * (43+1))) & (y < (50 *((43/12)+1)))));
				end

				if(pixelMemory[44*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 44)) & (y > (50 * (44/12))) & (x < (50 * (44+1))) & (y < (50 *((44/12)+1)))));
				end

				if(pixelMemory[45*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 45)) & (y > (50 * (45/12))) & (x < (50 * (45+1))) & (y < (50 *((45/12)+1)))));
				end

				if(pixelMemory[46*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 46)) & (y > (50 * (46/12))) & (x < (50 * (46+1))) & (y < (50 *((46/12)+1)))));
				end

				if(pixelMemory[47*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 47)) & (y > (50 * (47/12))) & (x < (50 * (47+1))) & (y < (50 *((47/12)+1)))));
				end

				if(pixelMemory[48*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 48)) & (y > (50 * (48/12))) & (x < (50 * (48+1))) & (y < (50 *((48/12)+1)))));
				end

				if(pixelMemory[49*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 49)) & (y > (50 * (49/12))) & (x < (50 * (49+1))) & (y < (50 *((49/12)+1)))));
				end

				if(pixelMemory[50*2]==1'b1)begin

				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 50)) & (y > (50 * (50/12))) & (x < (50 * (50+1))) & (y < (50 *((50/12)+1)))));
				end

				if(pixelMemory[51*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 51)) & (y > (50 * (51/12))) & (x < (50 * (51+1))) & (y < (50 *((51/12)+1)))));
				end

				if(pixelMemory[52*2]==1'b1)begin
				prev_R[3] = cur_R[3];
				cur_R[3] = (prev_R[3] +((x > (50 * 52)) & (y > (50 * (52/12))) & (x < (50 * (52+1))) & (y < (50 *((52/12)+1)))));
				end







				if(pixelMemory[1*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 1)) & (y > (50 * (1/12))) & (x < (50 * (1+1))) & (y < (50 *((1/12)+1)))));
				end

				if(pixelMemory[2*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 2)) & (y > (50 * (2/12))) & (x < (50 * (2+1))) & (y < (50 *((2/12)+1)))));
				end

				if(pixelMemory[3*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 3)) & (y > (50 * (3/12))) & (x < (50 * (3+1))) & (y < (50 *((3/12)+1)))));
				end

				if(pixelMemory[4*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 4)) & (y > (50 * (4/12))) & (x < (50 * (4+1))) & (y < (50 *((4/12)+1)))));
				end

				if(pixelMemory[5*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 5)) & (y > (50 * (5/12))) & (x < (50 * (5+1))) & (y < (50 *((5/12)+1)))));
				end

				if(pixelMemory[6*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 6)) & (y > (50 * (6/12))) & (x < (50 * (6+1))) & (y < (50 *((6/12)+1)))));
				end

				if(pixelMemory[7*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 7)) & (y > (50 * (7/12))) & (x < (50 * (7+1))) & (y < (50 *((7/12)+1)))));
				end

				if(pixelMemory[8*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 8)) & (y > (50 * (8/12))) & (x < (50 * (8+1))) & (y < (50 *((8/12)+1)))));
				end

				if(pixelMemory[9*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 9)) & (y > (50 * (9/12))) & (x < (50 * (9+1))) & (y < (50 *((9/12)+1)))));
				end

				if(pixelMemory[10*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 10)) & (y > (50 * (10/12))) & (x < (50 * (10+1))) & (y < (50 *((10/12)+1)))));
				end

				if(pixelMemory[11*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 11)) & (y > (50 * (11/12))) & (x < (50 * (11+1))) & (y < (50 *((11/12)+1)))));
				end

				if(pixelMemory[12*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 12)) & (y > (50 * (12/12))) & (x < (50 * (12+1))) & (y < (50 *((12/12)+1)))));
				end

				if(pixelMemory[13*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 13)) & (y > (50 * (13/12))) & (x < (50 * (13+1))) & (y < (50 *((13/12)+1)))));
				end

				if(pixelMemory[14*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 14)) & (y > (50 * (14/12))) & (x < (50 * (14+1))) & (y < (50 *((14/12)+1)))));
				end

				if(pixelMemory[15*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 15)) & (y > (50 * (15/12))) & (x < (50 * (15+1))) & (y < (50 *((15/12)+1)))));
				end

				if(pixelMemory[16*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 16)) & (y > (50 * (16/12))) & (x < (50 * (16+1))) & (y < (50 *((16/12)+1)))));
				end

				if(pixelMemory[17*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 17)) & (y > (50 * (17/12))) & (x < (50 * (17+1))) & (y < (50 *((17/12)+1)))));
				end

				if(pixelMemory[18*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 18)) & (y > (50 * (18/12))) & (x < (50 * (18+1))) & (y < (50 *((18/12)+1)))));
				end

				if(pixelMemory[19*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 19)) & (y > (50 * (19/12))) & (x < (50 * (19+1))) & (y < (50 *((19/12)+1)))));
				end

				if(pixelMemory[20*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 20)) & (y > (50 * (20/12))) & (x < (50 * (20+1))) & (y < (50 *((20/12)+1)))));
				end

				if(pixelMemory[21*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 21)) & (y > (50 * (21/12))) & (x < (50 * (21+1))) & (y < (50 *((21/12)+1)))));
				end

				if(pixelMemory[22*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 22)) & (y > (50 * (22/12))) & (x < (50 * (22+1))) & (y < (50 *((22/12)+1)))));
				end

				if(pixelMemory[23*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 23)) & (y > (50 * (23/12))) & (x < (50 * (23+1))) & (y < (50 *((23/12)+1)))));
				end

				if(pixelMemory[24*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 24)) & (y > (50 * (24/12))) & (x < (50 * (24+1))) & (y < (50 *((24/12)+1)))));
				end

				if(pixelMemory[25*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 25)) & (y > (50 * (25/12))) & (x < (50 * (25+1))) & (y < (50 *((25/12)+1)))));
				end

				if(pixelMemory[26*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 26)) & (y > (50 * (26/12))) & (x < (50 * (26+1))) & (y < (50 *((26/12)+1)))));
				end

				if(pixelMemory[27*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 27)) & (y > (50 * (27/12))) & (x < (50 * (27+1))) & (y < (50 *((27/12)+1)))));
				end

				if(pixelMemory[28*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 28)) & (y > (50 * (28/12))) & (x < (50 * (28+1))) & (y < (50 *((28/12)+1)))));
				end

				if(pixelMemory[29*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 29)) & (y > (50 * (29/12))) & (x < (50 * (29+1))) & (y < (50 *((29/12)+1)))));
				end

				if(pixelMemory[30*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 30)) & (y > (50 * (30/12))) & (x < (50 * (30+1))) & (y < (50 *((30/12)+1)))));
				end

				if(pixelMemory[31*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 31)) & (y > (50 * (31/12))) & (x < (50 * (31+1))) & (y < (50 *((31/12)+1)))));
				end

				if(pixelMemory[32*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 32)) & (y > (50 * (32/12))) & (x < (50 * (32+1))) & (y < (50 *((32/12)+1)))));
				end

				if(pixelMemory[33*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 33)) & (y > (50 * (33/12))) & (x < (50 * (33+1))) & (y < (50 *((33/12)+1)))));
				end

				if(pixelMemory[34*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 34)) & (y > (50 * (34/12))) & (x < (50 * (34+1))) & (y < (50 *((34/12)+1)))));
				end

				if(pixelMemory[35*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 35)) & (y > (50 * (35/12))) & (x < (50 * (35+1))) & (y < (50 *((35/12)+1)))));
				end

				if(pixelMemory[36*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 36)) & (y > (50 * (36/12))) & (x < (50 * (36+1))) & (y < (50 *((36/12)+1)))));
				end

				if(pixelMemory[37*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 37)) & (y > (50 * (37/12))) & (x < (50 * (37+1))) & (y < (50 *((37/12)+1)))));
				end

				if(pixelMemory[38*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 38)) & (y > (50 * (38/12))) & (x < (50 * (38+1))) & (y < (50 *((38/12)+1)))));
				end

				if(pixelMemory[39*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 39)) & (y > (50 * (39/12))) & (x < (50 * (39+1))) & (y < (50 *((39/12)+1)))));
				end

				if(pixelMemory[40*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 40)) & (y > (50 * (40/12))) & (x < (50 * (40+1))) & (y < (50 *((40/12)+1)))));
				end

				if(pixelMemory[41*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 41)) & (y > (50 * (41/12))) & (x < (50 * (41+1))) & (y < (50 *((41/12)+1)))));
				end

				if(pixelMemory[42*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 42)) & (y > (50 * (42/12))) & (x < (50 * (42+1))) & (y < (50 *((42/12)+1)))));
				end

				if(pixelMemory[43*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 43)) & (y > (50 * (43/12))) & (x < (50 * (43+1))) & (y < (50 *((43/12)+1)))));
				end

				if(pixelMemory[44*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 44)) & (y > (50 * (44/12))) & (x < (50 * (44+1))) & (y < (50 *((44/12)+1)))));
				end

				if(pixelMemory[45*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 45)) & (y > (50 * (45/12))) & (x < (50 * (45+1))) & (y < (50 *((45/12)+1)))));
				end

				if(pixelMemory[46*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 46)) & (y > (50 * (46/12))) & (x < (50 * (46+1))) & (y < (50 *((46/12)+1)))));
				end

				if(pixelMemory[47*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 47)) & (y > (50 * (47/12))) & (x < (50 * (47+1))) & (y < (50 *((47/12)+1)))));
				end

				if(pixelMemory[48*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 48)) & (y > (50 * (48/12))) & (x < (50 * (48+1))) & (y < (50 *((48/12)+1)))));
				end

				if(pixelMemory[49*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 49)) & (y > (50 * (49/12))) & (x < (50 * (49+1))) & (y < (50 *((49/12)+1)))));
				end

				if(pixelMemory[50*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 50)) & (y > (50 * (50/12))) & (x < (50 * (50+1))) & (y < (50 *((50/12)+1)))));
				end

				if(pixelMemory[51*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 51)) & (y > (50 * (51/12))) & (x < (50 * (51+1))) & (y < (50 *((51/12)+1)))));
				end

				if(pixelMemory[52*2]==1'b1)begin
				prev_G[3] = cur_G[3];
				cur_G[3] = (prev_G[3] +((x > (50 * 52)) & (y > (50 * (52/12))) & (x < (50 * (52+1))) & (y < (50 *((52/12)+1)))));
				end



				if(pixelMemory[1*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 1)) & (y > (50 * (1/12))) & (x < (50 * (1+1))) & (y < (50 *((1/12)+1)))));
				end

				if(pixelMemory[2*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 2)) & (y > (50 * (2/12))) & (x < (50 * (2+1))) & (y < (50 *((2/12)+1)))));
				end

				if(pixelMemory[3*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 3)) & (y > (50 * (3/12))) & (x < (50 * (3+1))) & (y < (50 *((3/12)+1)))));
				end

				if(pixelMemory[4*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 4)) & (y > (50 * (4/12))) & (x < (50 * (4+1))) & (y < (50 *((4/12)+1)))));
				end

				if(pixelMemory[5*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 5)) & (y > (50 * (5/12))) & (x < (50 * (5+1))) & (y < (50 *((5/12)+1)))));
				end

				if(pixelMemory[6*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 6)) & (y > (50 * (6/12))) & (x < (50 * (6+1))) & (y < (50 *((6/12)+1)))));
				end

				if(pixelMemory[7*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 7)) & (y > (50 * (7/12))) & (x < (50 * (7+1))) & (y < (50 *((7/12)+1)))));
				end

				if(pixelMemory[8*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 8)) & (y > (50 * (8/12))) & (x < (50 * (8+1))) & (y < (50 *((8/12)+1)))));
				end

				if(pixelMemory[9*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 9)) & (y > (50 * (9/12))) & (x < (50 * (9+1))) & (y < (50 *((9/12)+1)))));
				end

				if(pixelMemory[10*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 10)) & (y > (50 * (10/12))) & (x < (50 * (10+1))) & (y < (50 *((10/12)+1)))));
				end

				if(pixelMemory[11*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 11)) & (y > (50 * (11/12))) & (x < (50 * (11+1))) & (y < (50 *((11/12)+1)))));
				end

				if(pixelMemory[12*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 12)) & (y > (50 * (12/12))) & (x < (50 * (12+1))) & (y < (50 *((12/12)+1)))));
				end

				if(pixelMemory[13*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 13)) & (y > (50 * (13/12))) & (x < (50 * (13+1))) & (y < (50 *((13/12)+1)))));
				end

				if(pixelMemory[14*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 14)) & (y > (50 * (14/12))) & (x < (50 * (14+1))) & (y < (50 *((14/12)+1)))));
				end

				if(pixelMemory[15*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 15)) & (y > (50 * (15/12))) & (x < (50 * (15+1))) & (y < (50 *((15/12)+1)))));
				end

				if(pixelMemory[16*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 16)) & (y > (50 * (16/12))) & (x < (50 * (16+1))) & (y < (50 *((16/12)+1)))));
				end

				if(pixelMemory[17*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 17)) & (y > (50 * (17/12))) & (x < (50 * (17+1))) & (y < (50 *((17/12)+1)))));
				end

				if(pixelMemory[18*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 18)) & (y > (50 * (18/12))) & (x < (50 * (18+1))) & (y < (50 *((18/12)+1)))));
				end

				if(pixelMemory[19*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 19)) & (y > (50 * (19/12))) & (x < (50 * (19+1))) & (y < (50 *((19/12)+1)))));
				end

				if(pixelMemory[20*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 20)) & (y > (50 * (20/12))) & (x < (50 * (20+1))) & (y < (50 *((20/12)+1)))));
				end

				if(pixelMemory[21*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 21)) & (y > (50 * (21/12))) & (x < (50 * (21+1))) & (y < (50 *((21/12)+1)))));
				end

				if(pixelMemory[22*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 22)) & (y > (50 * (22/12))) & (x < (50 * (22+1))) & (y < (50 *((22/12)+1)))));
				end

				if(pixelMemory[23*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 23)) & (y > (50 * (23/12))) & (x < (50 * (23+1))) & (y < (50 *((23/12)+1)))));
				end

				if(pixelMemory[24*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 24)) & (y > (50 * (24/12))) & (x < (50 * (24+1))) & (y < (50 *((24/12)+1)))));
				end

				if(pixelMemory[25*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 25)) & (y > (50 * (25/12))) & (x < (50 * (25+1))) & (y < (50 *((25/12)+1)))));
				end

				if(pixelMemory[26*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 26)) & (y > (50 * (26/12))) & (x < (50 * (26+1))) & (y < (50 *((26/12)+1)))));
				end

				if(pixelMemory[27*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 27)) & (y > (50 * (27/12))) & (x < (50 * (27+1))) & (y < (50 *((27/12)+1)))));
				end

				if(pixelMemory[28*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 28)) & (y > (50 * (28/12))) & (x < (50 * (28+1))) & (y < (50 *((28/12)+1)))));
				end

				if(pixelMemory[29*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 29)) & (y > (50 * (29/12))) & (x < (50 * (29+1))) & (y < (50 *((29/12)+1)))));
				end

				if(pixelMemory[30*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 30)) & (y > (50 * (30/12))) & (x < (50 * (30+1))) & (y < (50 *((30/12)+1)))));
				end

				if(pixelMemory[31*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 31)) & (y > (50 * (31/12))) & (x < (50 * (31+1))) & (y < (50 *((31/12)+1)))));
				end

				if(pixelMemory[32*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 32)) & (y > (50 * (32/12))) & (x < (50 * (32+1))) & (y < (50 *((32/12)+1)))));
				end

				if(pixelMemory[33*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 33)) & (y > (50 * (33/12))) & (x < (50 * (33+1))) & (y < (50 *((33/12)+1)))));
				end

				if(pixelMemory[34*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 34)) & (y > (50 * (34/12))) & (x < (50 * (34+1))) & (y < (50 *((34/12)+1)))));
				end

				if(pixelMemory[35*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 35)) & (y > (50 * (35/12))) & (x < (50 * (35+1))) & (y < (50 *((35/12)+1)))));
				end

				if(pixelMemory[36*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 36)) & (y > (50 * (36/12))) & (x < (50 * (36+1))) & (y < (50 *((36/12)+1)))));
				end

				if(pixelMemory[37*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 37)) & (y > (50 * (37/12))) & (x < (50 * (37+1))) & (y < (50 *((37/12)+1)))));
				end

				if(pixelMemory[38*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 38)) & (y > (50 * (38/12))) & (x < (50 * (38+1))) & (y < (50 *((38/12)+1)))));
				end

				if(pixelMemory[39*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 39)) & (y > (50 * (39/12))) & (x < (50 * (39+1))) & (y < (50 *((39/12)+1)))));
				end

				if(pixelMemory[40*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 40)) & (y > (50 * (40/12))) & (x < (50 * (40+1))) & (y < (50 *((40/12)+1)))));
				end

				if(pixelMemory[41*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 41)) & (y > (50 * (41/12))) & (x < (50 * (41+1))) & (y < (50 *((41/12)+1)))));
				end

				if(pixelMemory[42*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 42)) & (y > (50 * (42/12))) & (x < (50 * (42+1))) & (y < (50 *((42/12)+1)))));
				end

				if(pixelMemory[43*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 43)) & (y > (50 * (43/12))) & (x < (50 * (43+1))) & (y < (50 *((43/12)+1)))));
				end

				if(pixelMemory[44*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 44)) & (y > (50 * (44/12))) & (x < (50 * (44+1))) & (y < (50 *((44/12)+1)))));
				end

				if(pixelMemory[45*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 45)) & (y > (50 * (45/12))) & (x < (50 * (45+1))) & (y < (50 *((45/12)+1)))));
				end

				if(pixelMemory[46*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 46)) & (y > (50 * (46/12))) & (x < (50 * (46+1))) & (y < (50 *((46/12)+1)))));
				end

				if(pixelMemory[47*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 47)) & (y > (50 * (47/12))) & (x < (50 * (47+1))) & (y < (50 *((47/12)+1)))));
				end

				if(pixelMemory[48*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 48)) & (y > (50 * (48/12))) & (x < (50 * (48+1))) & (y < (50 *((48/12)+1)))));
				end

				if(pixelMemory[49*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 49)) & (y > (50 * (49/12))) & (x < (50 * (49+1))) & (y < (50 *((49/12)+1)))));
				end

				if(pixelMemory[50*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 50)) & (y > (50 * (50/12))) & (x < (50 * (50+1))) & (y < (50 *((50/12)+1)))));
				end

				if(pixelMemory[51*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 51)) & (y > (50 * (51/12))) & (x < (50 * (51+1))) & (y < (50 *((51/12)+1)))));
				end

				if(pixelMemory[52*2]==1'b1)begin
				prev_B[3] = cur_B[3];
				cur_B[3] = (prev_B[3] +((x > (50 * 52)) & (y > (50 * (52/12))) & (x < (50 * (52+1))) & (y < (50 *((52/12)+1)))));
				end

					//------------------------------------------------------------
					//if(pixelMemory[((i*setL)+2)]==1'b1)begin
					//	prev_B[3]=cur_B[3];
					//	cur_B[3]=(prev_B[3]+((x > (50*i)) & (y > (50*(i/12))) & (x < (50*(i+1))) & (y < (50*((i/12)+1)))));
					//end
				//if(pixelMemory[((i*2)-1)==1'b1)]) begin
					VGA_R[3]<=cur_R[3];
					VGA_G[3]<=cur_G[3];
					VGA_B[3]<=cur_B[3];
				
end
wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
vga640x480 display (.i_clk(clk),.i_pix_stb(pix_stb),.i_rst(!rst_btn),.o_hs(hsync),.o_vs(vsync),.o_x(x),.o_y(y));

endmodule