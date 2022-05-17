
`timescale 1 ps / 1 ps

// vsim -L altera_mf_ver -L lpm_ver Test_DataRam

module Test_DataRam();

	logic clk, rst, wren;
	logic [7:0] data;
	logic [7:0] q;
	
	Top_DataRam memoria (clk,rst,wren,data,q);
	
	initial begin
	
		rst=1; #10; rst=0;
		clk=0; 
	
	end
	
	always begin
	
		clk=~clk; #5;
	
	end
	
	
endmodule