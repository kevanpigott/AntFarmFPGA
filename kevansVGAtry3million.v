//Author:Brian Egolf, Kevan Pigott
module kevansVGAtry3million(clk,rst_btn,pixelMemory,hsync,vsync,VGA_R,VGA_G,VGA_B);

input wire clk,rst_btn;


output wire hsync;
output wire vsync;

output reg [3:0] VGA_R;    // 4-bit VGA red output
output reg [3:0] VGA_G;
output reg [3:0] VGA_B;  
//pixel clock
reg [15:0] cnt;
input [158:0]pixelMemory;

reg pix_stb;




wire sky;
assign sky = ((x > (0)) & (y > 0) & (x < 640) & (y < 280));


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



//start greens---------------------------------------------------------------------------------------------------------------
if(pixelMemory[0]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 0)) & (y > 430) & (x < (50 * (0+1))) & (y < 480)));
end

if(pixelMemory[3]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 1)) & (y > 430) & (x < (50 * (1+1))) & (y < 480)));
end

if(pixelMemory[6]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 2)) & (y > 430) & (x < (50 * (2+1))) & (y < 480)));
end

if(pixelMemory[9]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 3)) & (y > 430) & (x < (50 * (3+1))) & (y < 480)));
end

if(pixelMemory[12]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 4)) & (y > 430) & (x < (50 * (4+1))) & (y < 480)));
end

if(pixelMemory[15]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 5)) & (y > 430) & (x < (50 * (5+1))) & (y < 480)));
end

if(pixelMemory[18]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 6)) & (y > 430) & (x < (50 * (6+1))) & (y < 480)));
end

if(pixelMemory[21]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 7)) & (y > 430) & (x < (50 * (7+1))) & (y < 480)));
end

if(pixelMemory[24]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 8)) & (y > 430) & (x < (50 * (8+1))) & (y < 480)));
end

if(pixelMemory[27]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 9)) & (y > 430) & (x < (50 * (9+1))) & (y < 480)));
end

if(pixelMemory[30]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 10)) & (y > 430) & (x < (50 * (10+1))) & (y < 480)));
end

if(pixelMemory[33]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 11)) & (y > 430) & (x < (50 * (11+1))) & (y < 480)));
end

if(pixelMemory[36]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 12)) & (y > 430) & (x < (50 * (12+1))) & (y < 480)));
end


//start row 2

if(pixelMemory[39]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 0)) & (y > 380) & (x < (50 * (0+1))) & (y < 430)));
end

if(pixelMemory[42]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 1)) & (y > 380) & (x < (50 * (1+1))) & (y < 430)));
end

if(pixelMemory[45]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 2)) & (y > 380) & (x < (50 * (2+1))) & (y < 430)));
end

if(pixelMemory[48]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 3)) & (y > 380) & (x < (50 * (3+1))) & (y < 430)));
end

if(pixelMemory[51]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 4)) & (y > 380) & (x < (50 * (4+1))) & (y < 430)));
end

if(pixelMemory[54]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 5)) & (y > 380) & (x < (50 * (5+1))) & (y < 430)));
end

if(pixelMemory[57]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 6)) & (y > 380) & (x < (50 * (6+1))) & (y < 430)));
end

if(pixelMemory[60]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 7)) & (y > 380) & (x < (50 * (7+1))) & (y < 430)));
end

if(pixelMemory[63]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 8)) & (y > 380) & (x < (50 * (8+1))) & (y < 430)));
end

if(pixelMemory[66]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 9)) & (y > 380) & (x < (50 * (9+1))) & (y < 430)));
end

if(pixelMemory[69]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 10)) & (y > 380) & (x < (50 * (10+1))) & (y < 430)));
end
if(pixelMemory[72]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 11)) & (y > 380) & (x < (50 * (11+1))) & (y < 430)));
end

if(pixelMemory[75]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 12)) & (y > 380) & (x < (50 * (12+1))) & (y < 430)));
end






//start row 3----------------------------------------



if(pixelMemory[78]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 0)) & (y > 330) & (x < (50 * (0+1))) & (y < 380)));
end

if(pixelMemory[81]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 1)) & (y > 330) & (x < (50 * (1+1))) & (y < 380)));
end

if(pixelMemory[84]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 2)) & (y > 330) & (x < (50 * (2+1))) & (y < 380)));
end

if(pixelMemory[87]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 3)) & (y > 330) & (x < (50 * (3+1))) & (y < 380)));
end

if(pixelMemory[90]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 4)) & (y > 330) & (x < (50 * (4+1))) & (y < 380)));
end

if(pixelMemory[93]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 5)) & (y > 330) & (x < (50 * (5+1))) & (y < 380)));
end

if(pixelMemory[96]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 6)) & (y > 330) & (x < (50 * (6+1))) & (y < 380)));
end

if(pixelMemory[99]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 7)) & (y > 330) & (x < (50 * (7+1))) & (y < 380)));
end

if(pixelMemory[102]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 8)) & (y > 330) & (x < (50 * (8+1))) & (y < 380)));
end

if(pixelMemory[105]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 8)) & (y > 330) & (x < (50 * (9+1))) & (y < 380)));
end

if(pixelMemory[108]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 10)) & (y >330) & (x < (50 * (10+1))) & (y < 380)));
end

if(pixelMemory[111]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 11)) & (y > 330) & (x < (50 * (11+1))) & (y < 380)));
end

if(pixelMemory[114]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 12)) & (y > 330) & (x < (50 * (12+1))) & (y < 380)));
end


//--------------start row 4----------------------

if(pixelMemory[117]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 0)) & (y > 280) & (x < (50 * (1))) & (y < 330)));
end


if(pixelMemory[120]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 1)) & (y > 280) & (x < (50 * (0+1))) & (y < 330)));
end

if(pixelMemory[123]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 2)) & (y > 280) & (x < (50 * (1+1))) & (y < 330)));
end

if(pixelMemory[126]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 3)) & (y > 280) & (x < (50 * (2+1))) & (y < 330)));
end

if(pixelMemory[129]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 4)) & (y > 280) & (x < (50 * (3+1))) & (y < 330)));
end

if(pixelMemory[132]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 5)) & (y > 280) & (x < (50 * (4+1))) & (y < 330)));
end

if(pixelMemory[135]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 5)) & (y > 280) & (x < (50 * (5+1))) & (y < 330)));
end

if(pixelMemory[138]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 6)) & (y > 280) & (x < (50 * (6+1))) & (y < 330)));
end

if(pixelMemory[141]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 7)) & (y > 280) & (x < (50 * (7+1))) & (y < 330)));
end

if(pixelMemory[144]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 8)) & (y > 280) & (x < (50 * (8+1))) & (y < 330)));
end

if(pixelMemory[147]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 9)) & (y > 280) & (x < (50 * (9+1))) & (y < 330)));
end

if(pixelMemory[150]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 10)) & (y > 280) & (x < (50 * (10+1))) & (y < 330)));
end

if(pixelMemory[153]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 11)) & (y > 280) & (x < (50 * (11+1))) & (y < 330)));
end

if(pixelMemory[156]==1'b1)begin
prev_G[3] = cur_G[3];
cur_G[3] = (prev_G[3] +((x > (50 * 12)) & (y > 280) & (x < (50 * (12+1))) & (y < 330)));
end


//start reds------------------------------------------------------------------------------------

if(pixelMemory[2]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 0)) & (y > 430) & (x < (50 * (0+1))) & (y < 480)));
end

if(pixelMemory[5]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 1)) & (y > 430) & (x < (50 * (1+1))) & (y < 480)));
end

if(pixelMemory[8]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 2)) & (y > 430) & (x < (50 * (2+1))) & (y < 480)));
end

if(pixelMemory[11]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 3)) & (y > 430) & (x < (50 * (3+1))) & (y < 480)));
end

if(pixelMemory[14]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 4)) & (y > 430) & (x < (50 * (4+1))) & (y < 480)));
end

if(pixelMemory[17]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 5)) & (y > 430) & (x < (50 * (5+1))) & (y < 480)));
end

if(pixelMemory[18]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 6)) & (y > 430) & (x < (50 * (6+1))) & (y < 480)));
end

if(pixelMemory[23]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 7)) & (y > 430) & (x < (50 * (7+1))) & (y < 480)));
end

if(pixelMemory[26]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 8)) & (y > 430) & (x < (50 * (8+1))) & (y < 480)));
end

if(pixelMemory[29]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 9)) & (y > 430) & (x < (50 * (9+1))) & (y < 480)));
end

if(pixelMemory[32]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 10)) & (y > 430) & (x < (50 * (10+1))) & (y < 480)));
end

if(pixelMemory[35]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 11)) & (y > 430) & (x < (50 * (11+1))) & (y < 480)));
end

if(pixelMemory[38]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 12)) & (y > 430) & (x < (50 * (12+1))) & (y < 480)));
end


//start row 2

if(pixelMemory[41]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 0)) & (y > 380) & (x < (50 * (0+1))) & (y < 430)));
end

if(pixelMemory[44]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 1)) & (y > 380) & (x < (50 * (1+1))) & (y < 430)));
end

if(pixelMemory[47]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 2)) & (y > 380) & (x < (50 * (2+1))) & (y < 430)));
end

if(pixelMemory[50]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 3)) & (y > 380) & (x < (50 * (3+1))) & (y < 430)));
end

if(pixelMemory[53]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 4)) & (y > 380) & (x < (50 * (4+1))) & (y < 430)));
end

if(pixelMemory[56]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 5)) & (y > 380) & (x < (50 * (5+1))) & (y < 430)));
end

if(pixelMemory[59]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 6)) & (y > 380) & (x < (50 * (6+1))) & (y < 430)));
end

if(pixelMemory[62]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 7)) & (y > 380) & (x < (50 * (7+1))) & (y < 430)));
end

if(pixelMemory[65]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 8)) & (y > 380) & (x < (50 * (8+1))) & (y < 430)));
end

if(pixelMemory[68]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 9)) & (y > 380) & (x < (50 * (9+1))) & (y < 430)));
end

if(pixelMemory[71]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 10)) & (y > 380) & (x < (50 * (10+1))) & (y < 430)));
end
if(pixelMemory[74]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 11)) & (y > 380) & (x < (50 * (11+1))) & (y < 430)));
end

if(pixelMemory[77]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 12)) & (y > 380) & (x < (50 * (12+1))) & (y < 430)));
end






//start row 3----------------------------------------



if(pixelMemory[80]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 0)) & (y > 330) & (x < (50 * (0+1))) & (y < 380)));
end

if(pixelMemory[83]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 1)) & (y > 330) & (x < (50 * (1+1))) & (y < 380)));
end

if(pixelMemory[86]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 2)) & (y > 330) & (x < (50 * (2+1))) & (y < 380)));
end

if(pixelMemory[89]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 3)) & (y > 330) & (x < (50 * (3+1))) & (y < 380)));
end

if(pixelMemory[92]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 4)) & (y > 330) & (x < (50 * (4+1))) & (y < 380)));
end

if(pixelMemory[95]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 5)) & (y > 330) & (x < (50 * (5+1))) & (y < 380)));
end

if(pixelMemory[98]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 6)) & (y > 330) & (x < (50 * (6+1))) & (y < 380)));
end

if(pixelMemory[101]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 7)) & (y > 330) & (x < (50 * (7+1))) & (y < 380)));
end

if(pixelMemory[104]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 8)) & (y > 330) & (x < (50 * (8+1))) & (y < 380)));
end

if(pixelMemory[107]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 8)) & (y > 330) & (x < (50 * (9+1))) & (y < 380)));
end

if(pixelMemory[110]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 10)) & (y >330) & (x < (50 * (10+1))) & (y < 380)));
end

if(pixelMemory[113]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 11)) & (y > 330) & (x < (50 * (11+1))) & (y < 380)));
end

if(pixelMemory[116]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 12)) & (y > 330) & (x < (50 * (12+1))) & (y < 380)));
end


//--------------start row 4----------------------

if(pixelMemory[119]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 0)) & (y > 280) & (x < (50 * (1))) & (y < 330)));
end


if(pixelMemory[122]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 1)) & (y > 280) & (x < (50 * (0+1))) & (y < 330)));
end

if(pixelMemory[125]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 2)) & (y > 280) & (x < (50 * (1+1))) & (y < 330)));
end

if(pixelMemory[128]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 3)) & (y > 280) & (x < (50 * (2+1))) & (y < 330)));
end

if(pixelMemory[131]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 4)) & (y > 280) & (x < (50 * (3+1))) & (y < 330)));
end

if(pixelMemory[134]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 5)) & (y > 280) & (x < (50 * (4+1))) & (y < 330)));
end

if(pixelMemory[137]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 5)) & (y > 280) & (x < (50 * (5+1))) & (y < 330)));
end

if(pixelMemory[140]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 6)) & (y > 280) & (x < (50 * (6+1))) & (y < 330)));
end

if(pixelMemory[143]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 7)) & (y > 280) & (x < (50 * (7+1))) & (y < 330)));
end

if(pixelMemory[146]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 8)) & (y > 280) & (x < (50 * (8+1))) & (y < 330)));
end

if(pixelMemory[149]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 9)) & (y > 280) & (x < (50 * (9+1))) & (y < 330)));
end

if(pixelMemory[152]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 10)) & (y > 280) & (x < (50 * (10+1))) & (y < 330)));
end

if(pixelMemory[155]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 11)) & (y > 280) & (x < (50 * (11+1))) & (y < 330)));
end

if(pixelMemory[158]==1'b1)begin
prev_R[3] = cur_R[3];
cur_R[3] = (prev_R[3] +((x > (50 * 12)) & (y > 280) & (x < (50 * (12+1))) & (y < 330)));
end



//start blues---------------------------------------------------------------------------------------------------
if(pixelMemory[1]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 0)) & (y > 430) & (x < (50 * (0+1))) & (y < 480)));
end

if(pixelMemory[4]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 1)) & (y > 430) & (x < (50 * (1+1))) & (y < 480)));
end

if(pixelMemory[7]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 2)) & (y > 430) & (x < (50 * (2+1))) & (y < 480)));
end

if(pixelMemory[10]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 3)) & (y > 430) & (x < (50 * (3+1))) & (y < 480)));
end

if(pixelMemory[13]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 4)) & (y > 430) & (x < (50 * (4+1))) & (y < 480)));
end

if(pixelMemory[16]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 5)) & (y > 430) & (x < (50 * (5+1))) & (y < 480)));
end

if(pixelMemory[17]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 6)) & (y > 430) & (x < (50 * (6+1))) & (y < 480)));
end

if(pixelMemory[22]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 7)) & (y > 430) & (x < (50 * (7+1))) & (y < 480)));
end

if(pixelMemory[25]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 8)) & (y > 430) & (x < (50 * (8+1))) & (y < 480)));
end

if(pixelMemory[28]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 9)) & (y > 430) & (x < (50 * (9+1))) & (y < 480)));
end

if(pixelMemory[31]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 10)) & (y > 430) & (x < (50 * (10+1))) & (y < 480)));
end

if(pixelMemory[34]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 11)) & (y > 430) & (x < (50 * (11+1))) & (y < 480)));
end

if(pixelMemory[37]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 12)) & (y > 430) & (x < (50 * (12+1))) & (y < 480)));
end


//start row 2

if(pixelMemory[40]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 0)) & (y > 380) & (x < (50 * (0+1))) & (y < 430)));
end

if(pixelMemory[43]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 1)) & (y > 380) & (x < (50 * (1+1))) & (y < 430)));
end

if(pixelMemory[46]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 2)) & (y > 380) & (x < (50 * (2+1))) & (y < 430)));
end

if(pixelMemory[49]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 3)) & (y > 380) & (x < (50 * (3+1))) & (y < 430)));
end

if(pixelMemory[52]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 4)) & (y > 380) & (x < (50 * (4+1))) & (y < 430)));
end

if(pixelMemory[55]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 5)) & (y > 380) & (x < (50 * (5+1))) & (y < 430)));
end

if(pixelMemory[58]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 6)) & (y > 380) & (x < (50 * (6+1))) & (y < 430)));
end

if(pixelMemory[61]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 7)) & (y > 380) & (x < (50 * (7+1))) & (y < 430)));
end

if(pixelMemory[64]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 8)) & (y > 380) & (x < (50 * (8+1))) & (y < 430)));
end

if(pixelMemory[67]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 9)) & (y > 380) & (x < (50 * (9+1))) & (y < 430)));
end

if(pixelMemory[70]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 10)) & (y > 380) & (x < (50 * (10+1))) & (y < 430)));
end
if(pixelMemory[73]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 11)) & (y > 380) & (x < (50 * (11+1))) & (y < 430)));
end

if(pixelMemory[76]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 12)) & (y > 380) & (x < (50 * (12+1))) & (y < 430)));
end






//start row 3----------------------------------------



if(pixelMemory[79]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 0)) & (y > 330) & (x < (50 * (0+1))) & (y < 380)));
end

if(pixelMemory[82]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 1)) & (y > 330) & (x < (50 * (1+1))) & (y < 380)));
end

if(pixelMemory[85]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 2)) & (y > 330) & (x < (50 * (2+1))) & (y < 380)));
end

if(pixelMemory[88]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 3)) & (y > 330) & (x < (50 * (3+1))) & (y < 380)));
end

if(pixelMemory[91]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 4)) & (y > 330) & (x < (50 * (4+1))) & (y < 380)));
end

if(pixelMemory[94]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 5)) & (y > 330) & (x < (50 * (5+1))) & (y < 380)));
end

if(pixelMemory[97]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 6)) & (y > 330) & (x < (50 * (6+1))) & (y < 380)));
end

if(pixelMemory[100]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 7)) & (y > 330) & (x < (50 * (7+1))) & (y < 380)));
end

if(pixelMemory[103]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 8)) & (y > 330) & (x < (50 * (8+1))) & (y < 380)));
end

if(pixelMemory[106]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 8)) & (y > 330) & (x < (50 * (9+1))) & (y < 380)));
end

if(pixelMemory[109]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 10)) & (y >330) & (x < (50 * (10+1))) & (y < 380)));
end

if(pixelMemory[112]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 11)) & (y > 330) & (x < (50 * (11+1))) & (y < 380)));
end

if(pixelMemory[115]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 12)) & (y > 330) & (x < (50 * (12+1))) & (y < 380)));
end


//--------------start row 4----------------------

if(pixelMemory[118]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 0)) & (y > 280) & (x < (50 * (1))) & (y < 330)));
end


if(pixelMemory[121]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 1)) & (y > 280) & (x < (50 * (0+1))) & (y < 330)));
end

if(pixelMemory[124]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 2)) & (y > 280) & (x < (50 * (1+1))) & (y < 330)));
end

if(pixelMemory[127]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 3)) & (y > 280) & (x < (50 * (2+1))) & (y < 330)));
end

if(pixelMemory[130]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 4)) & (y > 280) & (x < (50 * (3+1))) & (y < 330)));
end

if(pixelMemory[133]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 5)) & (y > 280) & (x < (50 * (4+1))) & (y < 330)));
end

if(pixelMemory[136]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 5)) & (y > 280) & (x < (50 * (5+1))) & (y < 330)));
end

if(pixelMemory[139]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 6)) & (y > 280) & (x < (50 * (6+1))) & (y < 330)));
end

if(pixelMemory[142]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 7)) & (y > 280) & (x < (50 * (7+1))) & (y < 330)));
end

if(pixelMemory[145]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 8)) & (y > 280) & (x < (50 * (8+1))) & (y < 330)));
end

if(pixelMemory[148]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 9)) & (y > 280) & (x < (50 * (9+1))) & (y < 330)));
end

if(pixelMemory[151]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 10)) & (y > 280) & (x < (50 * (10+1))) & (y < 330)));
end

if(pixelMemory[154]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 11)) & (y > 280) & (x < (50 * (11+1))) & (y < 330)));
end

if(pixelMemory[157]==1'b1)begin
prev_B[3] = cur_B[3];
cur_B[3] = (prev_B[3] +((x > (50 * 12)) & (y > 280) & (x < (50 * (12+1))) & (y < 330)));
end

					VGA_R[3]<=cur_R[3];
					VGA_G[3]<=cur_G[3];
					VGA_B[3]<=cur_B[3];
				   VGA_B[3] <=sky;
end
wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
vga640x480 display (.i_clk(clk),.i_pix_stb(pix_stb),.i_rst(!rst_btn),.o_hs(hsync),.o_vs(vsync),.o_x(x),.o_y(y));

endmodule