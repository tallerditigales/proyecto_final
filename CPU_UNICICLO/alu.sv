module alu
#(parameter N = 4)
(
	input [1:0] opcode_i,
	input [N-1:0] a_i,
	input [N-1:0] b_i,
	output logic [N-1:0] result_o,
	output c_o,
	output z_o,
	output n_o,
	output v_o
);
	import alu_defs::*;
	
	logic [N-1:0] arith_result_w;
	logic arith_v;
	logic arith_c;
	
	arith_unit #(.N(N)) arithmetics (
		.a_i(a_i),
		.b_i(b_i),
		.opcode_i(opcode_i[0]),
		.result_o(arith_result_w),
		.overflow_o(arith_v),
		.cout_o(arith_c)
	);
	
	always_comb
	begin
		case (opcode_i)
			MOV_A: result_o = a_i;
			MOV_B: result_o = b_i;
			default: result_o = arith_result_w;
		endcase
	end
	
	assign v_o = ~opcode_i[1] & arith_v;
	assign c_o = ~opcode_i[1] & arith_c;
	assign n_o = result_o[N-1];
	assign z_o = (result_o == '0);
endmodule