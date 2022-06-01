module Test_RegisterFile();
	
	logic clk;
	logic rst;
	logic REG_WR;
	
	logic [4:0] dirA;
	logic [4:0] dirB;
	logic [4:0] dirWR;
	logic [31:0] di;
	logic [31:0] r15;
	
	logic [4:0] doA;
	logic [4:0] doB;
				 
	RegisterFile registersLog (clk, rst, REG_WR, dirA, dirB, dirWR, di, r15, doA, doB);

	initial begin
		clk = 0;
		rst = 0; 
		#10; 
		
		rst =1;
		
		
		r15 = 32'd0;
		// LECTURA DE LOS REGISTROS, PERO COMO TODO ESTA EN CERO.
		REG_WR = 0;
		dirA = 4'd1;
		dirB = 4'd4;
		#10;
		
		
		r15 = r15 + 4;
		// NO HACE LECTURA
		// ESCRIBE 21 EN EL R7
		REG_WR = 1;
		dirB = 4'd0;
		dirWR = 4'd7;
		di = 'd21;
		#10;
		
		r15 = r15 + 4;
		// NO HACE LECTURA
		// ESCRIBE 55 EN EL R10
		REG_WR = 1;
		dirB = 4'd14;
		dirWR = 4'd10;
		di = 'd55;
		#10;
		
		
		// DATO DE ADDRESS 1 = 21 Y ADDRESS 2 = 55
		// NO ESCRIBE PORQUE WRITE NO ESTA HABILITADO
		REG_WR = 0;
		dirA = 4'd7;
		dirB = 4'd10;
		dirWR = 4'd8;
		di = 'd197;
		#10;
	
	end
	
	
	always begin
		clk= ~clk; #5;
	end	
	
	
endmodule