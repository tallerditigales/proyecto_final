module Test_Control_Unit();


	logic [31:0] instr;

	logic [3:0] cond;
	logic [1:0] opcode;
	logic [3:0] cmd;
	logic  i;
	logic  s;
	logic [3:0] rn;
	logic [3:0] rd;	
	logic [3:0] rm;
	logic [23:0] imm;
	
	logic [3:0] flags;
	
	logic PC_SRC;
	logic REG_SRC;
	logic REG_WR;
	logic IMM_SRC;
	logic ALU_SRC;
	logic MEMD_WR;
	logic MEMTOREG;
	
	
	split splitter (instr, cond, opcode, i, cmd, s, rn, rd, rm, imm);
	Control_Unit control (cond, opcode, i, s, rd, flags, PC_SRC, REG_SRC, REG_WR, IMM_SRC, ALU_SRC, MEMD_WR, MEMTOREG);
	
	
	initial begin
		instr = 32'he2800004; #10;  // ADD		r0,r0,#4
		instr = 32'he3a00000; #10;  // MOV		r0,#0x0 
		instr = 32'he35100ff; #10;  // CMP		r1,#0xFF

		instr = 32'he5901000; #10;  // LDR		r1,[r0]
		instr = 32'he5804000; #10;  // STR		r4, [r0]

		instr = 32'heaffffdf; #10;  // B		   find_cycle
		instr = 32'h0a00003f; #10;  // BEQ		fin
		
	end
	

endmodule