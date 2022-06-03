module top
(
	input logic clk, reset,
	output logic [31:0] WriteData, DataAdr,
	output logic MemWrite,
	output logic [31:0] RAM[63:0],
	
	//---------------
	output [31:0] registers[14:0]
);

	logic [31:0] PC, Instr, ReadData;
	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
				WriteData, ReadData, registers);
	
	imem imem(PC, Instr);
	
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData, RAM);
	
endmodule