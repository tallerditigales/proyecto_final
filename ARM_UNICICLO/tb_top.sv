module testbench();
	logic clk;
	logic reset;
	logic start;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	logic [31:0] RAM[63:0];
	logic [31:0] registers[14:0];
	logic ByteMem;	
	
	// instantiate device to be tested
	top dut(clk, reset, start, WriteData, DataAdr, MemWrite, ByteMem, RAM,registers);
	
	// initialize test
	initial begin
		reset <= 1; # 22; reset <= 0;
		start <= 0; # 5000; start <= 1;
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
		if(MemWrite) begin
			if(DataAdr === 200 & WriteData === 5) begin
				$display("Simulation succeeded");
				//$stop;
			end
			//end else if (DataAdr !== 96) begin
			//	$display("Simulation failed");
			//	$stop;
			//end
		end
	end
		
endmodule