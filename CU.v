module CU(
			input CLK,
			input wire[3:0]INSTR,
			output wire[3:0]IN,			//DECIDE WHO GIVES INPUT TO THE INTERNAL BUS
			output wire[3:0]OUT,			//DECIDE WHO TAKES INPUT FROM THE INTERNAL BUS
			output wire[2:0]PHASE,
			output reg LOADA,
			output reg LOADB,
			output reg ENABLEALU,
			output reg ENABLEINSTR,
			output reg ADDSUB);

reg[3:0]IN_reg;			//internal registers to help store quantities
reg[3:0]OUT_reg;
reg[1:0]PHASE_reg;
reg[3:0]INSTR_reg;

initial			//PHASE GENERATOR
begin
PHASE_reg=-1;
LOADB=0;
LOADA=0;
ENABLEALU=0;
ENABLEINSTR=0;
ADDSUB=0;
end
always@(negedge CLK)
begin
if(PHASE_reg==0)
	begin
	INSTR_reg<=INSTR;
	end
if(PHASE_reg==2'b11)
	begin
	PHASE_reg<=0;
	end
else
	begin
	PHASE_reg<=PHASE_reg+1;
	end
end

assign PHASE=PHASE_reg;
always @(posedge CLK)
begin
if(PHASE_reg==2'b00)
begin
	LOADB<=0;
	LOADA<=0;
	ENABLEALU<=0;
	ENABLEINSTR<=0;
	ADDSUB<=0;
end
if(PHASE_reg==2'b01)
begin
	LOADB<=0;
	LOADA<=0;
	ENABLEALU<=0;
	ENABLEINSTR<=1;
	ADDSUB<=0;
end
else if(PHASE_reg==2'b10)
begin
	if(INSTR_reg==4'b0001)
	begin
	LOADB<=1;
	LOADA<=0;
	ENABLEALU<=0;
	ENABLEINSTR<=1;
	ADDSUB<=0;
	end
	else if(INSTR_reg==4'b0010)
	begin
	LOADB<=1;
	LOADA<=0;
	ENABLEALU<=0;
	ENABLEINSTR<=1;
	ADDSUB<=1;
	end
	else if(INSTR_reg==4'b0101)
	begin
	LOADB<=0;
	LOADA<=1;
	ENABLEALU<=0;
	ENABLEINSTR<=1;
	ADDSUB<=0;
	end
end
else if(PHASE_reg==2'b11)
begin
	if(INSTR_reg==4'b0001)
	begin
	LOADB<=0;
	LOADA<=1;
	ENABLEALU<=1;
	ENABLEINSTR<=0;
	ADDSUB<=0;
	end
	else if(INSTR_reg==4'b0010)
	begin
	LOADB<=0;
	LOADA<=1;
	ENABLEALU<=1;
	ENABLEINSTR<=0;
	ADDSUB<=1;
	end
end

end
endmodule

