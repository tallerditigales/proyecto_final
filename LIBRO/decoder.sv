module decoder
(
	input logic [1:0] Op,
	input logic [5:0] Funct,
	input logic [3:0] Rd,
	output logic [1:0] FlagW,
	output logic PCS, RegW, MemW,
	output logic MemtoReg, ALUSrc,
	output logic [1:0] ImmSrc, RegSrc, ALUControl
);

	logic [9:0] controls;
	logic Branch, ALUOp;
	
	// Main Decoder
	always_comb
		casex(Op)
										// Data-processing immediate
			2'b00: if (Funct[5]) controls = 10'b0000101001;
										// Data-processing register
			else 						controls = 10'b0000001001;   
										// LDR
			2'b01: if (Funct[0]) controls = 10'b0001111000;  //op = 01, L=1    // FALTA IMPLEMENTAR "B" FUNCT[2]
										// STR												    // PARA AGREGAR EL STORE BYTE
			else 						controls = 10'b1001110100;  //op = 01, L=0
										// B
			2'b10: 					controls = 10'b0110100010;	
										// Unimplemented
			default: 				controls = 10'bx;
			
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
	//			00			00			1			0	  	  1	  0	  0		1
	// Data-processing register
	// 		00			00			0			0		  1	  0	  0		1
	// LDR
	//			00			01			1			1		  1	  0	  0		0
	// STR
	// 		10			01			1			1		  0	  1	  0		0
	// B
	// 		01			10			1			0		  0	  0	  1		0
	assign {RegSrc, ImmSrc, ALUSrc, MemtoReg, RegW, MemW, Branch, ALUOp} = controls;
	
	// ALU Decoder
	always_comb
	
		if (ALUOp) begin // which DP Instr?
			case(Funct[4:1])
				4'b0100: ALUControl = 2'b00; // ADD
				4'b0010: ALUControl = 2'b01; // SUB
				4'b0000: ALUControl = 2'b10; // AND
				4'b1100: ALUControl = 2'b11; // ORR
				default: ALUControl = 2'bx; // unimplemented
			endcase
			
		// update flags if S bit is set (C & V only for arith)
		FlagW[1] = Funct[0];
		FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
		
		end else begin
			ALUControl 	= 2'b00; 	// add for non-DP instructions
			FlagW 		= 2'b00; 		// don't update Flags
		end
		
	// PC Logic
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
	
endmodule