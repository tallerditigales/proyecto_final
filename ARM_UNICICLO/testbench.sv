module testbench();
	logic clk;
	logic reset;
	logic start;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	logic clk_out;
	logic hsync_out;
	logic vsync_out;
	logic [7:0] o_red;
	logic [7:0] o_blue;
	logic [7:0] o_green;
	
	// instantiate device to be tested
	top dut(clk, reset, start, clk_out,hsync_out,vsync_out,o_red, o_blue, o_green);
	
	// initialize test
	initial begin
		reset <= 1; # 22; reset <= 0;
		start <= 0; # 3; start <= 1;
	end
	
	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	
	// check that 7 gets written to address 0x64	
	// at end of program
	always @(negedge clk)
	begin
		#500000;
//		if(MemWrite) begin
//			if(DataAdr === 100 & WriteData === 7) begin
//				$display("Simulation succeeded");
//				$stop;
//			end
			//end else if (DataAdr !== 96) begin
			//	$display("Simulation failed");
			//	$stop;
			//end
	end
		
endmodule