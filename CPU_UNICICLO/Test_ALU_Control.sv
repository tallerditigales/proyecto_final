module Test_ALU_Control();
	
	logic  [3:0] op_alu;
	logic  en;
	logic [3:0] func;
	
			 
	ALU_control aluControl (op_alu, en, func);

	initial begin
		
		en = 1;
		
//		op_alu = 0; #5
//		op_alu = 0; #5
//		op_alu = 0; #5
//		op_alu = 0; #5
//		op_alu = 0; #5
	
		for (int i = 0; i < 15; i++) begin
			op_alu = i; #5;
		end
		
	end
	
	
	
	
endmodule