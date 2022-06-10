module chipset
(
	input logic [35:0] a,
	output logic en_ram, en_color,
	output logic [31:0] readSelect
);
	
	always_comb
		if (a < 36'h0ffff) begin
			en_ram <= 1;
			en_color <= 0;
		end else if (a < 36'h10001) begin
			en_ram <= 0;
			en_color <= 1;
		end else begin
			en_ram <= 0;
			en_color <= 0;
		end
			
		
endmodule