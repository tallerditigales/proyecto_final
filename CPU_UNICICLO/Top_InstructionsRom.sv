module Top_InstructionsRom (input clk, input rst, output logic [31:0] q);
	
	logic [31:0] address; // 0

	
	
	Instructions_Counter contador (clk,rst,1'b1,address);
	
	InstructionROM memoria (address,q);
	
	// 1,2,3,4
	

	
endmodule  