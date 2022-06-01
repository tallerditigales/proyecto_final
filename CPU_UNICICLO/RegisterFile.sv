module RegisterFile 
	(clk, rst, REG_WR, a1, a2, a3, wd3, r15, rd1, rd2, registers);
	
	input clk;
	input rst;
	input REG_WR;
	
	input [4:0] a1;
	input [4:0] a2;
	input [4:0] a3;
	input [31:0] wd3;
	input [31:0] r15;
	
	output logic [4:0] rd1;
	output logic [4:0] rd2;

	
	output logic [31:0] registers [16];
	
	
	
	logic [31:0] zero = 'd0;
	
 
	always_ff @(posedge clk or negedge rst) begin
		
		// PC
		registers[15] = r15+4; // pc+8
		
		if (!rst) 
			registers =  '{zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero};
		
		else if (!REG_WR) begin			
			case(a1)
				4'd0: rd1 = registers[0];
				4'd1: rd1 = registers[1];
				4'd2: rd1 = registers[2];
				4'd3: rd1 = registers[3];
				4'd4: rd1 = registers[4];
				4'd5: rd1 = registers[5];
				4'd6: rd1 = registers[6];
				4'd7: rd1 = registers[7];
				4'd8: rd1 = registers[8];
				4'd9: rd1 = registers[9];
				4'd10: rd1 = registers[10];
				4'd11: rd1 = registers[11];
				4'd12: rd1 = registers[12];
				4'd13: rd1 = registers[13];
				4'd14: rd1 = registers[14];
//				4'd15: rd1 = registers[15];
			endcase
			
			case(a2)
				4'd0: rd2 = registers[0];
				4'd1: rd2 = registers[1];
				4'd2: rd2 = registers[2];
				4'd3: rd2 = registers[3];
				4'd4: rd2 = registers[4];
				4'd5: rd2 = registers[5];
				4'd6: rd2 = registers[6];
				4'd7: rd2 = registers[7];
				4'd8: rd2 = registers[8];
				4'd9: rd2 = registers[9];
				4'd10: rd2 = registers[10];
				4'd11: rd2 = registers[11];
				4'd12: rd2 = registers[12];
				4'd13: rd2 = registers[13];
				4'd14: rd2 = registers[14];
//				4'd15: rd2 = registers[15];
			endcase
			
		end else if (REG_WR) begin
		
			case(a3)
				4'd0: registers[0] = wd3;
				4'd1: registers[1] = wd3;
				4'd2: registers[2] = wd3;
				4'd3: registers[3] = wd3;
				4'd4: registers[4] = wd3;
				4'd5: registers[5] = wd3;
				4'd6: registers[6] = wd3;
				4'd7: registers[7] = wd3;
				4'd8: registers[8] = wd3;
				4'd9: registers[9] = wd3;
				4'd10: registers[10] = wd3;
				4'd11: registers[11] = wd3;
				4'd12: registers[12] = wd3;
				4'd13: registers[13] = wd3;
				4'd14: registers[14] = wd3;
//				4'd15: registers[15] = wd3;
			endcase
		
		end
		
					
	end
	  
endmodule