module testbench_chipset();
	logic [11:0] a;
	logic en_ram, en_color;
	logic [31:0] readSelect;
	

	chipset dut(a, en_ram, en_color, readSelect);
	

	initial begin
		
		a = 0; #5;
		a = 2; #5;
		a = 12'h7ff; #5;
		a = 12'h800; #5;
		a = 55; #5;
		a = 24; #5;
		a = 12'h7ff; #5;
		a = 12'h800; #5;
		
	end

		
endmodule