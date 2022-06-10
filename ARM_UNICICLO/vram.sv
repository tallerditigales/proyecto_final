module vram
(
	input logic clk, we,
	input logic [13:0] a,
	input logic [31:0] wd,
	output [31:0] tex_o [2399:0]
);
	logic [31:0] tex [2399:0];

	assign tex_o = tex;

	always_ff @(posedge clk)
		if (we) tex[a[13:2]] <= wd;

endmodule