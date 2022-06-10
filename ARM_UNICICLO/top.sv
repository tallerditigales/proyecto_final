module top
(
	input logic clk, reset, start,
	output logic [31:0] WriteData, DataAdr,
	output logic MemWrite, ByteMem
);

	logic [31:0] PC, Instr, ReadData;
	
	// instantiate processor and memories
	arm arm(clk, reset, start, PC, Instr, MemWrite, ByteMem, DataAdr,
				WriteData, ReadData);
	
	imem imem(PC, Instr);
	
	dmem dmem(clk, MemWrite, ByteMem, DataAdr, WriteData, ReadData);
	
endmodule