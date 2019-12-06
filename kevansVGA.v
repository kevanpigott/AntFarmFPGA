module kevansVGA(clk,rst_btn,pixelMemory,hsync,vsync,VGA_R,VGA_G,VGA_B);

input wire clk,rst_btn;


output wire hsync;
output wire vsync;

output reg [3:0] VGA_R;    // 4-bit VGA red output
output reg [3:0] VGA_G;
output reg [3:0] VGA_B;  
//pixel clock
reg [15:0] cnt;

reg pix_stb;

integer WIDTH=25;
integer HEIGHT=25;



integer setL=2;
wire blocks=24;	//should be actual number of blocks - 1
integer BPR=10;//blocks per row, for 3 blocks per row set it to 4
parameter inL=9;//i beleive this should be equal to (setL*blocks)-1
input [47:0]pixelMemory;

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
				for(i=0;i<9;i=i+1)	begin//7 should be thenumber of blocks
					//((x > (WIDTH*1)) & (y > (HEIGHT*row)) & (x < (WIDTH*(1+1))) & (y < (HEIGHT*(row+1))));
					if(pixelMemory[i*2]==1'b1)begin
						prev_R[3]=cur_R[3];
						cur_R[3]=(prev_R[3]+((x > (WIDTH*i)) & (y > (HEIGHT*(i/BPR))) & (x < (WIDTH*(i+1))) & (y < (HEIGHT*((i/BPR)+1)))));
					end
					
					if(pixelMemory[((i*2)+1)]==1'b1)begin
						prev_G[3]=cur_G[3];
						cur_G[3]=(prev_G[3]+((x > (WIDTH*i)) & (y > (HEIGHT*(i/BPR))) & (x < (WIDTH*(i+1))) & (y < (HEIGHT*((i/BPR)+1)))));
					end
					
					//if(pixelMemory[((i*setL)+2)]==1'b1)begin
					//	prev_B[3]=cur_B[3];
					//	cur_B[3]=(prev_B[3]+((x > (WIDTH*i)) & (y > (HEIGHT*(i/BPR))) & (x < (WIDTH*(i+1))) & (y < (HEIGHT*((i/BPR)+1)))));
					//end
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