module top
(
	input logic clk, reset, start,
	output clk_out,
	output hsync_out,
	output vsync_out,
	output [7:0] o_red,
	output [7:0] o_blue,
	output [7:0] o_green
);
	
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	logic [31:0] PC, Instr, ReadData;
	logic [31:0] tex [2399:0];
	
	vga display(
		.clk_fpga(clk),
		.clk_out(clk_out),
		.hsync_out(hsync_out),
		.vsync_out(vsync_out),
		.o_red(o_red),
		.o_blue(o_blue),
		.o_green(o_green),
		.tex(tex)
	);
	
	// instantiate processor and memories
	arm arm(clk, reset, start, PC, Instr, MemWrite, DataAdr,
				WriteData, ReadData);
	
	imem imem(PC, Instr);
	
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData, tex);
	
endmodule