module INTERNALBUS(
						input CLK,
						input LOADA,
						input LOADB,
						input ENABLEALU,
						input ENABLEINSTR,
						input wire[3:0]DATA,
						input wire[3:0]ALUOUT,
						output reg[3:0]ACCA,
						output reg[3:0]ACCB);
always@(negedge CLK)
begin
if(LOADA==1&&ENABLEINSTR==1)
begin
ACCA<=DATA;
end
if(LOADA==1 && ENABLEALU==1)
begin
ACCA<=ALUOUT;
end
end	

always@(posedge CLK)	
begin			
if(LOADB==1&&ENABLEINSTR==1)
begin
ACCB<=DATA;
end
end


endmodule
