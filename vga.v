module vga(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,         // reset button
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output reg [3:0] VGA_R,    // 4-bit VGA red output
    output reg [3:0] VGA_G,    // 4-bit VGA green output
    output reg [3:0] VGA_B,     // 4-bit VGA blue output
	input 	[2:0]displayInfo,  //determines colors of blocks
 input [5:0]sqSwitch  //determines which block to change color
);
     wire  sq_sky, sq_block1,sq_block2,sq_block3,sq_block4,sq_block5,sq_block6,sq_block7,sq_block8,sq_block9,sq_block10,sq_block11,sq_block12,sq_block13,sq_block14,sq_block15,
	 sq_block16,sq_block17,sq_block18,sq_block19,sq_block20,sq_block21,sq_block22,sq_block23,sq_block24,sq_block25,sq_block26,sq_block27,sq_block28,sq_block29,sq_block30,sq_block31,sq_block32,
	sq_block33,sq_block34,sq_block35,sq_block36,sq_block37,sq_block38,sq_block39,sq_block40,sq_block41,sq_block42,sq_block43,sq_block44,sq_block45,sq_block46,sq_block47,sq_block48,sq_block49,
sq_block50,sq_block51,sq_block52	; //areas of color 

//	 assign sq_sky = ((x > 0) & (y < 280) & (x < 640) & (y > 0)) ? 1 : 0;
//
//	 assign sq_block1 = ((x > 0) & (y > 430) & (x < 50) & (y < 480)) ? 1 : 0;
//	 assign sq_block2 = ((x > 50) & (y > 430) & (x < 100) & (y < 480)) ? 1 : 0;
//	 
//    assign sq_block3 = ((x > 0) & (y > 380) & (x < 50) & (y < 430)) ? 1 : 0;
//    assign sq_block4 = ((x > 50) & (y > 380) & (x < 100) & (y < 430)) ? 1 : 0;
//	 
//	 assign sq_block5 = ((x > 0) & (y > 330) & (x < 50) & (y < 380)) ? 1 : 0;
//	 assign sq_block6 = ((x > 50) & (y > 330) & (x < 100) & (y < 380)) ? 1 : 0;
	 
	 
	     assign sq_sky = ((x > 0) & (y < 280) & (x < 640) & (y > 0)) ? 1 : 0;

	 
//row 1
	 assign sq_block1 = ((x > 0) & (y > 430) & (x < 50) & (y < 480)) ? 1 : 0;
	 assign sq_block2 = ((x > 50) & (y > 430) & (x < 100) & (y < 480)) ? 1 : 0;
	 
    assign sq_block3 = ((x > 100) & (y > 430) & (x < 150) & (y < 480)) ? 1 : 0;
    assign sq_block4 = ((x > 150) & (y > 430) & (x < 200) & (y < 480)) ? 1 : 0;
	 
	 assign sq_block5 = ((x > 200) & (y > 430) & (x < 250) & (y < 480)) ? 1 : 0;
	 assign sq_block6 = ((x > 250) & (y > 430) & (x < 300) & (y < 480)) ? 1 : 0;
	 
	 assign sq_block7 = ((x > 300) & (y > 430) & (x < 350) & (y < 480)) ? 1 : 0;
	 assign sq_block8 = ((x > 350) & (y > 430) & (x < 400) & (y < 480)) ? 1 : 0;
	 
    assign sq_block9 = ((x > 400) & (y > 430) & (x < 450) & (y < 480)) ? 1 : 0;
    assign sq_block10 = ((x > 450) & (y > 430) & (x < 500) & (y < 480)) ? 1 : 0;
	 
	 assign sq_block11 = ((x > 500) & (y > 430) & (x < 550) & (y < 480)) ? 1 : 0;
	 assign sq_block12 = ((x > 550) & (y > 430) & (x < 600) & (y < 480)) ? 1 : 0;
	 
	 assign sq_block13 = ((x > 600) & (y > 430) & (x < 640) & (y < 480)) ? 1 : 0;
	 
//row 2
    assign sq_block14 = ((x > 0) & (y > 380) & (x < 50) & (y < 430)) ? 1 : 0;
	 assign sq_block15 = ((x > 50) & (y > 380) & (x < 100) & (y < 430)) ? 1 : 0;
	 
    assign sq_block16 = ((x > 100) & (y > 380) & (x < 150) & (y < 430)) ? 1 : 0;
    assign sq_block17 = ((x > 150) & (y > 380) & (x < 200) & (y < 430)) ? 1 : 0;
	 
	 assign sq_block18 = ((x > 200) & (y > 380) & (x < 250) & (y < 430)) ? 1 : 0;
	 assign sq_block19 = ((x > 250) & (y > 380) & (x < 300) & (y < 430)) ? 1 : 0;
	 
	 assign sq_block20 = ((x > 300) & (y > 380) & (x < 350) & (y < 430)) ? 1 : 0;
	 assign sq_block21 = ((x > 350) & (y > 380) & (x < 400) & (y < 430)) ? 1 : 0;
	 
    assign sq_block22 = ((x > 400) & (y > 380) & (x < 450) & (y < 430)) ? 1 : 0;
    assign sq_block23 = ((x > 450) & (y > 380) & (x < 500) & (y < 430)) ? 1 : 0;
	 
	 assign sq_block24 = ((x > 500) & (y > 380) & (x < 550) & (y < 430)) ? 1 : 0;
	 assign sq_block25 = ((x > 550) & (y > 380) & (x < 600) & (y < 430)) ? 1 : 0;
	 
	 assign sq_block26 = ((x > 600) & (y > 380) & (x < 640) & (y < 430)) ? 1 : 0;
	
//row 3
    assign sq_block27 = ((x > 0) & (y > 330) & (x < 50) & (y < 380)) ? 1 : 0;
	 assign sq_block28 = ((x > 50) & (y > 330) & (x < 100) & (y < 380)) ? 1 : 0;
	 
    assign sq_block29= ((x > 100) & (y > 330) & (x < 150) & (y < 380)) ? 1 : 0;
    assign sq_block30 = ((x > 150) & (y > 330) & (x < 200) & (y < 380)) ? 1 : 0;
	 
	 assign sq_block31 = ((x > 200) & (y > 330) & (x < 250) & (y < 380)) ? 1 : 0;
	 assign sq_block32 = ((x > 250) & (y > 330) & (x < 300) & (y < 380)) ? 1 : 0;
	 
	 assign sq_block33 = ((x > 300) & (y > 330) & (x < 350) & (y < 380)) ? 1 : 0;
	 assign sq_block34 = ((x > 350) & (y > 330) & (x < 400) & (y < 380)) ? 1 : 0;
	 
    assign sq_block35 = ((x > 400) & (y > 330) & (x < 450) & (y < 380)) ? 1 : 0;
    assign sq_block36 = ((x > 450) & (y > 330) & (x < 500) & (y < 380)) ? 1 : 0;
	 
	 assign sq_block37 = ((x > 500) & (y > 330) & (x < 550) & (y < 380)) ? 1 : 0;
	 assign sq_block38 = ((x > 550) & (y > 330) & (x < 600) & (y < 380)) ? 1 : 0;
	 
	 assign sq_block39 = ((x > 600) & (y > 330) & (x < 640) & (y < 380)) ? 1 : 0;	
	 
//row 4
    assign sq_block40 = ((x > 0) & (y > 280) & (x < 50) & (y < 330)) ? 1 : 0;
	 assign sq_block41 = ((x > 50) & (y > 280) & (x < 100) & (y < 330)) ? 1 : 0;
	 
    assign sq_block42 = ((x > 100) & (y > 280) & (x < 150) & (y < 330)) ? 1 : 0;
    assign sq_block43 = ((x > 150) & (y > 280) & (x < 200) & (y < 330)) ? 1 : 0;
	 
	 assign sq_block44 = ((x > 200) & (y > 280) & (x < 250) & (y < 330)) ? 1 : 0;
	 assign sq_block45 = ((x > 250) & (y > 280) & (x < 300) & (y < 330)) ? 1 : 0;
	 
	 assign sq_block46 = ((x > 300) & (y > 280) & (x < 350) & (y < 330)) ? 1 : 0;
	 assign sq_block47 = ((x > 350) & (y > 280) & (x < 400) & (y < 330)) ? 1 : 0;
	 
    assign sq_block48 = ((x > 400) & (y > 280) & (x < 450) & (y < 330)) ? 1 : 0;
    assign sq_block49 = ((x > 450) & (y > 280) & (x < 500) & (y < 330)) ? 1 : 0;
	 
	 assign sq_block50 = ((x > 500) & (y > 280) & (x < 550) & (y < 330)) ? 1 : 0;
	 assign sq_block51 = ((x > 550) & (y > 280) & (x < 600) & (y < 330)) ? 1 : 0;
	 
	 assign sq_block52 = ((x > 600) & (y > 280) & (x < 640) & (y < 330)) ? 1 : 0;

	 
	 
    wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    // wire rst = RST_BTN;  // reset is active high on Basys3 (BTNC)

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
	 begin 
        {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000	
		case(sqSwitch)
		6'b000000:
		begin
			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
			3'b000:
			begin 
				VGA_R[3] = sq_block1; //red 
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
		6'b000001:
		begin 
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block2; //red 
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
		6'b000010:
		begin 
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block3; //red 
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
		6'b000011:
		begin 
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block4; //red 
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
		6'b000100:
		begin 
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block5; //red 
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
		6'b000101:
		begin 
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block6; //red 
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
		6'b000110: //7
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block7; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block7;
					 VGA_R[3] = sq_block7; //white
					 VGA_G[3] = sq_block7;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block7;	//green	
					 VGA_G[2] = sq_block7;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block7;//brown
					VGA_R[1] = sq_block7;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block7;
					VGA_B[1] = sq_block7;
					VGA_R[1] = sq_block7;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block7;//black
					VGA_B[1] = sq_block7;
					VGA_R[1] = sq_block7;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block7;
					VGA_R[1] = sq_block7; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block7;
				 VGA_R[3] = sq_block7;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block7; //yellow
				 VGA_R[3] = sq_block7;
				end
		    endcase
		end
		6'b000111: //8
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block8; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block8;
					 VGA_R[3] = sq_block8; //white
					 VGA_G[3] = sq_block8;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block8;	//green	
					 VGA_G[2] = sq_block8;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block8;//brown
					VGA_R[1] = sq_block8;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block8;
					VGA_B[1] = sq_block8;
					VGA_R[1] = sq_block8;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block8;//black
					VGA_B[1] = sq_block8;
					VGA_R[1] = sq_block8;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block8;
					VGA_R[1] = sq_block8; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block8;
				 VGA_R[3] = sq_block8;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block8; //yellow
				 VGA_R[3] = sq_block8;
				end
		    endcase 
		end
		6'b001000: //9
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block9; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block9;
					 VGA_R[3] = sq_block9; //white
					 VGA_G[3] = sq_block9;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block9;	//green	
					 VGA_G[2] = sq_block9;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block9;//brown
					VGA_R[1] = sq_block9;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block9;
					VGA_B[1] = sq_block9;
					VGA_R[1] = sq_block9;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block9;//black
					VGA_B[1] = sq_block9;
					VGA_R[1] = sq_block9;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block9;
					VGA_R[1] = sq_block9; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block9;
				 VGA_R[3] = sq_block9;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block9; //yellow
				 VGA_R[3] = sq_block9;
				end
		    endcase 
		end
		6'b001001: //10
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block10; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block10;
					 VGA_R[3] = sq_block10; //white
					 VGA_G[3] = sq_block10;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block10;	//green	
					 VGA_G[2] = sq_block10;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block10;//brown
					VGA_R[1] = sq_block10;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block10;
					VGA_B[1] = sq_block10;
					VGA_R[1] = sq_block10;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block10;//black
					VGA_B[1] = sq_block10;
					VGA_R[1] = sq_block10;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block10;
					VGA_R[1] = sq_block10; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block10;
				 VGA_R[3] = sq_block10;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block10; //yellow
				 VGA_R[3] = sq_block10;
				end
		    endcase
		end
		6'b001010: //11
		begin 
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block11; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block11;
					 VGA_R[3] = sq_block11; //white
					 VGA_G[3] = sq_block11;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block11;	//green	
					 VGA_G[2] = sq_block11;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block11;//brown
					VGA_R[1] = sq_block11;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block11;
					VGA_B[1] = sq_block11;
					VGA_R[1] = sq_block11;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block11;//black
					VGA_B[1] = sq_block11;
					VGA_R[1] = sq_block11;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block11;
					VGA_R[1] = sq_block11; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block11;
				 VGA_R[3] = sq_block11;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block11; //yellow
				 VGA_R[3] = sq_block11;
				end
		    endcase
		end
		6'b001011://12
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block12; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block12;
					 VGA_R[3] = sq_block12; //white
					 VGA_G[3] = sq_block12;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block12;	//green	
					 VGA_G[2] = sq_block12;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block12;//brown
					VGA_R[1] = sq_block12;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block12;
					VGA_B[1] = sq_block12;
					VGA_R[1] = sq_block12;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block12;//black
					VGA_B[1] = sq_block12;
					VGA_R[1] = sq_block12;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block12;
					VGA_R[1] = sq_block12; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block12;
				 VGA_R[3] = sq_block12;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block12; //yellow
				 VGA_R[3] = sq_block12;
				end
		    endcase
		end
		6'b001100://13
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block13; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block13;
					 VGA_R[3] = sq_block13; //white
					 VGA_G[3] = sq_block13;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block13;	//green	
					 VGA_G[2] = sq_block13;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block13;//brown
					VGA_R[1] = sq_block13;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block13;
					VGA_B[1] = sq_block13;
					VGA_R[1] = sq_block13;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block13;//black
					VGA_B[1] = sq_block13;
					VGA_R[1] = sq_block13;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block13;
					VGA_R[1] = sq_block13; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block13;
				 VGA_R[3] = sq_block13;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block13; //yellow
				 VGA_R[3] = sq_block13;
				end
		    endcase
		end
		6'b001101://14
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block14; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block14;
					 VGA_R[3] = sq_block14; //white
					 VGA_G[3] = sq_block14;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block14;	//green	
					 VGA_G[2] = sq_block14;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block14;//brown
					VGA_R[1] = sq_block14;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block14;
					VGA_B[1] = sq_block14;
					VGA_R[1] = sq_block14;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block14;//black
					VGA_B[1] = sq_block14;
					VGA_R[1] = sq_block14;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block14;
					VGA_R[1] = sq_block14; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block14;
				 VGA_R[3] = sq_block14;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block14; //yellow
				 VGA_R[3] = sq_block14;
				end
		    endcase
		end
		6'b001110://15
		begin
							VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block15; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block15;
					 VGA_R[3] = sq_block15; //white
					 VGA_G[3] = sq_block15;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block15;	//green	
					 VGA_G[2] = sq_block15;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block15;//brown
					VGA_R[1] = sq_block15;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block15;
					VGA_B[1] = sq_block15;
					VGA_R[1] = sq_block15;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block15;//black
					VGA_B[1] = sq_block15;
					VGA_R[1] = sq_block15;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block15;
					VGA_R[1] = sq_block15; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block15;
				 VGA_R[3] = sq_block15;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block15; //yellow
				 VGA_R[3] = sq_block15;
				end
		    endcase
		end
		6'b001111://16
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block16; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block16;
					 VGA_R[3] = sq_block16; //white
					 VGA_G[3] = sq_block16;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block16;	//green	
					 VGA_G[2] = sq_block16;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block16;//brown
					VGA_R[1] = sq_block16;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block16;
					VGA_B[1] = sq_block16;
					VGA_R[1] = sq_block16;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block16;//black
					VGA_B[1] = sq_block16;
					VGA_R[1] = sq_block16;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block16;
					VGA_R[1] = sq_block16; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block16;
				 VGA_R[3] = sq_block16;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block16; //yellow
				 VGA_R[3] = sq_block16;
				end
		    endcase
		end
		6'b010000://17
		begin 
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block17; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block17;
					 VGA_R[3] = sq_block17; //white
					 VGA_G[3] = sq_block17;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block17;	//green	
					 VGA_G[2] = sq_block17;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block17;//brown
					VGA_R[1] = sq_block17;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block17;
					VGA_B[1] = sq_block17;
					VGA_R[1] = sq_block17;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block17;//black
					VGA_B[1] = sq_block17;
					VGA_R[1] = sq_block17;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block17;
					VGA_R[1] = sq_block17; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block17;
				 VGA_R[3] = sq_block17;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block17; //yellow
				 VGA_R[3] = sq_block17;
				end
		    endcase
		end
		6'b010001://18
		begin
					VGA_B[3] = sq_sky;

					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block18; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block18;
					 VGA_R[3] = sq_block18; //white
					 VGA_G[3] = sq_block18;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block18;	//green	
					 VGA_G[2] = sq_block18;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block18;//brown
					VGA_R[1] = sq_block18;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block18;
					VGA_B[1] = sq_block18;
					VGA_R[1] = sq_block18;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block18;//black
					VGA_B[1] = sq_block18;
					VGA_R[1] = sq_block18;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block18;
					VGA_R[1] = sq_block18; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block18;
				 VGA_R[3] = sq_block18;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block18; //yellow
				 VGA_R[3] = sq_block18;
				end
		    endcase
		end
		6'b010010://19
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block19; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block19;
					 VGA_R[3] = sq_block19; //white
					 VGA_G[3] = sq_block19;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block19;	//green	
					 VGA_G[2] = sq_block19;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block19;//brown
					VGA_R[1] = sq_block19;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block19;
					VGA_B[1] = sq_block19;
					VGA_R[1] = sq_block19;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block19;//black
					VGA_B[1] = sq_block19;
					VGA_R[1] = sq_block19;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block19;
					VGA_R[1] = sq_block19; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block19;
				 VGA_R[3] = sq_block19;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block19; //yellow
				 VGA_R[3] = sq_block19;
				end
		    endcase
		end
		6'b010011://20
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block20; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block20;
					 VGA_R[3] = sq_block20; //white
					 VGA_G[3] = sq_block20;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block20;	//green	
					 VGA_G[2] = sq_block20;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block20;//brown
					VGA_R[1] = sq_block20;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block20;
					VGA_B[1] = sq_block20;
					VGA_R[1] = sq_block20;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block20;//black
					VGA_B[1] = sq_block20;
					VGA_R[1] = sq_block20;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block20;
					VGA_R[1] = sq_block20; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block20;
				 VGA_R[3] = sq_block20;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block20; //yellow
				 VGA_R[3] = sq_block20;
				end
		    endcase
		end
		6'b010100://21
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block21; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block21;
					 VGA_R[3] = sq_block21; //white
					 VGA_G[3] = sq_block21;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block21;	//green	
					 VGA_G[2] = sq_block21;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block21;//brown
					VGA_R[1] = sq_block21;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block21;
					VGA_B[1] = sq_block21;
					VGA_R[1] = sq_block21;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block21;//black
					VGA_B[1] = sq_block21;
					VGA_R[1] = sq_block21;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block21;
					VGA_R[1] = sq_block21; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block21;
				 VGA_R[3] = sq_block21;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block21; //yellow
				 VGA_R[3] = sq_block21;
				end
		    endcase
		end
		6'b010101://22
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block22; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block22;
					 VGA_R[3] = sq_block22; //white
					 VGA_G[3] = sq_block22;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block22;	//green	
					 VGA_G[2] = sq_block22;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block22;//brown
					VGA_R[1] = sq_block22;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block22;
					VGA_B[1] = sq_block22;
					VGA_R[1] = sq_block22;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block22;//black
					VGA_B[1] = sq_block22;
					VGA_R[1] = sq_block22;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block22;
					VGA_R[1] = sq_block22; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block22;
				 VGA_R[3] = sq_block22;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block22; //yellow
				 VGA_R[3] = sq_block22;
				end
		    endcase
		end
		6'b010110://23
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block23; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block23;
					 VGA_R[3] = sq_block23; //white
					 VGA_G[3] = sq_block23;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block23;	//green	
					 VGA_G[2] = sq_block23;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block23;//brown
					VGA_R[1] = sq_block23;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block23;
					VGA_B[1] = sq_block23;
					VGA_R[1] = sq_block23;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block23;//black
					VGA_B[1] = sq_block23;
					VGA_R[1] = sq_block23;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block23;
					VGA_R[1] = sq_block23; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block23;
				 VGA_R[3] = sq_block23;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block23; //yellow
				 VGA_R[3] = sq_block23;
				end
		    endcase
		end
		6'b010111://24
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block24; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block24;
					 VGA_R[3] = sq_block24; //white
					 VGA_G[3] = sq_block24;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block24;	//green	
					 VGA_G[2] = sq_block24;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block24;//brown
					VGA_R[1] = sq_block24;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block24;
					VGA_B[1] = sq_block24;
					VGA_R[1] = sq_block24;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block24;//black
					VGA_B[1] = sq_block24;
					VGA_R[1] = sq_block24;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block24;
					VGA_R[1] = sq_block24; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block24;
				 VGA_R[3] = sq_block24;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block24; //yellow
				 VGA_R[3] = sq_block24;
				end
		    endcase
		end
		6'b011000://25
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block25; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block25;
					 VGA_R[3] = sq_block25; //white
					 VGA_G[3] = sq_block25;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block25;	//green	
					 VGA_G[2] = sq_block25;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block25;//brown
					VGA_R[1] = sq_block25;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block25;
					VGA_B[1] = sq_block25;
					VGA_R[1] = sq_block25;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block25;//black
					VGA_B[1] = sq_block25;
					VGA_R[1] = sq_block25;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block25;
					VGA_R[1] = sq_block25; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block25;
				 VGA_R[3] = sq_block25;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block25; //yellow
				 VGA_R[3] = sq_block25;
				end
		    endcase
		end
		6'b011001://26
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block26; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block26;
					 VGA_R[3] = sq_block26; //white
					 VGA_G[3] = sq_block26;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block26;	//green	
					 VGA_G[2] = sq_block26;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block26;//brown
					VGA_R[1] = sq_block26;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block26;
					VGA_B[1] = sq_block26;
					VGA_R[1] = sq_block26;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block26;//black
					VGA_B[1] = sq_block26;
					VGA_R[1] = sq_block26;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block26;
					VGA_R[1] = sq_block26; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block26;
				 VGA_R[3] = sq_block26;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block26; //yellow
				 VGA_R[3] = sq_block26;
				end
		    endcase
		end
		6'b011010://27
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block27; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block27;
					 VGA_R[3] = sq_block27; //white
					 VGA_G[3] = sq_block27;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block27;	//green	
					 VGA_G[2] = sq_block27;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block27;//brown
					VGA_R[1] = sq_block27;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block27;
					VGA_B[1] = sq_block27;
					VGA_R[1] = sq_block27;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block27;//black
					VGA_B[1] = sq_block27;
					VGA_R[1] = sq_block27;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block27;
					VGA_R[1] = sq_block27; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block27;
				 VGA_R[3] = sq_block27;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block27; //yellow
				 VGA_R[3] = sq_block27;
				end
		    endcase
		end
		6'b011011://28
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block28; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block28;
					 VGA_R[3] = sq_block28; //white
					 VGA_G[3] = sq_block28;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block28;	//green	
					 VGA_G[2] = sq_block28;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block28;//brown
					VGA_R[1] = sq_block28;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block28;
					VGA_B[1] = sq_block28;
					VGA_R[1] = sq_block28;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block28;//black
					VGA_B[1] = sq_block28;
					VGA_R[1] = sq_block28;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block28;
					VGA_R[1] = sq_block28; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block28;
				 VGA_R[3] = sq_block28;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block28; //yellow
				 VGA_R[3] = sq_block28;
				end
		    endcase
		end
		6'b011100://29
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block29; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block29;
					 VGA_R[3] = sq_block29; //white
					 VGA_G[3] = sq_block29;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block29;	//green	
					 VGA_G[2] = sq_block29;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block29;//brown
					VGA_R[1] = sq_block29;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block29;
					VGA_B[1] = sq_block29;
					VGA_R[1] = sq_block29;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block29;//black
					VGA_B[1] = sq_block29;
					VGA_R[1] = sq_block29;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block29;
					VGA_R[1] = sq_block29; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block29;
				 VGA_R[3] = sq_block29;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block29; //yellow
				 VGA_R[3] = sq_block29;
				end
		    endcase
		end
		6'b011101://30
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block30; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block30;
					 VGA_R[3] = sq_block30; //white
					 VGA_G[3] = sq_block30;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block30;	//green	
					 VGA_G[2] = sq_block30;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block30;//brown
					VGA_R[1] = sq_block30;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block30;
					VGA_B[1] = sq_block30;
					VGA_R[1] = sq_block30;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block30;//black
					VGA_B[1] = sq_block30;
					VGA_R[1] = sq_block30;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block30;
					VGA_R[1] = sq_block30; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block30;
				 VGA_R[3] = sq_block30;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block30; //yellow
				 VGA_R[3] = sq_block30;
				end
		    endcase
		end
		6'b011110://31
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block31; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block31;
					 VGA_R[3] = sq_block31; //white
					 VGA_G[3] = sq_block31;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block31;	//green	
					 VGA_G[2] = sq_block31;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block31;//brown
					VGA_R[1] = sq_block31;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block31;
					VGA_B[1] = sq_block31;
					VGA_R[1] = sq_block31;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block31;//black
					VGA_B[1] = sq_block31;
					VGA_R[1] = sq_block31;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block31;
					VGA_R[1] = sq_block31; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block31;
				 VGA_R[3] = sq_block31;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block31; //yellow
				 VGA_R[3] = sq_block31;
				end
		    endcase
		end
		6'b011111: //32
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block32; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block32;
					 VGA_R[3] = sq_block32; //white
					 VGA_G[3] = sq_block32;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block32;	//green	
					 VGA_G[2] = sq_block32;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block32;//brown
					VGA_R[1] = sq_block32;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block32;
					VGA_B[1] = sq_block32;
					VGA_R[1] = sq_block32;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block32;//black
					VGA_B[1] = sq_block32;
					VGA_R[1] = sq_block32;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block32;
					VGA_R[1] = sq_block32; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block32;
				 VGA_R[3] = sq_block32;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block32; //yellow
				 VGA_R[3] = sq_block32;
				end
		    endcase
		end
		6'b100000://33
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block33; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block33;
					 VGA_R[3] = sq_block33; //white
					 VGA_G[3] = sq_block33;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block33;	//green	
					 VGA_G[2] = sq_block33;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block33;//brown
					VGA_R[1] = sq_block33;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block33;
					VGA_B[1] = sq_block33;
					VGA_R[1] = sq_block33;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block33;//black
					VGA_B[1] = sq_block33;
					VGA_R[1] = sq_block33;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block33;
					VGA_R[1] = sq_block33; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block33;
				 VGA_R[3] = sq_block33;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block33; //yellow
				 VGA_R[3] = sq_block33;
				end
		    endcase
		end
		6'b100001://34
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block34; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block34;
					 VGA_R[3] = sq_block34; //white
					 VGA_G[3] = sq_block34;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block34;	//green	
					 VGA_G[2] = sq_block34;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block34;//brown
					VGA_R[1] = sq_block34;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block34;
					VGA_B[1] = sq_block34;
					VGA_R[1] = sq_block34;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block34;//black
					VGA_B[1] = sq_block34;
					VGA_R[1] = sq_block34;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block34;
					VGA_R[1] = sq_block34; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block34;
				 VGA_R[3] = sq_block34;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block34; //yellow
				 VGA_R[3] = sq_block34;
				end
		    endcase
		end
		6'b100010://35
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block35; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block35;
					 VGA_R[3] = sq_block35; //white
					 VGA_G[3] = sq_block35;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block35;	//green	
					 VGA_G[2] = sq_block35;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block35;//brown
					VGA_R[1] = sq_block35;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block35;
					VGA_B[1] = sq_block35;
					VGA_R[1] = sq_block35;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block35;//black
					VGA_B[1] = sq_block35;
					VGA_R[1] = sq_block35;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block35;
					VGA_R[1] = sq_block35; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block35;
				 VGA_R[3] = sq_block35;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block35; //yellow
				 VGA_R[3] = sq_block35;
				end
		    endcase
		end
		6'b100011://36
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block36; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block36;
					 VGA_R[3] = sq_block36; //white
					 VGA_G[3] = sq_block36;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block36;	//green	
					 VGA_G[2] = sq_block36;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block36;//brown
					VGA_R[1] = sq_block36;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block36;
					VGA_B[1] = sq_block36;
					VGA_R[1] = sq_block36;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block36;//black
					VGA_B[1] = sq_block36;
					VGA_R[1] = sq_block36;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block36;
					VGA_R[1] = sq_block36; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block36;
				 VGA_R[3] = sq_block36;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block36; //yellow
				 VGA_R[3] = sq_block36;
				end
		    endcase
		end
		6'b100100://37
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block37; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block37;
					 VGA_R[3] = sq_block37; //white
					 VGA_G[3] = sq_block37;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block37;	//green	
					 VGA_G[2] = sq_block37;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block37;//brown
					VGA_R[1] = sq_block37;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block37;
					VGA_B[1] = sq_block37;
					VGA_R[1] = sq_block37;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block37;//black
					VGA_B[1] = sq_block37;
					VGA_R[1] = sq_block37;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block37;
					VGA_R[1] = sq_block37; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block37;
				 VGA_R[3] = sq_block37;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block37; //yellow
				 VGA_R[3] = sq_block37;
				end
		    endcase
		end
		6'b100101://38
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block38; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block38;
					 VGA_R[3] = sq_block38; //white
					 VGA_G[3] = sq_block38;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block38;	//green	
					 VGA_G[2] = sq_block38;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block38;//brown
					VGA_R[1] = sq_block38;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block38;
					VGA_B[1] = sq_block38;
					VGA_R[1] = sq_block38;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block38;//black
					VGA_B[1] = sq_block38;
					VGA_R[1] = sq_block38;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block38;
					VGA_R[1] = sq_block38; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block38;
				 VGA_R[3] = sq_block38;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block38; //yellow
				 VGA_R[3] = sq_block38;
				end
		    endcase
		end
		6'b100110://39
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block39; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block39;
					 VGA_R[3] = sq_block39; //white
					 VGA_G[3] = sq_block39;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block39;	//green	
					 VGA_G[2] = sq_block39;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block39;//brown
					VGA_R[1] = sq_block39;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block39;
					VGA_B[1] = sq_block39;
					VGA_R[1] = sq_block39;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block39;//black
					VGA_B[1] = sq_block39;
					VGA_R[1] = sq_block39;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block39;
					VGA_R[1] = sq_block39; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block39;
				 VGA_R[3] = sq_block39;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block39; //yellow
				 VGA_R[3] = sq_block39;
				end
		    endcase
		end
		6'b100111://40
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block40; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block40;
					 VGA_R[3] = sq_block40; //white
					 VGA_G[3] = sq_block40;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block40;	//green	
					 VGA_G[2] = sq_block40;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block40;//brown
					VGA_R[1] = sq_block40;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block40;
					VGA_B[1] = sq_block40;
					VGA_R[1] = sq_block40;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block40;//black
					VGA_B[1] = sq_block40;
					VGA_R[1] = sq_block40;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block40;
					VGA_R[1] = sq_block40; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block40;
				 VGA_R[3] = sq_block40;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block40; //yellow
				 VGA_R[3] = sq_block40;
				end
		    endcase
		end
		6'b101000://41
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block41; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block41;
					 VGA_R[3] = sq_block41; //white
					 VGA_G[3] = sq_block41;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block41;	//green	
					 VGA_G[2] = sq_block41;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block41;//brown
					VGA_R[1] = sq_block41;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block41;
					VGA_B[1] = sq_block41;
					VGA_R[1] = sq_block41;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block41;//black
					VGA_B[1] = sq_block41;
					VGA_R[1] = sq_block41;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block41;
					VGA_R[1] = sq_block41; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block41;
				 VGA_R[3] = sq_block41;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block41; //yellow
				 VGA_R[3] = sq_block41;
				end
		    endcase
		end
		6'b101001://42

		begin
			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
		case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block42; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block42;
					 VGA_R[3] = sq_block42; //white
					 VGA_G[3] = sq_block42;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block42;	//green	
					 VGA_G[2] = sq_block42;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block42;//brown
					VGA_R[1] = sq_block42;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block42;
					VGA_B[1] = sq_block42;
					VGA_R[1] = sq_block42;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block42;//black
					VGA_B[1] = sq_block42;
					VGA_R[1] = sq_block42;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block42;
					VGA_R[1] = sq_block42; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block42;
				 VGA_R[3] = sq_block42;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block42; //yellow
				 VGA_R[3] = sq_block42;
				end
		    endcase
		end
		6'b101010://43
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block43; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block43;
					 VGA_R[3] = sq_block43; //white
					 VGA_G[3] = sq_block43;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block43;	//green	
					 VGA_G[2] = sq_block43;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block43;//brown
					VGA_R[1] = sq_block43;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block43;
					VGA_B[1] = sq_block43;
					VGA_R[1] = sq_block43;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block43;//black
					VGA_B[1] = sq_block43;
					VGA_R[1] = sq_block43;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block43;
					VGA_R[1] = sq_block43; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block43;
				 VGA_R[3] = sq_block43;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block43; //yellow
				 VGA_R[3] = sq_block43;
				end
		    endcase
		end
		6'b101011://44
		begin
					VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block44; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block44;
					 VGA_R[3] = sq_block44; //white
					 VGA_G[3] = sq_block44;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block44;	//green	
					 VGA_G[2] = sq_block44;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block44;//brown
					VGA_R[1] = sq_block44;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block44;
					VGA_B[1] = sq_block44;
					VGA_R[1] = sq_block44;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block44;//black
					VGA_B[1] = sq_block44;
					VGA_R[1] = sq_block44;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block44;
					VGA_R[1] = sq_block44; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block44;
				 VGA_R[3] = sq_block44;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block44; //yellow
				 VGA_R[3] = sq_block44;
				end
		    endcase
		end
        6'b101100://45
        begin
		  			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
        			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block45; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block45;
					 VGA_R[3] = sq_block45; //white
					 VGA_G[3] = sq_block45;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block45;	//green	
					 VGA_G[2] = sq_block45;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block45;//brown
					VGA_R[1] = sq_block45;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block45;
					VGA_B[1] = sq_block45;
					VGA_R[1] = sq_block45;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block45;//black
					VGA_B[1] = sq_block45;
					VGA_R[1] = sq_block45;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block45;
					VGA_R[1] = sq_block45; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block45;
				 VGA_R[3] = sq_block45;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block45; //yellow
				 VGA_R[3] = sq_block45;
				end
		    endcase
        end
        6'b101101://46
        begin
		  			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
        			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block46; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block46;
					 VGA_R[3] = sq_block46; //white
					 VGA_G[3] = sq_block46;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block46;	//green	
					 VGA_G[2] = sq_block46;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block46;//brown
					VGA_R[1] = sq_block46;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block46;
					VGA_B[1] = sq_block46;
					VGA_R[1] = sq_block46;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block46;//black
					VGA_B[1] = sq_block46;
					VGA_R[1] = sq_block46;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block46;
					VGA_R[1] = sq_block46; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block46;
				 VGA_R[3] = sq_block46;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block46; //yellow
				 VGA_R[3] = sq_block46;
				end
		    endcase
        end
        6'b101110://47
        begin
		  			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
        			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block47; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block47;
					 VGA_R[3] = sq_block47; //white
					 VGA_G[3] = sq_block47;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block47;	//green	
					 VGA_G[2] = sq_block47;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block47;//brown
					VGA_R[1] = sq_block47;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block47;
					VGA_B[1] = sq_block47;
					VGA_R[1] = sq_block47;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block47;//black
					VGA_B[1] = sq_block47;
					VGA_R[1] = sq_block47;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block47;
					VGA_R[1] = sq_block47; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block47;
				 VGA_R[3] = sq_block47;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block47; //yellow
				 VGA_R[3] = sq_block47;
				end
		    endcase
        end
        6'b101111://48
        begin
		  			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
        			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block48; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block48;
					 VGA_R[3] = sq_block48; //white
					 VGA_G[3] = sq_block48;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block48;	//green	
					 VGA_G[2] = sq_block48;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block48;//brown
					VGA_R[1] = sq_block48;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block48;
					VGA_B[1] = sq_block48;
					VGA_R[1] = sq_block48;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block48;//black
					VGA_B[1] = sq_block48;
					VGA_R[1] = sq_block48;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block48;
					VGA_R[1] = sq_block48; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block48;
				 VGA_R[3] = sq_block48;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block48; //yellow
				 VGA_R[3] = sq_block48;
				end
		    endcase
        end
        6'b110000://49
        begin
        						VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
					case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block49; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block49;
					 VGA_R[3] = sq_block49; //white
					 VGA_G[3] = sq_block49;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block49;	//green	
					 VGA_G[2] = sq_block49;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block49;//brown
					VGA_R[1] = sq_block49;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block49;
					VGA_B[1] = sq_block49;
					VGA_R[1] = sq_block49;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block49;//black
					VGA_B[1] = sq_block49;
					VGA_R[1] = sq_block49;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block49;
					VGA_R[1] = sq_block49; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block49;
				 VGA_R[3] = sq_block49;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block49; //yellow
				 VGA_R[3] = sq_block49;
				end
		    endcase
        end
        6'b110001://50
        begin
		  			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
        			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block50; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block50;
					 VGA_R[3] = sq_block50; //white
					 VGA_G[3] = sq_block50;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block50;	//green	
					 VGA_G[2] = sq_block50;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block50;//brown
					VGA_R[1] = sq_block50;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block50;
					VGA_B[1] = sq_block50;
					VGA_R[1] = sq_block50;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block50;//black
					VGA_B[1] = sq_block50;
					VGA_R[1] = sq_block50;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block50;
					VGA_R[1] = sq_block50; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block50;
				 VGA_R[3] = sq_block50;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block50; //yellow
				 VGA_R[3] = sq_block50;
				end
		    endcase
        end
        6'b110010://51
        begin
		  			VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
        			case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block51; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block51;
					 VGA_R[3] = sq_block51; //white
					 VGA_G[3] = sq_block51;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block51;	//green	
					 VGA_G[2] = sq_block51;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block51;//brown
					VGA_R[1] = sq_block51;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block51;
					VGA_B[1] = sq_block51;
					VGA_R[1] = sq_block51;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block51;//black
					VGA_B[1] = sq_block51;
					VGA_R[1] = sq_block51;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block51;
					VGA_R[1] = sq_block51; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block51;
				 VGA_R[3] = sq_block51;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block51; //yellow
				 VGA_R[3] = sq_block51;
				end
		    endcase
        end
		6'b110011://52
			begin
						VGA_B[3] = sq_sky;
			VGA_B[2] = sq_sky;
			VGA_B[1] = sq_sky;
						case(displayInfo)
				3'b000:
				begin 
					VGA_R[3] = sq_block52; //red 
				end
				3'b001:
				begin 
					 VGA_B[3] = sq_block52;
					 VGA_R[3] = sq_block52; //white
					 VGA_G[3] = sq_block52;
				end
				3'b010:
				begin 
					 VGA_G[3] = sq_block52;	//green	
					 VGA_G[2] = sq_block52;		
				end
				3'b011:
				begin 
					VGA_B[3] = sq_block52;//brown
					VGA_R[1] = sq_block52;
				end
				3'b100:
				begin 
					VGA_G[1] = sq_block52;
					VGA_B[1] = sq_block52;
					VGA_R[1] = sq_block52;		//black?
				end
				3'b101:
				begin 
					VGA_G[1] = sq_block52;//black
					VGA_B[1] = sq_block52;
					VGA_R[1] = sq_block52;			
				end
				3'b110:
				begin 
					VGA_B[2] = sq_block52;
					VGA_R[1] = sq_block52; //purple
				end
				3'b111: 
			   begin 
				 VGA_B[3] = sq_block52;
				 VGA_R[3] = sq_block52;		//yellow
				end	
				default:
				begin 
				 VGA_B[3] = sq_block52; //yellow
				 VGA_R[3] = sq_block52;
				end
		    endcase
			end
		default:
		begin 
							VGA_B[3] = sq_sky;

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
