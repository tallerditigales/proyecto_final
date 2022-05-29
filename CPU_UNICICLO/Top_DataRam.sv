module Top_DataRam (input clk, input rst, wren, input [7:0] data, output [7:0] q);

	logic [7:0] address;
	
	Counter contador (clk,rst,1'b1,address);
	
	DataRAM memoria (address,clk,data,wren,q);
	


endmodule  