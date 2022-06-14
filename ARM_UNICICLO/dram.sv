module dram
(
	input logic clk, we,
	input logic [13:0] a,
	input logic [31:0] wd,
	output logic [31:0] rd
);
	
	initial $readmemh("data_mem_init.dat",RAM);
	
	logic [31:0] RAM[255:0];
	
	always_ff @(posedge clk) begin
		if (we) begin
		
				RAM[a[13:2]] = wd;

			end
	end
	
	assign rd = RAM[a[13:2]];

endmodule