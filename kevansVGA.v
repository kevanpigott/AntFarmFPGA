//Author:Kevan Pigott
module kevansVGA(rst_btn,clk,pixelMemory,quadrant,hsync,vsync,VGA_R,VGA_G,VGA_B);

input wire clk,rst_btn;
input [1:0]quadrant;

output wire hsync;
output wire vsync;

output reg [3:0] VGA_R;    // 4-bit VGA red output
output reg [3:0] VGA_G;
output reg [3:0] VGA_B;  
//pixel clock
reg [15:0] cnt;

reg pix_stb;

integer WIDTH=18;//9//18//20
integer HEIGHT=20;//10//20//23

//working: 3 35 7 104
//try 3 36 9 107
parameter setL=3;
parameter blocks=35;	//should be actual number of blocks - 1  
integer BPR=7;//blocks per row, for 3 blocks per row set it to 4
parameter pixmemL=104;//(setL*blocks)-1;//(blocks*setL)-1
input [104:0]pixelMemory;//[(blocks*setL)-1:0]

always @(posedge clk) begin 
    {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000	
end
reg cur;
reg [3:0]prev_R;
reg [3:0]prev_G;
reg [3:0]prev_B;
integer i;
integer rownum;
integer column_num;
reg [3:0]cur_R;
reg [3:0]cur_G;
reg [3:0]cur_B;
always@(posedge clk)begin
				
				for(i=0;i<35;i=i+1)	begin//7 should be thenumber of blocks
				
					rownum=i/BPR;
					column_num=i%BPR;//i
					
					if((quadrant==2'd2)|(quadrant==2'd3)) begin
						rownum=rownum+5;
					end
					
					if((quadrant==2'd1)|(quadrant==2'd3)) begin
						column_num=column_num+7;
					end
					//((x > (WIDTH*1)) & (y > (HEIGHT*row)) & (x < (WIDTH*(1+1))) & (y < (HEIGHT*(row+1))));
					if(pixelMemory[i*3]==1'b1)begin
						prev_R[3]=cur_R[3];
						cur_R[3]=(prev_R[3]+((x > (WIDTH*column_num)) & (y > (HEIGHT*(rownum))) & (x < (WIDTH*(column_num+1))) & (y < (HEIGHT*((rownum)+1)))));
					end
					
					if(pixelMemory[((i*3)+1)]==1'b1)begin
						prev_G[3]=cur_G[3];
						cur_G[3]=(prev_G[3]+((x > (WIDTH*column_num)) & (y > (HEIGHT*(rownum))) & (x < (WIDTH*(column_num+1))) & (y < (HEIGHT*((rownum)+1)))));
					end
					
					if(pixelMemory[((i*3)+2)]==1'b1)begin
						prev_B[3]=cur_B[3];
						cur_B[3]=(prev_B[3]+((x > (WIDTH*column_num)) & (y > (HEIGHT*(rownum))) & (x < (WIDTH*(column_num+1))) & (y < (HEIGHT*((rownum)+1)))));
					end
				//test
					VGA_R[0] <= VGA_R[1];
					VGA_R[1] <= VGA_R[2];
					VGA_R[2] <= VGA_R[3];
					
					VGA_G[0] <= VGA_G[1];
					VGA_G[1] <= VGA_G[2];
					VGA_G[2] <= VGA_G[3];
					
					VGA_B[0] <= VGA_B[1];
					VGA_B[1] <= VGA_B[2];
					VGA_B[2] <= VGA_B[3];
				//if(pixelMemory[((i*2)-1)==1'b1)]) begin
					VGA_R[3]<=cur_R[3];
					VGA_G[3]<=cur_G[3];
					VGA_B[3]<=cur_B[3];
				end
				
				
end
wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
vga640x480 display (.i_clk(clk),.i_pix_stb(pix_stb),.i_rst(!rst_btn),.o_hs(hsync),.o_vs(vsync),.o_x(x),.o_y(y));

endmodule