module Control_Unit 
	(cond, opcode, i, s, rd, flags, PC_SRC, REG_SRC, REG_WR, IMM_SRC, ALU_SRC, MEMD_WR, MEMTOREG);
	
	input [1:0] opcode;
	input [3:0] cond;
	input i;
	input s;
	input [3:0] rd;
	input [3:0] flags;
	
	output PC_SRC;
	output REG_SRC;
	output REG_WR;
	output IMM_SRC;
	output ALU_SRC;
	output MEMD_WR;
	output MEMTOREG;

	
	// Asignacion
	
	// Si es branch es 1.
   assign PC_SRC 	 = (opcode == 2);

	// Si es data entonces 0.
	assign REG_SRC  = ((opcode == 0) && (i == 0)) ? 0 : 1;
	
	// Si es data o si es load entonces 1.
	assign REG_WR 	 = (opcode == 0) | (opcode == 1 && s == 1);
	
	// Si es branch entonces 1.
	assign IMM_SRC  = (opcode == 2);
	
	// Si es un inmediato en dato o memoria y tambien si es un branch entonces 1.
	assign ALU_SRC  = (opcode == 0 && i == 1) | (opcode == 1 && i == 0) | (opcode == 2);
	
	// Si es store entonces 1.
	assign MEMD_WR  = (opcode == 1 && s == 0);
	
	// Si es un load entonces 1.
	assign MEMTOREG = (opcode == 1 && s == 1);
	
	
endmodule