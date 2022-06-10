module dmem
(
	input logic clk, we,
	input logic [31:0] a, wd,
	output logic [31:0] rd,
	output [31:0] tex_o [2399:0]
);

	logic ram_select;
	logic vram_select;
	logic [13:0] addr;
	
	assign addr = a[13:0];
	assign vram_select = a[14];
	assign ram_select = !a[14];

	ram cpu_ram
	(
		.clk(clk),
		.we(ram_select),
		.a(addr),
		.wd(wd),
		.rd(rd)
	);

	
	vram vram
	(
		.clk(clk),
		.we(vram_select),
		.a(addr),
		.wd(wd),
		.tex_o(tex_o)
	);
endmodule