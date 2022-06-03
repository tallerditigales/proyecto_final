module PC #(parameter N=32) (input clk, rst, en, output logic [31:0] q);

	always_ff @ (posedge clk or posedge rst)
		if (rst)
			q='0;
		else
			if (en)
				q=q+4;
				
endmodule