module CPU_SINGLE_CYLCLE 
(

	input clk,
	input rst,
	input [31:0] instruction
	


);


	mux_2to1 mux0 (pcPlus4, Result, PC_SRC, pc);
	
	// no es que le entra un pc ?
	// para cuando el branch entra, seguir desde el branch
	Instructions_Counter pc_unit (clk, rst, en, PCPlus4);
	
	InstructionROM memory_unit (pc, instr);
	
	split split_unit (instr, cond, opcode, i, cmd, s, rn, rd, rm, imm);

	Control_Unit control_unit (cond, opcode, i, s, rd, flags, PC_SRC, REG_SRC, REG_WR, IMM_SRC, ALU_SRC, MEMD_WR, MEMTOREG);
	ALU_control ALUControl (cmd, en, alu_funct);

	mux_2to1 mux1 (rn, r15, REG_SRC, Ra1);
	mux_2to1 mux2 (rm, rd, REG_SRC, Ra2);
	
	RegisterFile register_unit (clk, rst, REG_WR, Ra1, Ra2, rd, Result, PCPlus8, Rd1, Rd2);

	mux_2to1 mux3 (rm, rd, ALU_SRC, SrcB);
	

	mux_2to1 mux4 (ALUResult, ReadData, MEMTOREG, Result);

endmodule