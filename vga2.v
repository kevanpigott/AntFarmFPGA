module vga2(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,         // reset button
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output reg [3:0] VGA_R,    // 4-bit VGA red output
	 input [3:0]col,
	 input [2:0]row,
	 input [1:0]R,
	 input update,
    output reg [3:0] VGA_G,    // 4-bit VGA green output
    output reg [3:0] VGA_B     // 4-bit VGA blue output
	 
);
	//parameter WIDTH=50;
	//parameter HEIGHT=50;
	//reg [2:0] CS;
	//reg [2:0] NS;
	//reg prev;
	//reg cur;
//	reg [3:0]storeR;
//	reg [3:0]tempR;
//	reg [3:0]fuckyou;
//	integer i=0;
//	always@(posedge CLK) begin
//		VGA_R<=storeR;
//	end
	 reg [15:0] cnt;
	 reg top;
    reg pix_stb;
    always @(posedge CLK)
	 begin 
        {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000	
	end
	always @(posedge CLK) begin
		
		//tempR[3]<=((x > 200) & (y > 430) & (x < 250) & (y < 480));
		//tempR[3]<=(tempR[3]&((x > 100) & (y > 280) & (x < 150) & (y < 330)));
		//fuckyou[0]<=((x > 200) & (y > 430) & (x < 250) & (y < 480));
		//fuckyou[1]<=((x > 100) & (y > 280) & (x < 150) & (y < 330));
		
		//fuckyou[i+1]<=(fuckyou[i]+((x > 100) & (y > 280) & (x < 150) & (y < 330)));
		//i=i+1;
		//fuckyou[3]<=((x > 100) & (y > 280) & (x < 150) & (y < 330));
		//fuckyou[3]<=(fuckyou[3]+((x > 200) & (y > 430) & (x < 250) & (y < 480)));
		//prev=((x > (WIDTH*i)) & (y > 430) & (x < (WIDTH*(i+1))) & (y < 480));
		//cur=(prev+((x > 100) & (y > 280) & (x < 150) & (y < 330)));
		//prev=cur;
		//cur=prev+((x > (WIDTH*8)) & (y > 280) & (x < (WIDTH*(8+1))) & (y < 330));
		//tempR[3]<=(cur);
		//if(update==1'b1) begin
			
			//VGA_R[3]=tempR[3];
			VGA_R[3]=((x > 100) & (y > 280) & (x < 150) & (y < 330));
		//end
	end
    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511

    vga640x480 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );

	 //-----
	 //assign sq_ant = ((x > 400) & (y > 455) & (x < 450) & (y < 480)) ? 1 : 0;

//    assign VGA_R[3] = ;   
//    assign VGA_R[2] = ;
//    assign VGA_R[1] = ;
//    assign VGA_R[0] = ;
//    assign VGA_G[3] =  ;  
//	 assign VGA_G[2] = ;
//	 assign VGA_G[1] = ;
//	 assign VGA_G[0] = ;
//    assign VGA_B[3] = ;
//	 assign VGA_B[2] = ;
//	 assign VGA_B[1] = ;
//	 assign VGA_B[0] = ;
	 
	 
endmodule
