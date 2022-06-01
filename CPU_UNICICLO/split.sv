module split(
	
	input	[31:0] instr,
	
	output [3:0] cond,
	output [1:0] opcode,
	output i,
	output [3:0] cmd,
	output s,
	output [3:0] rn,
	output [3:0] rd,
	output [3:0] rm,
	output [23:0] imm
	
);

	assign cond = instr [31:28];
	assign opcode = instr [27:26];
	assign i = instr[25];
	assign cmd = instr[24:21];
	assign s = instr[20];
	assign rn = instr[19:16];
	assign rd = instr[15:12];
	assign rm = instr[3:0];
	assign imm = instr[23:0];
	
//	split splitter (instr, cond, opcode, i, cmd, s, rn, rd, rm, imm);
	
endmodule