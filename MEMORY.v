module MEMORY( 			//4*8 regisiters
						input CLK,
						input wire[2:0]P,			//PHASE INPUT;
						input wire[7:0]meme1,			//input memory
						input wire[7:0]meme2,
						input wire[7:0]meme3,
						input wire[7:0]meme4,			//end of input memory
						output wire[3:0] INSTR,			//output reg to CU
						output wire[3:0] DATA);			//output reg to INTERNAL BUS
		
	
	
reg[7:0]MEMORY1;			//memory
reg[7:0]MEMORY2;
reg[7:0]MEMORY3;
reg[7:0]MEMORY4;			//end of memoy
reg[3:0]MEINSTR;
reg[3:0]MEDATA;
reg[1:0]COUNTER;			//counter reg
	
	
	
initial			//initalizting memory to inputs
begin
	MEMORY1<=meme1;
	MEMORY2<=meme2;
	MEMORY3<=meme3;
	MEMORY4<=meme4;
end
	
	
	
initial			//memory counter
begin
	COUNTER=-1;
end
always @(negedge CLK)			//counter code
begin 
	if (P==2'b11)
	begin
		COUNTER <= COUNTER + 1;
	end
end
	
	
	
always @(posedge CLK && (P==2'b00))			//sending instruction to CU
begin
	case(COUNTER)
		2'b00:MEINSTR[3:0]<=MEMORY1[3:0];
		2'b01:MEINSTR[3:0]<=MEMORY2[3:0];
		2'b10:MEINSTR[3:0]<=MEMORY3[3:0];
		2'b11:MEINSTR[3:0]<=MEMORY4[3:0];
	default:;
	endcase
end
	
always @(posedge CLK &&(P==2'b01))			//sending data to internal bus
begin
	case(COUNTER)
			2'b00:MEDATA[3:0]<=MEMORY1[7:4];
			2'b01:MEDATA[3:0]<=MEMORY2[7:4];
			2'b10:MEDATA[3:0]<=MEMORY3[7:4];
			2'b11:MEDATA[3:0]<=MEMORY4[7:4];
	default:;
	endcase
end
	
	
assign DATA=MEDATA;			//assiginin outputs
assign INSTR=MEINSTR;	
endmodule
