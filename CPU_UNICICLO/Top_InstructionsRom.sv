module Top_InstructionsRom (input clk, input rst, output [31:0] q);

	logic [7:0] address;
	
	Instructions_Counter contador (clk,rst,1'b1,address);
	
	InstructionsROM memoria (address,clk,q);
	


endmodule  