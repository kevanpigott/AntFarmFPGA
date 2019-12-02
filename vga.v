module vga(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,         // reset button
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output reg [3:0] VGA_R,    // 4-bit VGA red output
    output reg [3:0] VGA_G,    // 4-bit VGA green output
    output reg [3:0] VGA_B,     // 4-bit VGA blue output
	input 	[2:0]displayInfo,  //determines colors of blocks
 input [2:0]sqSwitch  //determines which block to change color
);
     wire  sq_sky, sq_block1,sq_block2,sq_block3,sq_block4,sq_block5,sq_block6 ; //areas of color 

	 assign sq_block1 = ((x > 0) & (y > 430) & (x < 50) & (y < 480)) ? 1 : 0;
	 assign sq_block2 = ((x > 50) & (y > 430) & (x < 100) & (y < 480)) ? 1 : 0;
	 
    assign sq_block3 = ((x > 0) & (y > 380) & (x < 50) & (y < 430)) ? 1 : 0;
    assign sq_block4 = ((x > 50) & (y > 380) & (x < 100) & (y < 430)) ? 1 : 0;
	 
	 assign sq_block5 = ((x > 0) & (y > 330) & (x < 50) & (y < 380)) ? 1 : 0;
	 assign sq_block6 = ((x > 50) & (y > 330) & (x < 100) & (y < 380)) ? 1 : 0;
	 
	 
    wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    // wire rst = RST_BTN;  // reset is active high on Basys3 (BTNC)

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
	 begin 
        {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000	
	case(sqSwitch)
		3'b000:
		begin
			case(displayInfo)
		3'b000:
		begin 
			VGA_R[3] = sq_block1; //red //sq_block1|sq_block2|sq_block3|sq_block4|sq_block5|sq_block6;
		end
		3'b001:
		begin 
			 VGA_B[3] = sq_block1;
			 VGA_R[3] = sq_block1; //white
			 VGA_G[3] = sq_block1;
		end
		3'b010:
		begin 
			 VGA_G[3] = sq_block1;	//green	
			 VGA_G[2] = sq_block1;		
		end
		3'b011:
		begin 
			VGA_B[3] = sq_block1;//brown
			VGA_R[1] = sq_block1;
		end
		3'b100:
		begin 
			VGA_G[1] = sq_block1;
			VGA_B[1] = sq_block1;
			VGA_R[1] = sq_block1;		//black?
		end
		3'b101:
		begin 
			VGA_G[1] = sq_block1;//black
			VGA_B[1] = sq_block1;
			VGA_R[1] = sq_block1;			
		end
		3'b110:
		begin 
			VGA_B[2] = sq_block1;
			VGA_R[1] = sq_block1; //purple
		end
		3'b111: 
	   begin 
		 VGA_B[3] = sq_block1;
		 VGA_R[3] = sq_block1;		//yellow
		end	
		default:
		begin 
		 VGA_B[3] = sq_block1; //yellow
		 VGA_R[3] = sq_block1;
		end
	endcase
		end
		3'b001:
		begin 
		case(displayInfo)
		3'b000:
		begin 
			VGA_R[3] = sq_block2; //red //sq_block2|sq_block2|sq_block3|sq_block4|sq_block5|sq_block6;
		end
		3'b001:
		begin 
			 VGA_B[3] = sq_block2;
			 VGA_R[3] = sq_block2; //white
			 VGA_G[3] = sq_block2;
		end
		3'b010:
		begin 
			 VGA_G[3] = sq_block2;	//green	
			 VGA_G[2] = sq_block2;		
		end
		3'b011:
		begin 
			VGA_B[3] = sq_block2;//brown
			VGA_R[1] = sq_block2;
		end
		3'b100:
		begin 
			VGA_G[1] = sq_block2;
			VGA_B[1] = sq_block2;
			VGA_R[1] = sq_block2;		//black?
		end
		3'b101:
		begin 
			VGA_G[1] = sq_block2;//black
			VGA_B[1] = sq_block2;
			VGA_R[1] = sq_block2;			
		end
		3'b110:
		begin 
			VGA_B[2] = sq_block2;
			VGA_R[1] = sq_block2; //purple
		end
		3'b111: 
	   begin 
		 VGA_B[3] = sq_block2;
		 VGA_R[3] = sq_block2;		//yellow
		end	
		default:
		begin 
		 VGA_B[3] = sq_block2; //yellow
		 VGA_R[3] = sq_block2;
		end
	endcase
		end
		3'b010:
		begin 
		case(displayInfo)
		3'b000:
		begin 
			VGA_R[3] = sq_block3; //red //sq_block3|sq_block3|sq_block3|sq_block4|sq_block5|sq_block6;
		end
		3'b001:
		begin 
			 VGA_B[3] = sq_block3;
			 VGA_R[3] = sq_block3; //white
			 VGA_G[3] = sq_block3;
		end
		3'b010:
		begin 
			 VGA_G[3] = sq_block3;	//green	
			 VGA_G[2] = sq_block3;		
		end
		3'b011:
		begin 
			VGA_B[3] = sq_block3;//brown
			VGA_R[1] = sq_block3;
		end
		3'b100:
		begin 
			VGA_G[1] = sq_block3;
			VGA_B[1] = sq_block3;
			VGA_R[1] = sq_block3;		//black?
		end
		3'b101:
		begin 
			VGA_G[1] = sq_block3;//black
			VGA_B[1] = sq_block3;
			VGA_R[1] = sq_block3;			
		end
		3'b110:
		begin 
			VGA_B[2] = sq_block3;
			VGA_R[1] = sq_block3; //purple
		end
		3'b111: 
	   begin 
		 VGA_B[3] = sq_block3;
		 VGA_R[3] = sq_block3;		//yellow
		end	
		default:
		begin 
		 VGA_B[3] = sq_block3; //yellow
		 VGA_R[3] = sq_block3;
		end
	endcase
		end
		3'b011:
		begin 
		case(displayInfo)
		3'b000:
		begin 
			VGA_R[3] = sq_block4; //red //sq_block4|sq_block4|sq_block4|sq_block4|sq_block5|sq_block6;
		end
		3'b001:
		begin 
			 VGA_B[3] = sq_block4;
			 VGA_R[3] = sq_block4; //white
			 VGA_G[3] = sq_block4;
		end
		3'b010:
		begin 
			 VGA_G[3] = sq_block4;	//green	
			 VGA_G[2] = sq_block4;		
		end
		3'b011:
		begin 
			VGA_B[3] = sq_block4;//brown
			VGA_R[1] = sq_block4;
		end
		3'b100:
		begin 
			VGA_G[1] = sq_block4;
			VGA_B[1] = sq_block4;
			VGA_R[1] = sq_block4;		//black?
		end
		3'b101:
		begin 
			VGA_G[1] = sq_block4;//black
			VGA_B[1] = sq_block4;
			VGA_R[1] = sq_block4;			
		end
		3'b110:
		begin 
			VGA_B[2] = sq_block4;
			VGA_R[1] = sq_block4; //purple
		end
		3'b111: 
	   begin 
		 VGA_B[3] = sq_block4;
		 VGA_R[3] = sq_block4;		//yellow
		end	
		default:
		begin 
		 VGA_B[3] = sq_block4; //yellow
		 VGA_R[3] = sq_block4;
		end
	endcase
		end
		3'b100:
		begin 
		case(displayInfo)
		3'b000:
		begin 
			VGA_R[3] = sq_block5; //red //sq_block5|sq_block5|sq_block5|sq_block5|sq_block5|sq_block6;
		end
		3'b001:
		begin 
			 VGA_B[3] = sq_block5;
			 VGA_R[3] = sq_block5; //white
			 VGA_G[3] = sq_block5;
		end
		3'b010:
		begin 
			 VGA_G[3] = sq_block5;	//green	
			 VGA_G[2] = sq_block5;		
		end
		3'b011:
		begin 
			VGA_B[3] = sq_block5;//brown
			VGA_R[1] = sq_block5;
		end
		3'b100:
		begin 
			VGA_G[1] = sq_block5;
			VGA_B[1] = sq_block5;
			VGA_R[1] = sq_block5;		//black?
		end
		3'b101:
		begin 
			VGA_G[1] = sq_block5;//black
			VGA_B[1] = sq_block5;
			VGA_R[1] = sq_block5;			
		end
		3'b110:
		begin 
			VGA_B[2] = sq_block5;
			VGA_R[1] = sq_block5; //purple
		end
		3'b111: 
	   begin 
		 VGA_B[3] = sq_block5;
		 VGA_R[3] = sq_block5;		//yellow
		end	
		default:
		begin 
		 VGA_B[3] = sq_block5; //yellow
		 VGA_R[3] = sq_block5;
		end
	endcase
		end
		3'b101:
		begin 
		case(displayInfo)
		3'b000:
		begin 
			VGA_R[3] = sq_block6; //red //sq_block6|sq_block6|sq_block6|sq_block6|sq_block6|sq_block6;
		end
		3'b001:
		begin 
			 VGA_B[3] = sq_block6;
			 VGA_R[3] = sq_block6; //white
			 VGA_G[3] = sq_block6;
		end
		3'b010:
		begin 
			 VGA_G[3] = sq_block6;	//green	
			 VGA_G[2] = sq_block6;		
		end
		3'b011:
		begin 
			VGA_B[3] = sq_block6;//brown
			VGA_R[1] = sq_block6;
		end
		3'b100:
		begin 
			VGA_G[1] = sq_block6;
			VGA_B[1] = sq_block6;
			VGA_R[1] = sq_block6;		//black?
		end
		3'b101:
		begin 
			VGA_G[1] = sq_block6;//black
			VGA_B[1] = sq_block6;
			VGA_R[1] = sq_block6;			
		end
		3'b110:
		begin 
			VGA_B[2] = sq_block6;
			VGA_R[1] = sq_block6; //purple
		end
		3'b111: 
	   begin 
		 VGA_B[3] = sq_block6;
		 VGA_R[3] = sq_block6;		//yellow
		end	
		default:
		begin 
		 VGA_B[3] = sq_block6; //yellow
		 VGA_R[3] = sq_block6;
		end
	endcase
		end
		default:
		begin 
		case(displayInfo)
		3'b000:
		begin 
			VGA_R[3] = sq_block1; //red //sq_block1|sq_block1|sq_block1|sq_block1|sq_block1|sq_block1;
		end
		3'b001:
		begin 
			 VGA_B[3] = sq_block1;
			 VGA_R[3] = sq_block1; //white
			 VGA_G[3] = sq_block1;
		end
		3'b010:
		begin 
			 VGA_G[3] = sq_block1;	//green	
			 VGA_G[2] = sq_block1;		
		end
		3'b011:
		begin 
			VGA_B[3] = sq_block1;//brown
			VGA_R[1] = sq_block1;
		end
		3'b100:
		begin 
			VGA_G[1] = sq_block1;
			VGA_B[1] = sq_block1;
			VGA_R[1] = sq_block1;		//black?
		end
		3'b101:
		begin 
			VGA_G[1] = sq_block1;//black
			VGA_B[1] = sq_block1;
			VGA_R[1] = sq_block1;			
		end
		3'b110:
		begin 
			VGA_B[2] = sq_block1;
			VGA_R[1] = sq_block1; //purple
		end
		3'b111: 
	   begin 
		 VGA_B[3] = sq_block1;
		 VGA_R[3] = sq_block1;		//yellow
		end	
		default:
		begin 
		 VGA_B[3] = sq_block1; //yellow
		 VGA_R[3] = sq_block1;
		end
	endcase
		end
	endcase
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
