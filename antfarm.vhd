-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Sat Nov 30 16:18:49 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY antfarm IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		en :  IN  STD_LOGIC;
		clkKey :  IN  STD_LOGIC;
		setinputs :  IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
		hexoutA :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		hexoutB :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		hexoutC :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		hexoutD :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END antfarm;

ARCHITECTURE bdf_type OF antfarm IS 

COMPONENT blockdisp
	PORT(in : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT seneriouno
	PORT(		 outAnt : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		 outSugar : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		 outTunnel : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT blockv2
GENERIC (A : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AB : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AC : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AD : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AE : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AF : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AG : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AH : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AI : STD_LOGIC_VECTOR(7 DOWNTO 0);
			air : STD_LOGIC_VECTOR(2 DOWNTO 0);
			AJ : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AK : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AL : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AM : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AN : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AO : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AP : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AQ : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AR : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AS : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AT : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AU : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AV : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AW : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AX : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AY : STD_LOGIC_VECTOR(7 DOWNTO 0);
			AZ : STD_LOGIC_VECTOR(7 DOWNTO 0);
			B : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BB : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BC : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BD : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BE : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BF : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BG : STD_LOGIC_VECTOR(7 DOWNTO 0);
			BH : STD_LOGIC_VECTOR(7 DOWNTO 0);
			C : STD_LOGIC_VECTOR(7 DOWNTO 0);
			CW : STD_LOGIC_VECTOR(7 DOWNTO 0);
			CX : STD_LOGIC_VECTOR(7 DOWNTO 0);
			CY : STD_LOGIC_VECTOR(7 DOWNTO 0);
			D : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DB : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DC : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DD : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DE : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DF : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DG : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DH : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DI : STD_LOGIC_VECTOR(7 DOWNTO 0);
			dirt : STD_LOGIC_VECTOR(2 DOWNTO 0);
			DJ : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DK : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DL : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DM : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DN : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DO : STD_LOGIC_VECTOR(7 DOWNTO 0);
			DP : STD_LOGIC_VECTOR(7 DOWNTO 0);
			E : STD_LOGIC_VECTOR(7 DOWNTO 0);
			empty : STD_LOGIC_VECTOR(2 DOWNTO 0);
			ERROR : STD_LOGIC_VECTOR(7 DOWNTO 0);
			errorblock : STD_LOGIC_VECTOR(2 DOWNTO 0);
			F : STD_LOGIC_VECTOR(7 DOWNTO 0);
			FY : STD_LOGIC_VECTOR(7 DOWNTO 0);
			G : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GB : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GC : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GD : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GE : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GF : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GG : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GH : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GI : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GJ : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GK : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GL : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GM : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GN : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GNA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GO : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GP : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GQ : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GR : STD_LOGIC_VECTOR(7 DOWNTO 0);
			ground : STD_LOGIC_VECTOR(2 DOWNTO 0);
			GS : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GSA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GT : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GU : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GV : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GW : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GX : STD_LOGIC_VECTOR(7 DOWNTO 0);
			GY : STD_LOGIC_VECTOR(7 DOWNTO 0);
			H : STD_LOGIC_VECTOR(7 DOWNTO 0);
			HA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			HB : STD_LOGIC_VECTOR(7 DOWNTO 0);
			I : STD_LOGIC_VECTOR(7 DOWNTO 0);
			IG : STD_LOGIC_VECTOR(7 DOWNTO 0);
			inL : INTEGER;
			IPa : INTEGER;
			IPbtl : INTEGER;
			IPbtr : INTEGER;
			IPrdy2rcv : INTEGER;
			IPs : INTEGER;
			IPsend : INTEGER;
			IPver : INTEGER;
			J : STD_LOGIC_VECTOR(7 DOWNTO 0);
			K : STD_LOGIC_VECTOR(7 DOWNTO 0);
			L : STD_LOGIC_VECTOR(7 DOWNTO 0);
			M : STD_LOGIC_VECTOR(7 DOWNTO 0);
			N : STD_LOGIC_VECTOR(7 DOWNTO 0);
			NRA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			NRB : STD_LOGIC_VECTOR(7 DOWNTO 0);
			NRC : STD_LOGIC_VECTOR(7 DOWNTO 0);
			NRD : STD_LOGIC_VECTOR(7 DOWNTO 0);
			O : STD_LOGIC_VECTOR(7 DOWNTO 0);
			outL : INTEGER;
			P : STD_LOGIC_VECTOR(7 DOWNTO 0);
			Q : STD_LOGIC_VECTOR(7 DOWNTO 0);
			queen : STD_LOGIC_VECTOR(2 DOWNTO 0);
			R : STD_LOGIC_VECTOR(7 DOWNTO 0);
			S : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SE : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SN : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SRA : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SRB : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SRC : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SRD : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SS : STD_LOGIC_VECTOR(7 DOWNTO 0);
			START : STD_LOGIC_VECTOR(7 DOWNTO 0);
			SW : STD_LOGIC_VECTOR(7 DOWNTO 0);
			T : STD_LOGIC_VECTOR(7 DOWNTO 0);
			tunnel : STD_LOGIC_VECTOR(2 DOWNTO 0);
			U : STD_LOGIC_VECTOR(7 DOWNTO 0);
			V : STD_LOGIC_VECTOR(7 DOWNTO 0);
			W : STD_LOGIC_VECTOR(7 DOWNTO 0);
			wall : STD_LOGIC_VECTOR(2 DOWNTO 0);
			X : STD_LOGIC_VECTOR(7 DOWNTO 0);
			Y : STD_LOGIC_VECTOR(7 DOWNTO 0);
			Z : STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
	PORT(clk : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 set : IN STD_LOGIC;
		 inEast : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 inNorth : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 inSouth : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 inWest : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 SetIn : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 dispOut : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 outEast : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		 outNorth : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		 outSouth : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		 outState : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 outWest : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(8 DOWNTO 0);


BEGIN 



b2v_inst : blockdisp
PORT MAP(in => SYNTHESIZED_WIRE_0,
		 out => hexoutB);


b2v_inst10 : blockdisp
PORT MAP(in => SYNTHESIZED_WIRE_1,
		 out => hexoutC);


b2v_inst11 : blockdisp
PORT MAP(in => SYNTHESIZED_WIRE_2,
		 out => hexoutD);


b2v_inst12 : blockdisp
PORT MAP(in => SYNTHESIZED_WIRE_3,
		 out => hexoutA);


b2v_inst2194 : seneriouno
PORT MAP(		 outAnt => SYNTHESIZED_WIRE_4,
		 outSugar => SYNTHESIZED_WIRE_10,
		 outTunnel => SYNTHESIZED_WIRE_11);


b2v_inst6 : blockv2
GENERIC MAP(A => "00000000",
			AA => "00011010",
			AB => "00011011",
			AC => "00011100",
			AD => "00011101",
			AE => "00011110",
			AF => "00011111",
			AG => "00100000",
			AH => "00100001",
			AI => "00100010",
			air => "001",
			AJ => "00100011",
			AK => "00100100",
			AL => "00100101",
			AM => "00100110",
			AN => "00100111",
			AO => "00101000",
			AP => "00101001",
			AQ => "00101010",
			AR => "00101011",
			AS => "00101100",
			AT => "00101101",
			AU => "00101110",
			AV => "00101111",
			AW => "00110000",
			AX => "00110001",
			AY => "00110010",
			AZ => "00110011",
			B => "00000001",
			BA => "00110100",
			BB => "00110101",
			BC => "00110110",
			BD => "00110111",
			BE => "00111000",
			BF => "00111001",
			BG => "00111010",
			BH => "00111011",
			C => "00000010",
			CW => "01100100",
			CX => "01100101",
			CY => "01100110",
			D => "00000011",
			DA => "01101000",
			DB => "01101001",
			DC => "01101010",
			DD => "01101011",
			DE => "01101100",
			DF => "01101101",
			DG => "01101110",
			DH => "01101111",
			DI => "01110000",
			dirt => "010",
			DJ => "01110001",
			DK => "01110010",
			DL => "01110011",
			DM => "01110100",
			DN => "01110101",
			DO => "01110110",
			DP => "01110111",
			E => "00000100",
			empty => "000",
			ERROR => "11111111",
			errorblock => "110",
			F => "00000101",
			FY => "10110100",
			G => "00000110",
			GA => "10110110",
			GB => "10110111",
			GC => "10111000",
			GD => "10111001",
			GE => "10111010",
			GF => "10111011",
			GG => "10111100",
			GH => "10111101",
			GI => "10111110",
			GJ => "10111111",
			GK => "11000000",
			GL => "11000001",
			GM => "11000010",
			GN => "11000011",
			GNA => "11111010",
			GO => "11000100",
			GP => "11000101",
			GQ => "11000110",
			GR => "11000111",
			ground => "011",
			GS => "11001000",
			GSA => "11110101",
			GT => "11001001",
			GU => "11001010",
			GV => "11001011",
			GW => "11001100",
			GX => "11001101",
			GY => "11001110",
			H => "00000111",
			HA => "11010000",
			HB => "11010001",
			I => "00001000",
			IG => "11110000",
			inL => 8,
			IPa => 5,
			IPbtl => 8,
			IPbtr => 6,
			IPrdy2rcv => 3,
			IPs => 4,
			IPsend => 3,
			IPver => 0,
			J => "00001001",
			K => "00001010",
			L => "00001011",
			M => "00001100",
			N => "00001101",
			NRA => "11111001",
			NRB => "11111000",
			NRC => "11110111",
			NRD => "11110110",
			O => "00001110",
			outL => 8,
			P => "00001111",
			Q => "00010000",
			queen => "100",
			R => "00010001",
			S => "00010010",
			SE => "11111101",
			SN => "11111100",
			SRA => "11110100",
			SRB => "11110011",
			SRC => "11110010",
			SRD => "11110001",
			SS => "11111011",
			START => "00110011",
			SW => "11111110",
			T => "00010011",
			tunnel => "111",
			U => "00010100",
			V => "00010101",
			W => "00010110",
			wall => "101",
			X => "00010111",
			Y => "00011000",
			Z => "00011001"
			)
PORT MAP(clk => clk,
		 en => en,
		 set => en,
		 SetIn => SYNTHESIZED_WIRE_4,
		 dispOut => SYNTHESIZED_WIRE_3,
		 outNorth => SYNTHESIZED_WIRE_5);


b2v_inst7 : blockv2
GENERIC MAP(A => "00000000",
			AA => "00011010",
			AB => "00011011",
			AC => "00011100",
			AD => "00011101",
			AE => "00011110",
			AF => "00011111",
			AG => "00100000",
			AH => "00100001",
			AI => "00100010",
			air => "001",
			AJ => "00100011",
			AK => "00100100",
			AL => "00100101",
			AM => "00100110",
			AN => "00100111",
			AO => "00101000",
			AP => "00101001",
			AQ => "00101010",
			AR => "00101011",
			AS => "00101100",
			AT => "00101101",
			AU => "00101110",
			AV => "00101111",
			AW => "00110000",
			AX => "00110001",
			AY => "00110010",
			AZ => "00110011",
			B => "00000001",
			BA => "00110100",
			BB => "00110101",
			BC => "00110110",
			BD => "00110111",
			BE => "00111000",
			BF => "00111001",
			BG => "00111010",
			BH => "00111011",
			C => "00000010",
			CW => "01100100",
			CX => "01100101",
			CY => "01100110",
			D => "00000011",
			DA => "01101000",
			DB => "01101001",
			DC => "01101010",
			DD => "01101011",
			DE => "01101100",
			DF => "01101101",
			DG => "01101110",
			DH => "01101111",
			DI => "01110000",
			dirt => "010",
			DJ => "01110001",
			DK => "01110010",
			DL => "01110011",
			DM => "01110100",
			DN => "01110101",
			DO => "01110110",
			DP => "01110111",
			E => "00000100",
			empty => "000",
			ERROR => "11111111",
			errorblock => "110",
			F => "00000101",
			FY => "10110100",
			G => "00000110",
			GA => "10110110",
			GB => "10110111",
			GC => "10111000",
			GD => "10111001",
			GE => "10111010",
			GF => "10111011",
			GG => "10111100",
			GH => "10111101",
			GI => "10111110",
			GJ => "10111111",
			GK => "11000000",
			GL => "11000001",
			GM => "11000010",
			GN => "11000011",
			GNA => "11111010",
			GO => "11000100",
			GP => "11000101",
			GQ => "11000110",
			GR => "11000111",
			ground => "011",
			GS => "11001000",
			GSA => "11110101",
			GT => "11001001",
			GU => "11001010",
			GV => "11001011",
			GW => "11001100",
			GX => "11001101",
			GY => "11001110",
			H => "00000111",
			HA => "11010000",
			HB => "11010001",
			I => "00001000",
			IG => "11110000",
			inL => 8,
			IPa => 5,
			IPbtl => 8,
			IPbtr => 6,
			IPrdy2rcv => 3,
			IPs => 4,
			IPsend => 3,
			IPver => 0,
			J => "00001001",
			K => "00001010",
			L => "00001011",
			M => "00001100",
			N => "00001101",
			NRA => "11111001",
			NRB => "11111000",
			NRC => "11110111",
			NRD => "11110110",
			O => "00001110",
			outL => 8,
			P => "00001111",
			Q => "00010000",
			queen => "100",
			R => "00010001",
			S => "00010010",
			SE => "11111101",
			SN => "11111100",
			SRA => "11110100",
			SRB => "11110011",
			SRC => "11110010",
			SRD => "11110001",
			SS => "11111011",
			START => "00110011",
			SW => "11111110",
			T => "00010011",
			tunnel => "111",
			U => "00010100",
			V => "00010101",
			W => "00010110",
			wall => "101",
			X => "00010111",
			Y => "00011000",
			Z => "00011001"
			)
PORT MAP(clk => clk,
		 en => en,
		 set => en,
		 inSouth => SYNTHESIZED_WIRE_5,
		 SetIn => SYNTHESIZED_WIRE_11,
		 dispOut => SYNTHESIZED_WIRE_0,
		 outNorth => SYNTHESIZED_WIRE_7);


b2v_inst8 : blockv2
GENERIC MAP(A => "00000000",
			AA => "00011010",
			AB => "00011011",
			AC => "00011100",
			AD => "00011101",
			AE => "00011110",
			AF => "00011111",
			AG => "00100000",
			AH => "00100001",
			AI => "00100010",
			air => "001",
			AJ => "00100011",
			AK => "00100100",
			AL => "00100101",
			AM => "00100110",
			AN => "00100111",
			AO => "00101000",
			AP => "00101001",
			AQ => "00101010",
			AR => "00101011",
			AS => "00101100",
			AT => "00101101",
			AU => "00101110",
			AV => "00101111",
			AW => "00110000",
			AX => "00110001",
			AY => "00110010",
			AZ => "00110011",
			B => "00000001",
			BA => "00110100",
			BB => "00110101",
			BC => "00110110",
			BD => "00110111",
			BE => "00111000",
			BF => "00111001",
			BG => "00111010",
			BH => "00111011",
			C => "00000010",
			CW => "01100100",
			CX => "01100101",
			CY => "01100110",
			D => "00000011",
			DA => "01101000",
			DB => "01101001",
			DC => "01101010",
			DD => "01101011",
			DE => "01101100",
			DF => "01101101",
			DG => "01101110",
			DH => "01101111",
			DI => "01110000",
			dirt => "010",
			DJ => "01110001",
			DK => "01110010",
			DL => "01110011",
			DM => "01110100",
			DN => "01110101",
			DO => "01110110",
			DP => "01110111",
			E => "00000100",
			empty => "000",
			ERROR => "11111111",
			errorblock => "110",
			F => "00000101",
			FY => "10110100",
			G => "00000110",
			GA => "10110110",
			GB => "10110111",
			GC => "10111000",
			GD => "10111001",
			GE => "10111010",
			GF => "10111011",
			GG => "10111100",
			GH => "10111101",
			GI => "10111110",
			GJ => "10111111",
			GK => "11000000",
			GL => "11000001",
			GM => "11000010",
			GN => "11000011",
			GNA => "11111010",
			GO => "11000100",
			GP => "11000101",
			GQ => "11000110",
			GR => "11000111",
			ground => "011",
			GS => "11001000",
			GSA => "11110101",
			GT => "11001001",
			GU => "11001010",
			GV => "11001011",
			GW => "11001100",
			GX => "11001101",
			GY => "11001110",
			H => "00000111",
			HA => "11010000",
			HB => "11010001",
			I => "00001000",
			IG => "11110000",
			inL => 8,
			IPa => 5,
			IPbtl => 8,
			IPbtr => 6,
			IPrdy2rcv => 3,
			IPs => 4,
			IPsend => 3,
			IPver => 0,
			J => "00001001",
			K => "00001010",
			L => "00001011",
			M => "00001100",
			N => "00001101",
			NRA => "11111001",
			NRB => "11111000",
			NRC => "11110111",
			NRD => "11110110",
			O => "00001110",
			outL => 8,
			P => "00001111",
			Q => "00010000",
			queen => "100",
			R => "00010001",
			S => "00010010",
			SE => "11111101",
			SN => "11111100",
			SRA => "11110100",
			SRB => "11110011",
			SRC => "11110010",
			SRD => "11110001",
			SS => "11111011",
			START => "00110011",
			SW => "11111110",
			T => "00010011",
			tunnel => "111",
			U => "00010100",
			V => "00010101",
			W => "00010110",
			wall => "101",
			X => "00010111",
			Y => "00011000",
			Z => "00011001"
			)
PORT MAP(clk => clk,
		 en => en,
		 set => en,
		 inSouth => SYNTHESIZED_WIRE_7,
		 SetIn => SYNTHESIZED_WIRE_11,
		 dispOut => SYNTHESIZED_WIRE_1,
		 outNorth => SYNTHESIZED_WIRE_9);


b2v_inst9 : blockv2
GENERIC MAP(A => "00000000",
			AA => "00011010",
			AB => "00011011",
			AC => "00011100",
			AD => "00011101",
			AE => "00011110",
			AF => "00011111",
			AG => "00100000",
			AH => "00100001",
			AI => "00100010",
			air => "001",
			AJ => "00100011",
			AK => "00100100",
			AL => "00100101",
			AM => "00100110",
			AN => "00100111",
			AO => "00101000",
			AP => "00101001",
			AQ => "00101010",
			AR => "00101011",
			AS => "00101100",
			AT => "00101101",
			AU => "00101110",
			AV => "00101111",
			AW => "00110000",
			AX => "00110001",
			AY => "00110010",
			AZ => "00110011",
			B => "00000001",
			BA => "00110100",
			BB => "00110101",
			BC => "00110110",
			BD => "00110111",
			BE => "00111000",
			BF => "00111001",
			BG => "00111010",
			BH => "00111011",
			C => "00000010",
			CW => "01100100",
			CX => "01100101",
			CY => "01100110",
			D => "00000011",
			DA => "01101000",
			DB => "01101001",
			DC => "01101010",
			DD => "01101011",
			DE => "01101100",
			DF => "01101101",
			DG => "01101110",
			DH => "01101111",
			DI => "01110000",
			dirt => "010",
			DJ => "01110001",
			DK => "01110010",
			DL => "01110011",
			DM => "01110100",
			DN => "01110101",
			DO => "01110110",
			DP => "01110111",
			E => "00000100",
			empty => "000",
			ERROR => "11111111",
			errorblock => "110",
			F => "00000101",
			FY => "10110100",
			G => "00000110",
			GA => "10110110",
			GB => "10110111",
			GC => "10111000",
			GD => "10111001",
			GE => "10111010",
			GF => "10111011",
			GG => "10111100",
			GH => "10111101",
			GI => "10111110",
			GJ => "10111111",
			GK => "11000000",
			GL => "11000001",
			GM => "11000010",
			GN => "11000011",
			GNA => "11111010",
			GO => "11000100",
			GP => "11000101",
			GQ => "11000110",
			GR => "11000111",
			ground => "011",
			GS => "11001000",
			GSA => "11110101",
			GT => "11001001",
			GU => "11001010",
			GV => "11001011",
			GW => "11001100",
			GX => "11001101",
			GY => "11001110",
			H => "00000111",
			HA => "11010000",
			HB => "11010001",
			I => "00001000",
			IG => "11110000",
			inL => 8,
			IPa => 5,
			IPbtl => 8,
			IPbtr => 6,
			IPrdy2rcv => 3,
			IPs => 4,
			IPsend => 3,
			IPver => 0,
			J => "00001001",
			K => "00001010",
			L => "00001011",
			M => "00001100",
			N => "00001101",
			NRA => "11111001",
			NRB => "11111000",
			NRC => "11110111",
			NRD => "11110110",
			O => "00001110",
			outL => 8,
			P => "00001111",
			Q => "00010000",
			queen => "100",
			R => "00010001",
			S => "00010010",
			SE => "11111101",
			SN => "11111100",
			SRA => "11110100",
			SRB => "11110011",
			SRC => "11110010",
			SRD => "11110001",
			SS => "11111011",
			START => "00110011",
			SW => "11111110",
			T => "00010011",
			tunnel => "111",
			U => "00010100",
			V => "00010101",
			W => "00010110",
			wall => "101",
			X => "00010111",
			Y => "00011000",
			Z => "00011001"
			)
PORT MAP(clk => clk,
		 en => en,
		 set => en,
		 inSouth => SYNTHESIZED_WIRE_9,
		 SetIn => SYNTHESIZED_WIRE_10,
		 dispOut => SYNTHESIZED_WIRE_2);


END bdf_type;