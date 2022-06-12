package constants;
	parameter BLUE = 24'h0096FF;
	parameter WHITE = 24'hFFFFFF;
	parameter ORANGE = 24'hFD8000;
	parameter YELLOW = 24'hD1F523;
	parameter DARK = 24'h000000;
	parameter GREEN = 24'h228B22;
endpackage

module vga(
	input clk_fpga,
	output clk_out,
	output hsync_out,
	output vsync_out,
	output [7:0] o_red,
	output [7:0] o_blue,
	output [7:0] o_green,
	input [31:0] tex [2239:0]
);
	import constants::*;
	
	logic inDisplayArea;
	logic [9:0] CounterX;
	logic [9:0] CounterY;
	logic clk_25;
	
	logic [7:0] r_red;
	logic [7:0] r_green;
	logic [7:0] r_blue;
	logic res;
	logic [15:0] colors;
	 
	clockDivider clk_div(
		.clk_in(clk_fpga),
		.clk_out(clk_25)
	);

	hvsync_generator hvsync(
		.clk(clk_25),
		.vga_h_sync(hsync_out),
		.vga_v_sync(vsync_out),
		.CounterX(CounterX),
		.CounterY(CounterY),
		.inDisplayArea(inDisplayArea)
	);
				
	painter t1(
		.clk(clk_25),
		.horzCoord(CounterX), // current position.x
		.vertCoord(CounterY), // current position.y
		.pixel(res),  // result, 1 if current pixel is on text, 0 otherwise
		.tex(tex),
		.colors(colors)
		);


always_ff @(posedge clk_25)
	begin
		if (res)
			{r_red, r_green, r_blue} <= colors;
		else
			{r_red, r_green, r_blue} <= BLUE;
	end

	assign o_red = inDisplayArea ? r_red : DARK;
	assign o_green = inDisplayArea ? r_green : DARK;
	assign o_blue = inDisplayArea ? r_blue : DARK;
	assign clk_out = clk_25;

endmodule