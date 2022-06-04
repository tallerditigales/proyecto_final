module dmem
(
	input logic clk, we, be,
	input logic [31:0] a, wd,
	output logic [31:0] rd,
	output [31:0] RAM_[63:0]
);
	logic [31:0] RAM[63:0];
	
	
	assign RAM_ = RAM;
	assign rd = RAM[a[31:2]]; // word aligned
	
	initial
		$readmemh("datamem2.dat",RAM);
	
	always_ff @(posedge clk)
		if (we & !be) RAM[a[31:2]] <= wd;
		else if (we & be) begin
			
			if (a[1:0] == 0) 
				RAM[a[31:2]][7:0] <= wd[7:0];
			else if (a[1:0] == 1) 
				RAM[a[31:2]][15:8] <= wd[7:0];
			else if (a[1:0] == 2) 
				RAM[a[31:2]][23:16] <= wd[7:0];
			else if (a[1:0] == 3) 
				RAM[a[31:2]][31:24] <= wd[7:0];
				
			$display("writing in dir: %d", a[31:2]);
			$display("complete dir is: %d", a);
			$display("writing the data: %d", wd[7:0]);
		end
endmodule