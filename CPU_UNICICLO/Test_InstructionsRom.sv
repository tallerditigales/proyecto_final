
`timescale 1 ps / 1 ps

// vsim -L altera_mf_ver -L lpm_ver Test_InstructionsRom

module Test_InstructionsRom();

	logic [31:0] pc;
	logic [31:0] q;
	
	InstructionROM memoria (pc,q);
	
	initial begin
	
		pc=0;

	end
	
	always begin
		#5;
		$displayh (q); 
		pc=pc+4;
	
	end
	
	
endmodule