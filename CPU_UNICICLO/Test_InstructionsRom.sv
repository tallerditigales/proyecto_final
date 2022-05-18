
`timescale 1 ps / 1 ps

// vsim -L altera_mf_ver -L lpm_ver Test_InstructionsRom

module Test_InstructionsRom();

	logic clk, rst;
	logic [31:0] q;
	
	Top_InstructionsRom memoria (clk,rst,q);
	
	initial begin
	
		rst=1; #10; rst=0;
		clk=0; 
	
	end
	
	always begin
	
		clk=~clk; #5;
	
	end
	
	
endmodule