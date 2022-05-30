module Test_Decode();


	logic clk, rst;
	logic [31:0] instruction;
	logic useMemory;
	logic r_w;
	logic [3:0] rd;	
	logic [3:0] rn;
	logic [3:0] rm;
	logic [3:0] funct;
	logic [23:0] imm;
	
	
	Decode deco (
		.clk(clk),
		.rst(rst),
		.instruction(instruction),
		.useMemory(useMemory),
		.r_w(r_w),
		.rd(rd),
		.rn(rn),
		.rm(rm),
		.funct(funct),
		.imm(imm)
	);
	
	
	initial begin
		clk = 0;
		rst = 1; #10; rst = 0; #10; rst =1;
		instruction = 32'he0865007; #10;
		instruction = 32'he405b01a; #10; // Store
		instruction = 32'hba000003; #10; // 
		rst = 1;
	end
	
	always begin
		clk= ~clk; #5;
	end
	
endmodule