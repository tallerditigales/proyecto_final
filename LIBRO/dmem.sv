module dmem
(
	input logic clk, we,
	input logic [31:0] a, wd,
	output logic [31:0] rd,
	output [31:0] RAM_[63:0]
);
	logic [31:0] RAM[63:0];
	
	
	assign RAM_ = RAM;
	assign rd = RAM[a[31:2]]; // word aligned
	
	initial
		$readmemh("datamem.dat",RAM);
	
	always_ff @(posedge clk)
		if (we) RAM[a[31:2]] <= wd;

endmodule