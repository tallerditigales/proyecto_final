module Test_Decode();


	logic clk, rst;
	logic [31:0] instruction;
	logic MEM;
	logic REG_WR;
	logic [3:0] rd;	
	logic [3:0] rn;
	logic [3:0] rm;
	logic [3:0] funct;
	logic [23:0] imm;
	
	
	Decode deco (
		.clk(clk),
		.rst(rst),
		.instruction(instruction),
		.rd(rd),
		.rn(rn),
		.rm(rm),
		.funct(funct),
		.imm(imm),
		.MEM(MEM),
		.REG_WR(REG_WR)
	);
	
	
	initial begin
		clk = 0;
		rst = 1; #10; rst = 0; #10; rst =1;
		
		
		instruction = 32'he3a00000; #10;  // MOV		r0,#0x0 
		instruction = 32'he5901000; #10;  // LDR		r1,[r0]
		instruction = 32'he35100ff; #10;  // CMP		r1,#0xFF
		instruction = 32'h0a00003f; #10;  // BEQ		fin
		instruction = 32'he2800004; #10;  // ADD		r0,r0,#4
		instruction = 32'heaffffdf; #10;  // B		   find_cycle
		instruction = 32'he5804000; #10;  // STR		r4, [r0]
		rst = 1;
	end
	
	always begin
		clk= ~clk; #5;
	end
	
endmodule