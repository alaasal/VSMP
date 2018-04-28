module ALU(
			input CLK,
			input ADDSUB,
			input wire[3:0]ALUA,
			input wire[3:0]ALUB,
			output wire[3:0]ALUOUT);
			
assign ALUOUT=(ADDSUB==0)?ALUA+ALUB:ALUA-ALUB;

endmodule
