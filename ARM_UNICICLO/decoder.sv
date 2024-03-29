module decoder
(
	input logic [1:0] Op,
	input logic [5:0] Funct,
	input logic [3:0] Rd,
	output logic [1:0] FlagW,
	output logic PCS, RegW, MemW, ByteMem,  // Se agrega la bandera ByteMem para diferenciar ldrb y strb
	output logic MemtoReg, ALUSrc,
	output logic [1:0] ImmSrc, RegSrc, 
	output logic [2:0] ALUControl
);

	logic [10:0] controls;
	logic Branch, ALUOp;
	
	// Main Decoder
	always_comb
		casex(Op)
										
			2'b00: if (Funct[5]) 								controls = 11'b00001010010; // Data-processing immediate			
			else 														controls = 11'b00000010010; // Data-processing register 
				
			2'b01: if (Funct[0] & !Funct[2])					controls = 11'b00011110000; // LDR
			else if (Funct[0] & Funct[2])						controls = 11'b00011110001; // LDRB																    				
			else if (!Funct[0] & !Funct[2]) 					controls = 11'b10011101000; // STR
			else  								 					controls = 11'b10011101001; // STRB
										
			2'b10: 													controls = 11'b01101000100; // Be
										
			default: 												controls = 11'bx; 		    // Unimplemented
			
		endcase
	
	// Señales
	
	// RegSrc: señal de seleccion de los dos mux que entran al banco de registros.
					// El LSB (ra1mux): selecciona entre RN y "15" (pc)
					// El MSB (ra2mux): selecciona entre RM y RD
					
	//	ImmSrc: señal del extensor:
					// 00: 8-bit unsigned immediate
					// 01: 12-bit unsigned immediate
					// 10. 24-bit two's complement shifted branch
					
	// ALUSrc: señal de seleccion de la entrada B del ALU.
					// 0: selecciona el registro RD2.
				   // 1: selecciona el immediato exentedido.
	
	// MemtoReg: señal del mux que selecciona entre el resultado de la ALU o el dato leido de mem.
					// 0: ALURESULT
					// 1: ReadData (mem)
	
	// RegW: enable para escribir en el banco de registros
	
	// MemW: enable para escribir en la memoria
	
	// Branch: bandera del branch, se utiliza para definir el PCSrc (al final esta el assign)
	
	// ALUOp: bandera para indicar  si se necesita la ALU, con esta se define el valor de
	// ALUControl, abajo esta el decoder.
	
		
	// Data-processing immediate
	//			00			00			1			0	  	  1	  0	  0		1		0
	// Data-processing register
	// 		00			00			0			0		  1	  0	  0		1		0
	// LDR
	//			00			01			1			1		  1	  0	  0		0		0
	// LDRB
	//			00			01			1			1		  1	  0	  0	   0		1
	// STR
	// 		10			01			1			1		  0	  1	  0		0		0
	// STRB
	//			10			01			1			1		  0	  1	  0		0		1
	// B
	// 		01			10			1			0		  0	  0	  1		0		0
	assign {RegSrc, ImmSrc, ALUSrc, MemtoReg, RegW, MemW, Branch, ALUOp, ByteMem} = controls;
	
	// ALU Decoder
	always_comb
	
		if (ALUOp) begin // which DP Instr?
			case(Funct[4:1])
				4'b0100: ALUControl = 3'b000; // ADD
				4'b0010: ALUControl = 3'b001; // SUB
				4'b0000: ALUControl = 3'b010; // AND
				4'b1100: ALUControl = 3'b011; // ORR
				4'b1010: ALUControl = 3'b001; // COMPARE
				4'b1101: ALUControl = 3'b100; // MOV
				default: ALUControl = 3'bx; // unimplemented
			endcase
			
		// update flags if S bit is set (C & V only for arith)
		FlagW[1] = Funct[0];
		FlagW[0] = Funct[0] & (ALUControl == 3'b000 | ALUControl == 3'b001);
		
		end else begin
			ALUControl 	= 3'b000; 	// add for non-DP instructions
			FlagW 		= 2'b00; 		// don't update Flags
		end
		
	// PC Logic
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
	
endmodule