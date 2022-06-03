module Decode (
	input clk,
	input rst,
	input [31:0] instruction, 

	output [3:0] rd, 		// destination register
	output [3:0] rn,		// source register
	output [3:0] rm,		// other register
	output [3:0] cmd,		// cmd
	output [23:0] imm,	// immediate
	
	
	
	// signals
	output MEM,			// use memory
	output REG_WR,		// read = 0 /  write = 1
	output SEL_DEST
);
					
	logic _MEM;
	logic _REG_WR;
	logic [3:0] _rd;	
	logic [3:0] _rn;
	logic [3:0] _rm;
	logic [3:0] _cmd;
	logic [23:0] _imm;
	
	
always_ff @(posedge clk or negedge rst) 
begin

	if (!rst) begin
		_MEM = 0;
		_REG_WR = 0;
		_rd = 0;
		_rn = 0;
		_rm = 0;
		_cmd = 0;
		_imm = 0;
	end

	else begin
		case (instruction [27:26]) 				// OPCODE
		
		// Data-processing
			2'b00: begin
			
				_MEM = 0;
				_REG_WR = 1;
				_cmd = instruction[24:21];
				_rn = instruction[19:16];
				_rd = instruction[15:12];
				
				
				if (instruction[25]) begin 		// TYPE I
					_rm = 0;
					_imm = instruction[7:0];
				end else begin  						// TYPE R
					_rm = instruction[3:0];
					_imm = 0;
				end
			end
			
			
		// Memory
			2'b01: begin
					
					// Load or Store
					_REG_WR = (instruction[20]) ? 0 : 1;
					
					_MEM = 1;
					_cmd = instruction[24:21];
					_rn = instruction[19:16];
					_rd = instruction[15:12];
					
					if (!instruction[25]) begin 		// TYPE R
						_rm = instruction[3:0];
						_imm = 0;
					end else begin  						// TYPE I
						_rm = 0;
						_imm = instruction[7:0];
					end
			end
				
		// Branch
			2'b10: begin
				_MEM = 0;
				_REG_WR = 0;
				_cmd = 0;
				_rn = 0;
				_rd = 0;
				_rm = 0;
				_imm = instruction[23:0];
			end
			
			
			default: begin
				_MEM = 0;
				_REG_WR = 0;
				_cmd = 0;
				_rn = 0;
				_rd = 0;
				_rm = 0;
				_imm = 0;
			end
			
		endcase
	end
end

	assign MEM = _MEM;
	assign REG_WR = _REG_WR;	
	assign rd = _rd;
	assign rn = _rn;
	assign rm = _rm;
	assign cmd = _cmd;
	assign imm = _imm;
	
endmodule