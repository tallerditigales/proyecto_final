module TopRom (input clk, input rst, output [7:0] q);

	logic [7:0] address;
	
	Counter contador (clk,rst,1'b1,address);
	
	DataROM memoria (address,clk,q);
	


endmodule  