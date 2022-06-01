module mux_2to1(

	input [3:0] a, b,
	input sel,
	output [3:0] out

);
  assign out = sel ? b : a;

endmodule