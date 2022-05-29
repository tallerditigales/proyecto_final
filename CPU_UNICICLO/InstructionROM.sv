module InstructionROM
(
	input [31:0] pc,
	output [31:0] dataOut
);

	logic [7:0] rom [150:0];
	logic [31:0] outAux;
	
	initial 
		$readmemh("program.mem", rom);
	
	always @ (*)
	begin 
		outAux = {rom[pc+3], rom[pc+2], rom[pc+1], rom[pc]};
	end
	
	assign dataOut = outAux;
	
endmodule