module ALU_Control  
	(op_alu, en, func);
	
	input  [3:0] op_alu;
	input  en;
	output func;
	logic [3:0] func;
		
always @(op_alu) begin
	
	if (en) begin			
		case(op_alu)
		
		// ADD
			4'b0100: func = 4'b1100;
			
		// CMP
			4'b1010: func = 4'b1101; // En caso de no ser 
		
		// MOV
			4'b1101: func = 4'b1001;
			
//				default: func = ;
		endcase
	end 
		
end

endmodule