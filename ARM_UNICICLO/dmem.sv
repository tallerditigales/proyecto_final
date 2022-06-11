module dmem
(
	input logic clk, we,
	input logic [31:0] a, wd,
	output logic [31:0] rd
);
	
	initial $readmemh("data_mem_init.dat",RAM);
	
	logic [31:0] RAM[4095:0]; // 	512   	=>		0 hasta 2047 (dec)
									 //				=>		000 hasta 7ff (hex)
	
	always_ff @(posedge clk)
		if (we) RAM[a[31:0]] <= wd;
		else rd <= RAM[a[31:0]];
endmodule
