import arm_const::*;
module VRAM
(
	input logic clk, we,
	input logic [13:0] a,
	input logic [31:0] wd,
	output [31:0] tex_o [VGA_SCREEN_SIZE-1:0]
);
	logic [31:0] tex [VGA_SCREEN_SIZE-1:0];

	assign tex_o = tex;

	always_ff @(posedge clk)
		if (we) begin 
			tex[a[13:2]] <= wd;
			
			$display("\n\n-----Write cycle---(vram)--");
			$display("Address:---------- %h", a);
			$display("Write data:------- %h", wd);
			$display("ASCII:------------ %c", wd[7:0]);
			$display("COLOR RGB:-------- #%h", a[31:8]);
		end
endmodule