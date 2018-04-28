module VSMP(
				input CLK,
				input wire[7:0]meme1,
				input wire[7:0]meme2,
				input wire[7:0]meme3,
				input wire[7:0]meme4,
				input INPUT1,
				output wire[3:0]RESULT1_INSTR,
				output wire[3:0]RESULT2_DATA,
				output wire[3:0]RESULT3_PHASE,
				output RESULLT4_ENABLEALU,
				output RESULT5_ENABLEINSTR,
				output RESULT6_LOADA,
				output RESULT7_LOADB,
				output RESULT8_ADDSUB,
				output wire[3:0]RESULT10_ACCA,
				output wire[3:0]RESULT11_ACCB,
				output wire[3:0]RESULT_ALUOUT);


	
MEMORY VSMP_MEMORY(.CLK(CLK),
						.P(RESULT3_PHASE),			
						.meme1(meme1),			
						.meme2(meme2),
						.meme3(meme3),
						.meme4(meme4),			
						.INSTR(RESULT1_INSTR),			
						.DATA(RESULT2_DATA));	
				
		

CU VSMP_CU(
			.CLK(CLK),
			.INSTR(RESULT1_INSTR),
			.IN(),			
			.OUT(),
			.PHASE(RESULT3_PHASE),
			.LOADA(RESULT6_LOADA),
			.LOADB(RESULT7_LOADB),
			.ENABLEALU(RESULLT4_ENABLEALU),
			.ENABLEINSTR(RESULT5_ENABLEINSTR),
			.ADDSUB(RESULT8_ADDSUB));		

			
INTERNALBUS VSMP_INTERNALBUS(
						.CLK(CLK),
						.LOADA(RESULT6_LOADA),
						.LOADB(RESULT7_LOADB),
						.ENABLEALU(RESULLT4_ENABLEALU),
						.ENABLEINSTR(RESULT5_ENABLEINSTR),
						.DATA(RESULT2_DATA),
						.ALUOUT(RESULT_ALUOUT),
						.ACCA(RESULT10_ACCA),
						.ACCB(RESULT11_ACCB));


ALU VSMP_ALU(
			.CLK(CLK),
			.ADDSUB(RESULT8_ADDSUB),
			.ALUA(RESULT10_ACCA),
			.ALUB(RESULT11_ACCB),
			.ALUOUT(RESULT_ALUOUT));
			
			
endmodule