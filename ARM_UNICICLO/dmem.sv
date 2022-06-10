module dmem
(
	input logic clk, we,
	input logic [31:0] a, wd,
	output logic [31:0] rd
);
	
	//initial
	//	$readmemh("datamem2.dat",RAM);
	
	logic [7:0] RAM[127:0];
	assign rd = RAM[a[31:2]]; // word aligned
	
	always_ff @(posedge clk)
		if (we) RAM[a[31:2]] <= wd[7:0];

endmodule