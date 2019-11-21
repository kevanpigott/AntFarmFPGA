module vga(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,         // reset button
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B,     // 4-bit VGA blue output
   xLowDirt, xHighDirt, yLowDirt,yHighDirt);
     wire sq_a, sq_sky, sq_dirt, sq_queen, sq_ant; //areas of color 
      reg xLowDirt ;
       reg xHighDirt ;
       reg yLowDirt ;
       reg yHighDirt ;

	
	//parameter Xwidth=100;
	//parameter i=1;
	//parameter Ywidth=100;
	//parameter j=1;
	
	//blockswidth=pixelwidthofscreen/numberofblockswidth  where number of blocks width is the number of blocks horizontally
	
	//for(i<numberofblocksswidth){//
	//	for(j<numberofpblocksheight){
	//		placeblock(x>((i-1)*Xwidth)	& (x<i*xwidth) //same thing for y)
	//		j++;
	//	}
	//	i++;
	//}
	
	
    wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    // wire rst = RST_BTN;  // reset is active high on Basys3 (BTNC)

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
	 begin 
        {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000
		  assign sq_dirt = ((x > xLowDirt) & (y > 455) & (x < 25) & (y < 480)) ? 1 : 0;
            if(xHighDirt <615)
                begin
                    xLowdirt <= xLowDirt + 2'd75;
                    xHighDirt <= xHighDirt + 2'd75;
                end
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

    assign sq_sky = ((x > 0) & (y < 240) & (x < 640) & (y > 0)) ? 1 : 0;
	 //-----
	 assign sq_queen = ((x > 100) & (y > 455) & (x < 125) & (y < 480)) ? 1 : 0;
	 assign sq_ant = ((x > 400) & (y > 455) & (x < 450) & (y < 480)) ? 1 : 0;

    assign VGA_R[3] = sq_dirt |sq_ant;   
    assign VGA_R[2] = sq_ant;
    assign VGA_R[1] = sq_queen;
    assign VGA_R[0] = sq_ant;
    assign VGA_G[3] = sq_dirt ;  
	 assign VGA_G[2] = sq_ant;
	 assign VGA_G[1] = sq_ant;
	 assign VGA_G[0] = sq_ant;
    assign VGA_B[3] = sq_sky| sq_ant;
	 assign VGA_B[2] = sq_queen| sq_ant |sq_sky;
	 assign VGA_B[1] = sq_ant;
	 assign VGA_B[0] = sq_ant;
	 
	 
endmodule
