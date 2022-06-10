module arm // Controller and Datapath
(
	input logic clk, reset, start,
	output logic [31:0] PC,
	input logic [31:0] Instr,
	output logic MemWrite, ByteMem,
	output logic [31:0] ALUResult, WriteData,
	input logic [31:0] ReadData,
	output [31:0] registers[14:0]
);

	logic [3:0] ALUFlags;
	logic RegWrite, ALUSrc, MemtoReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc;
	logic [2:0] ALUControl;
	
	controller c(clk, reset, Instr[31:12], ALUFlags,
					RegSrc, RegWrite, ImmSrc,
					ALUSrc, ALUControl,
					MemWrite, MemtoReg, ByteMem, PCSrc);
					
	datapath dp(clk, reset, start,
					RegSrc, RegWrite, ImmSrc,
					ALUSrc, ALUControl,
					MemtoReg, PCSrc,
					ALUFlags, PC, Instr,
					ALUResult, WriteData, ReadData, registers);
	
endmodule