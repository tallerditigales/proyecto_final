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
				
				$display("\n\n-----Write cycle---(dram)--");
				$display("Address:---------- %h", a);
				$display("Write data:------- %h", wd);
				$display("ASCII:------------ %c", wd[7:0]);
				$display("COLOR RGB:-------- #%h", a[31:8]);

			end
	end
	
	assign rd = RAM[a[13:2]];

endmodule