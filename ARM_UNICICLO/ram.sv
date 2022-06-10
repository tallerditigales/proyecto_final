module ram
(
	input logic clk, we,
	input logic [13:0] a, 
	input logic [31:0] wd,
	output logic [31:0] rd
);
	
	initial $readmemh("data_mem_init.dat",RAM);
	
	logic [31:0] RAM[4095:0];
	
	always_ff @(posedge clk)
		if (we) RAM[a[13:2]] <= wd;
		else rd <= RAM[a[13:2]];

endmodule