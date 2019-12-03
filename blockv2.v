module blockV2(clk, en, set, SetIn, inNorth, inSouth,inEast,inWest,outNorth,outSouth,outEast,outWest,dispOut,outState);
//these parameters set how many bits the insputs and outputs are
parameter inL=8;
parameter outL=8;

//this outputs the current state for testing
output reg [7:0] outState;

input clk;
input en;
input set;//used in initializing game matrix if set==1 then sets all vars to SetIn encluding blocktype ant sugar etc.
input [inL:0]SetIn;
input [inL:0]inNorth;
input [inL:0]inSouth;
input [inL:0]inEast;
input [inL:0]inWest;

integer totalants;//this counts the total number of ants its only used for the queen if there are not ants generate one.

output reg [4:0]dispOut;//outputs the block type, and if there is an ant or sugar. this is interpreted by a display encoder
output reg [outL:0]outNorth;
output reg [outL:0]outSouth;
output reg [outL:0]outEast;
output reg [outL:0]outWest;

//these registers are used so that i dont have to type in inNorth[x:y] every time i need a blocktpye or to know if it has an ant etc.
reg [2:0]inNorthBlocktype;
reg [2:0]inSouthBlocktype;
reg [2:0]inEastBlocktype;
reg [2:0]inWestBlocktype;
reg antNorth;
reg antSouth;
reg antEast;
reg antWest;
reg sugarNorth;
reg sugarSouth;
reg sugarEast;
reg sugarWest;

//these outputs tell the corrisponding block that the current block is trying to send or is ready to send an ant.

reg outNorthVerify;
reg outSouthVerify;
reg outEastVerify;
reg outWestVerify;
//block type parameters
parameter empty=3'd0, air=3'd1, dirt=3'd2, ground=3'd3, queen=3'd4, wall=3'd5, errorblock=3'd6, tunnel=3'd7;

//these are the states. dont freak out, i wrote C code to type it for me.
parameter 
START=8'd51, A=8'd0, B=8'd1, C=8'd2, D=8'd3, E=8'd4, F=8'd5, G=8'd6, H=8'd7, I=8'd8, J=8'd9, 
K=8'd10, L=8'd11, M=8'd12, N=8'd13, O=8'd14, P=8'd15, Q=8'd16, R=8'd17, S=8'd18, T=8'd19, 
U=8'd20, V=8'd21, W=8'd22, X=8'd23, Y=8'd24, Z=8'd25, AA=8'd26, AB=8'd27, AC=8'd28, AD=8'd29, 
AE=8'd30, AF=8'd31, AG=8'd32, AH=8'd33, AI=8'd34, AJ=8'd35, AK=8'd36, AL=8'd37, AM=8'd38, AN=8'd39, 
AO=8'd40, AP=8'd41, AQ=8'd42, AR=8'd43, AS=8'd44, AT=8'd45, AU=8'd46, AV=8'd47, AW=8'd48, AX=8'd49, 
AY=8'd50, AZ=8'd51, BA=8'd52, BB=8'd53, BC=8'd54, BD=8'd55, BE=8'd56, BF=8'd57, BG=8'd58, BH=8'd59, 
//BI=8'd60, BJ=8'd61, BK=8'd62, BL=8'd63, BM=8'd64, BN=8'd65, BO=8'd66, BP=8'd67, BQ=8'd68, BR=8'd69, 
//BS=8'd70, BT=8'd71, BU=8'd72, BV=8'd73, BW=8'd74, BX=8'd75, BY=8'd76, CA=8'd78, CB=8'd79, 
//CC=8'd80, CD=8'd81, CE=8'd82, CF=8'd83, CG=8'd84, CH=8'd85, CI=8'd86, CJ=8'd87, CK=8'd88, CL=8'd89, 
//CM=8'd90, CN=8'd91, CO=8'd92, CP=8'd93, CQ=8'd94, CR=8'd95, CT=8'd97, CU=8'd98, CV=8'd99, 
CW=8'd100, CX=8'd101, CY=8'd102, DA=8'd104, DB=8'd105, DC=8'd106, DD=8'd107, DE=8'd108, DF=8'd109, 
DG=8'd110, DH=8'd111, DI=8'd112, DJ=8'd113, DK=8'd114, DL=8'd115, DM=8'd116, DN=8'd117, DO=8'd118, DP=8'd119, 
//DQ=8'd120, DR=8'd121, DS=8'd122, DT=8'd123, DU=8'd124, DV=8'd125, DW=8'd126, DX=8'd127, DY=8'd128,
//EA=8'd130, EB=8'd131, EC=8'd132, ED=8'd133, EE=8'd134, EF=8'd135, EG=8'd136, EH=8'd137, EI=8'd138, EJ=8'd139, 
//EK=8'd140, EL=8'd141, EM=8'd142, EN=8'd143, EO=8'd144, EP=8'd145, EQ=8'd146, ER=8'd147, ES=8'd148, ET=8'd149, 
FREE=8'd150, SEA=8'd151, SEB=8'd152, SEC=8'd153, SED=8'd154, SEE=8'd156, SEF=8'd157, SEG=8'd158, FD=8'd159, 
FREE2=8'd160, SWA=8'd161, SWB=8'd162, SWC=8'd163, SWD=8'd164, SWE=8'd165, SWF=8'd166, SWG=8'd167, FM=8'd168, FN=8'd169, 
SNG=8'd170, SSE=8'd171, RWA=8'd172, WAIT=8'd173, WAIT2=8'd174, WAIT3=8'd175, WAIT4=8'd176, FV=8'd177, FW=8'd178, FX=8'd179, 
FY=8'd180, GA=8'd182, GB=8'd183, GC=8'd184, GD=8'd185, GE=8'd186, GF=8'd187, GG=8'd188, GH=8'd189, 
GI=8'd190, GJ=8'd191, GK=8'd192, GL=8'd193, GM=8'd194, GN=8'd195, GO=8'd196, GP=8'd197, GQ=8'd198, GR=8'd199, 
GS=8'd200, GT=8'd201, GU=8'd202, GV=8'd203, GW=8'd204, GX=8'd205, GY=8'd206, HA=8'd208, HB=8'd209, 
SSC=8'd210, SSD=8'd211, SSF=8'd212, SSG=8'd213, HG=8'd214, HH=8'd215, HI=8'd216, HJ=8'd217, HK=8'd218, HL=8'd219, 
RA=8'd220, RB=8'd221, RN=8'd222, RNA=8'd223, RS=8'd224, RSA=8'd225, RE=8'd226, REA=8'd227, RW=8'd228, HV=8'd229, 
SSA=8'd230, SSB=8'd231, SNA=8'd232, SNB=8'd234, SNC=8'd235, SND=8'd236, SNE=8'd237, SNF=8'd238, IF=8'd239, 
IG=8'd240, SRD=8'd241, SRC=8'd242, SRB=8'd243, SRA=8'd244, GSA=8'd245, NRD=8'd246, NRC=8'd247, NRB=8'd248, NRA=8'd249, 
GNA=8'd250, SS=8'd251, SN=8'd252, SE=8'd253, SW=8'd254, ERROR=8'd255;

//Current State and Next State
reg [7:0]CS;
reg [7:0]NS;

//stores ant and sugar 1 means there is ant or sugar in the current block, 0 means there is not
reg ant;
reg sugar;
reg [2:0] blocktype;
//reg [7:0]LRofQ;
//reg [7:0]UDofQ;

//these will be used as counters to find how far away from the queen you are so you can get back. they will be 2 bits comp
reg leftOfQ;
reg rightOfQ;
reg upOfQ;
reg downOfQ;

//when this is set to 1, that means there is no ant in the current block, and it is ready to recieve an ant.
reg sendingNorth; 
reg sendingSouth;
reg sendingEast;
reg sendingWest;

reg receivingNorth; 
reg receivingSouth;
reg receivingEast;
reg receivingWest;

reg Northsending; 
reg Southsending;
reg Eastsending;
reg Westsending;

reg Northreceiving; 
reg Southreceiving;
reg Eastreceiving;
reg Westreceiving;
initial begin
	//srNorth=1'b0; 
	//srSouth=1'b0;
	//srEast=1'b0;
	//srWest=1'b0;
	leftOfQ=1'b0;
	rightOfQ=1'b0;
	upOfQ=1'b0;
	downOfQ=1'b0;
	

	
	totalants=0;
	ant=1'b0;
	sugar=1'b0;
	blocktype=errorblock;
	NS=3'd0;

	sendingNorth=1'b0; 
	sendingSouth=1'b0;
	sendingEast=1'b0;
	sendingWest=1'b0;

	receivingNorth=1'b0;
	receivingSouth=1'b0;
	receivingEast=1'b0;
	receivingWest=1'b0;

	Northsending=1'b0;
	Southsending=1'b0;
	Eastsending=1'b0;
	Westsending=1'b0;

	Northreceiving=1'b0;
	Southreceiving=1'b0;
	Eastreceiving=1'b0;
	Westreceiving=1'b0;
end
always@(*)begin
	CS<=NS;
end
//these define which bits of the inputs and outputs corrispond to block type, sugar, ant, sending receiving etc.
parameter IPbtl=8,IPbtr=6,IPa=5,IPs=4,IPver=2,IPsend=0,IPrec=1;//IPSEND=0 IPREC=1 OR ELSE IT WONT WORK
			//ip block type left, ip block type right, ip ant, ip sugar, ip verify, ip send, ip receive
			
//this block sets insputs. ignore it
always@(posedge clk)begin
	inNorthBlocktype <= inNorth[IPbtl:IPbtr];
	inSouthBlocktype <= inSouth[IPbtl:IPbtr];
	inEastBlocktype <=   inEast[IPbtl:IPbtr];
	inWestBlocktype <=   inWest[IPbtl:IPbtr];
	
	antNorth<=inNorth[IPa];
	antSouth<=inSouth[IPa];
	antEast<=  inEast[IPa];
	antWest<=  inWest[IPa];
	
	sugarNorth<=inNorth[IPs];
	sugarSouth<=inSouth[IPs];
	sugarEast<=  inEast[IPs];
	sugarWest<=  inWest[IPs];
	
	Northsending<=inNorth[IPsend];
	Southsending<=inSouth[IPsend];
	Eastsending<=inEast[IPsend];
	Westsending<=inWest[IPsend];

	Northreceiving<=inNorth[IPrec];
	Southreceiving<=inSouth[IPrec];
	Eastreceiving<=inEast[IPrec];
	Westreceiving<=inWest[IPrec];
	
	outState<=CS;
	
	
end

//this sets outputs, ignore it
always@(posedge clk)begin
	outNorth[IPbtl:IPbtr]<=blocktype;
	outSouth[IPbtl:IPbtr]<=blocktype;
	 outEast[IPbtl:IPbtr]<=blocktype;
	 outWest[IPbtl:IPbtr]<=blocktype;
	
	outNorth[IPa]<=ant;
	outSouth[IPa]<=ant;
	 outEast[IPa]<=ant;
	 outWest[IPa]<=ant;
	
	outNorth[IPs]<=sugar;
	outSouth[IPs]<=sugar;
	 outEast[IPs]<=sugar;
	 outWest[IPs]<=sugar;
	 
	 outNorth[IPsend]<=sendingNorth;
	 outSouth[IPsend]<=sendingSouth;
	 outEast[IPsend]<=sendingEast;
	 outWest[IPsend]<=sendingWest;
	 
	 outNorth[IPrec]<=receivingNorth;
	 outSouth[IPrec]<=receivingSouth;
	 outEast[IPrec]<=receivingEast;
	 outWest[IPrec]<=receivingWest;
	 	 
	 outNorth[IPver]=outNorthVerify;
	 outSouth[IPver]=outSouthVerify;
	 outEast[IPver]=outEastVerify;
	 outWest[IPver]=outWestVerify;
end
//output display info
always@(*)begin
	dispOut[2:0]=blocktype;
	dispOut[3]=ant;
	dispOut[4]=sugar;
end


always@(posedge clk) begin

		case({CS})
			START:
				begin
					if(set==1'b1) begin
						NS<=A;
					end else begin
						NS<=START;
					end
				end
			A:
				begin
					//set vars;
					blocktype=SetIn[IPbtl:IPbtr];
					ant=SetIn[IPa];
					sugar=SetIn[IPs];
					NS<=B;
				end
			B://this becomes the new start pretty much, once the game is initialized.
				begin
					if(en==1'b1) begin
						NS<=C;
					end else begin
						NS<=B;
					end
				end
			C:
				begin
					if(ant==1'b1) begin
						NS<=H;//should be H
					end else begin
						NS<=D;
					end
				end
			D:
				begin
					if(blocktype==queen) begin
						NS<=E;
					end else begin
						NS<=G;
					end
				end
			E:
				begin
					if(totalants<1) begin
						NS<=F;
					end else begin
						NS<=B;
					end
				end
			F://unfinished
				begin
					//generate ant south
					NS<=B;
				end
			G:
				begin
					NS<=RA;
				end
			H:
				begin
					if(blocktype==queen) begin
						NS<=I;
					end else begin
						NS<=L;
					end
				end
			I:
				begin
					if(sugar==1'b1) begin
						NS<=J;
					end else begin
						NS<=K;
					end
				end
			J:
				if(antSouth==1'b1)begin
						NS<=J;
					end else begin
						NS<=F;
				end
			K:
				begin
					if(antSouth==1'b1)begin
						NS<=K;
					end else begin
						NS<=GS;
					end
				end
			L:
				begin
					if(sugar==1'b1) begin
						NS<=AG;
					end else begin
						NS<=M;
					end
				end
			M:
				begin
					if(blocktype==tunnel)begin
						NS<=U;
					end else begin
						NS<=N;
					end
				end
			N:
				begin
					if (blocktype==air) begin
						NS<=O;
					end else begin
						NS<=ERROR;
					end
				end
			O:
				begin
					if(leftOfQ==1'b1)begin
						NS<=Q;
					end else begin
						NS<=S;
					end
				end
			//NO STATE P
			Q:
				begin
					if(antEast==1'b1)begin
						NS<=R;
					end else begin
						NS<=GW;
					end
				end
			R://unifinished
				begin
					NS<=B;
				end
			S://unfinished
				begin
					NS<=B;
				end
			T://unfinished
				begin
					NS<=B;
				end
			U:
				begin
					if(inNorthBlocktype==tunnel)begin
						NS<=V;
					end else begin
						NS<=W;
					end
				end
			V:
				begin
					if(antNorth==1'b1) begin
						NS<=AC;
					end else begin
						NS<=GN;
					end
				end
			W:
				begin
					if(inNorthBlocktype==air) begin
						NS<=AD;
					end else begin
						NS<=X;
					end
				end
			X:
				begin
					if(inNorthBlocktype==queen)begin
						NS<=AC;
					end else begin
						NS<=Y;
					end
				end
			Y:
				begin
					if(inWestBlocktype==tunnel)begin
						NS<=AB;
					end else begin
						NS<=Z;
					end
				end
			Z:
				begin
					if(inNorthBlocktype==wall)begin
						NS<=DN;
					end else begin
						NS<=AA;
					end
				end
			AA:
				begin
					if(inNorthBlocktype==ground)begin
						NS<=DN;
					end else begin
						NS<=ERROR;
					end
				end
			AB:
				begin
					if(antWest==1'b1) begin
						NS<=Z;
					end else begin
						NS<=GW;
					end
				end
			AC:
				begin
					if(inEastBlocktype==tunnel)begin
						NS<=AE;
					end else begin
						NS<=AF;
					end
				end
			AD:
				begin
					if(antNorth==1'b1) begin
						NS<=AC;
					end else begin
						NS<=GN;
					end
				end
			AE:
				begin
					if(antEast==1'b1) begin
						NS<=B;
					end else begin
						NS<=GE;
					end
				end
			AF:
				begin
					if(inEastBlocktype==wall)begin
						NS<=DE;
					end else begin
						NS<=ERROR;
					end
				end  
			AG:
				begin
					if(blocktype==tunnel)begin
						NS<=AH;
					end else begin
						NS<=AJ;
					end
				end
			AH:
				begin
					if(inSouthBlocktype==tunnel)begin
						NS<=AI;
					end else begin
						NS<=AJ;
					end
				end
			AI:
				begin
					if(antSouth==1'b1)begin
						NS<=AI;//maybe this should be B or check for sugar and swap
					end else begin
						NS<=GS;
					end
				end
			AJ:
				begin
					if(inSouthBlocktype==queen)begin
						NS<=AI;
					end else begin
						NS<=ERROR;
					end
				end
			AK:
				begin
					if(blocktype==air)begin
						NS<=AL;
					end else begin
						NS<=ERROR;
					end
				end
			AL:
				begin
					if(inSouthBlocktype==tunnel)begin
						NS<=AS;
					end else begin
						NS<=AM;
					end
				end
			AM:
				begin
					if(leftOfQ==1'b1)begin
						NS<=AN;
					end else begin
						NS<=AO;
					end
				end
			AN:
				begin
					if(antEast==1'b1)begin
						NS<=GE;//maybe this should be B or check for sugar and swap
					end else begin
						NS<=AR;
					end
				end
			AO:
				begin
					if(rightOfQ==1'b1)begin
						NS<=AP;
					end else begin
						NS<=ERROR;
					end
				end
			AP:
				begin
					if(antWest==1'b1)begin
						NS<=AQ;//maybe this should be B or check for sugar and swap
					end else begin
						NS<=GL;
					end
				end
			AQ:
				begin
					if((sugarWest==1'b1)&&(antWest==1'b1))begin
						NS<=B;
					end else begin
						NS<=SW;
					end
				end
			AR:
				begin
					if((sugarEast==1'b1)&&(antEast==1'b1))begin
						NS<=B;
					end else begin
						NS<=SE;
					end
				end
			AS:
				begin
					if(antSouth==1'b1)begin
						NS<=AT;
					end else begin
						NS<=GS;
					end
				end
			AT:
				begin
					if((sugarSouth==1'b1)&&(antSouth==1'b1))begin
						NS<=B;
					end else begin
						NS<=SS;//SHOULD BE SS
					end
				end
			DN:
				begin
					NS<=GN;
				end
			/////////////
			//receiving//
			/////////////
			
			RA:
				begin
					outNorthVerify<=1'b0;
					outSouthVerify<=1'b0;
					outEastVerify<=1'b0;
					outWestVerify<=1'b0;
					NS<=RB;
				end
			RB:
				begin	/////////////////////////////////////////////////////////////////////////////////////////////
						//WARNING: BROADCASTING IN ALL DIRECTIONS MAY BE CAUSING ANTS TO BE "EATEN" BY BLOCKS		 //
						/////////////////////////////////////////////////////////////////////////////////////////////
						receivingNorth<=1'b1; 
						receivingSouth<=1'b1;
						receivingEast<=1'b1;
						receivingWest<=1'b1;
					NS<=RN;//SHOULD BE RN
				end
				//north
			RN:
				begin
					//srWest<=1'b0; 
					//srNorth<=1'b1;
					if(Northsending==1'b1)begin
						NS<=RNA;
					end else begin
						NS<=RS;
					end
				end
			RNA:
				begin
					ant<=antNorth;//should be antNorth
					////////////////////////////////////////////////////////////
					//WARNING: ADD CONDITIONAL IF STATEMENT LIKE IN STATE RSA //
					////////////////////////////////////////////////////////////
					if(sugar!==1'b1)begin
						sugar<=sugarNorth;//ADD CONDITIONAL IF STATEMENT LIKE IN STATE RSA 
					end
						receivingNorth<=1'b0; 
						receivingSouth<=1'b0;
						receivingEast<=1'b0;
						receivingWest<=1'b0;
					outNorthVerify<=1'b1;
					NS<=B;//SHOULD BE B
				end
				//south
			RS:
				begin
					//srNorth<=1'b0; 
					//srSouth<=1'b1; 
					if(inSouth[IPsend]==1'b1)begin//should be south sending
						NS<=RSA;
					end else begin						
						NS<=RE;//SHOULD BE RE
					end
				end
			RSA:
				begin
					ant<=antSouth;
					if(sugar!==1'b1)begin//ADD THIS TO ALL RECEIVE
						sugar<=sugarSouth;
					end
					if((blocktype==ground)||(blocktype==wall))begin
						blocktype<=tunnel;
					end
						receivingNorth<=1'b0; 
						receivingSouth<=1'b0;
						receivingEast<=1'b0;
						receivingWest<=1'b0;
					outSouthVerify<=1'b1;
					NS<=B;//SHOULD BE B
				end
				//east
			RE:
				begin
					//srSouth<=1'b0; 
					//srEast<=1'b1; 
					if(Eastsending==1'b1)begin
						NS<=REA;
					end else begin
						NS<=RW;
					end
				end
			REA:
				begin
					ant<=antEast;
					sugar<=sugarEast;
						receivingNorth<=1'b0; 
						receivingSouth<=1'b0;
						receivingEast<=1'b0;
						receivingWest<=1'b0;
					outEastVerify<=1'b1;
					NS<=B;//SHOULD BE B
				end
				//west
			RW:
				begin
					//srEast<=1'b0; 
					//srWest<=1'b1; 
					if(Westsending==1'b1)begin
						NS<=RWA;
					end else begin
						NS<=RN;
					end
				end
			RWA:
				begin
					ant<=antWest;
					sugar<=sugarWest;
						receivingNorth<=1'b0; 
						receivingSouth<=1'b0;
						receivingEast<=1'b0;
						receivingWest<=1'b0;
					outWestVerify<=1'b1;
					NS<=B;//SHOULD BE B
				end
			///////////
			//Sending//
			///////////
			
			//north
			GN:NS<=SN;
			SN:
				begin
					if(Northreceiving==1'b1)begin//SHOULD BE inNorthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SNA;
					end else if(antNorth==1'b1) begin
						NS<=B;
					end else begin
						NS<=SN;
					end
				end
			SNA:
				begin
					sendingNorth<=1'b1;
					NS<=SNB;
				end
			SNB:
				begin
					if(inNorth[IPver]==1'b1)begin
						NS<=SNC;
					end else begin
						NS<=SNE;
					end
				end
			SNC:
				begin
					ant<=1'b0;
					sugar<=1'b0;
					sendingNorth<=1'b0;
					NS<=B;//SHOULD BE B
				end
			SND:
				begin
					if(antNorth==1'b1) begin
						NS<=B;//SHOULD BE B
					end else begin
						NS<=SN;
					end
				end
			SNE:
				begin
					if(Northreceiving==1'b1)begin//SHOULD BE inNorthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SNB;
					end else begin
						NS<=SNF;
					end
				end
			SNF:
				begin
					if(inNorth[IPver]==1'b1)begin
						NS<=SNC;
					end else begin
						NS<=SNG;
					end
				end
			SNG:
				begin
					sendingNorth<=1'b0;
					NS<=B;//SHOULD BE B
				end
			//south
			GS:NS<=SS;
			SS:
			begin
					if(Southreceiving==1'b1)begin//SHOULD BE inNorthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SSA;
					end else if(antSouth==1'b1) begin
						NS<=B;//SHOULD BE B
					end else begin
						NS<=SS;
					end
			end
			SSA:
				begin
					sendingSouth<=1'b1;
					NS<=SSB;
				end
			SSB:
				begin
					if(inSouth[IPver]==1'b1)begin
						NS<=SSC;
					end else begin
						NS<=SSE;
					end
				end
			SSC:
				begin
					ant<=1'b0;
					sugar<=1'b0;
					sendingSouth<=1'b0;
					NS<=B;//SHOULD BE B
				end
			SSD:
				begin
					if(antSouth==1'b1) begin
						NS<=B;//SHOULD BE B
					end else begin
						NS<=SS;
					end
				end
			SSE:
				begin
					if(Southreceiving==1'b1)begin//SHOULD BE SouthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SSB;
					end else begin
						NS<=SSF;
					end
				end
			SSF:
				begin
					if(inSouth[IPver]==1'b1)begin
						NS<=SSC;
					end else begin
						NS<=SSG;
					end
				end
			SSG:
				begin
					sendingSouth<=1'b0;
					NS<=B;
				end
			//East
			//GE:NS<=SE;
			GE:
			begin
					if(Eastreceiving==1'b1)begin//SHOULD BE inNorthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SEA;
					end else if(antEast==1'b1) begin
						NS<=B;//SHOULD BE B
					end else begin
						NS<=GE;
					end
			end
			SEA:
				begin
					sendingEast<=1'b1;
					NS<=SEB;
				end
			SEB:
				begin
					if(inEast[IPver]==1'b1)begin
						NS<=SEC;
					end else begin
						NS<=SEE;
					end
				end
			SEC:
				begin
					ant<=1'b0;
					sugar<=1'b0;
					sendingEast<=1'b0;
					NS<=B;//SHOULD BE B
				end
			SED:
				begin
					if(antEast==1'b1) begin
						NS<=B;//SHOULD BE B
					end else begin
						NS<=GE;
					end
				end
			SEE:
				begin
					if(Eastreceiving==1'b1)begin//SHOULD BE SouthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SEB;
					end else begin
						NS<=SEF;
					end
				end
			SEF:
				begin
					if(inEast[IPver]==1'b1)begin
						NS<=SEC;
					end else begin
						NS<=SEG;
					end
				end
			SEG:
				begin
					sendingEast<=1'b0;
					NS<=B;
				end
			//west
						//East
			//GW:NS<=SW;
			GW:
			begin
					if(Westreceiving==1'b1)begin//SHOULD BE inNorthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SWA;
					end else if(antWest==1'b1) begin
						NS<=B;//SHOULD BE B
					end else begin
						NS<=GW;
					end
			end
			SWA:
				begin
					sendingWest<=1'b1;
					NS<=SWB;
				end
			SWB:
				begin
					if(inWest[IPver]==1'b1)begin
						NS<=SWC;
					end else begin
						NS<=SWE;
					end
				end
			SWC:
				begin
					ant<=1'b0;
					sugar<=1'b0;
					sendingWest<=1'b0;
					NS<=B;//SHOULD BE B
				end
			SWD:
				begin
					if(antWest==1'b1) begin
						NS<=B;//SHOULD BE B
					end else begin
						NS<=GW;
					end
				end
			SWE:
				begin
					if(Westreceiving==1'b1)begin//SHOULD BE SouthReceiving, but as of writing this, they are the same 11/30/19
						NS<=SWB;
					end else begin
						NS<=SWF;
					end
				end
			SWF:
				begin
					if(inWest[IPver]==1'b1)begin
						NS<=SWC;
					end else begin
						NS<=SWG;
					end
				end
			SEG:
				begin
					sendingWest<=1'b0;
					NS<=B;
				end
			/////////////////
			//	 SWAPPING	//
			/////////////////
			
			ERROR://unfinished
				begin
					NS<=START;
				end
			default:
				begin
					NS<=ERROR;
				end
		endcase
end
endmodule