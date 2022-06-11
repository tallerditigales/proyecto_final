module painter
(
	input clk,
	input [9:0] horzCoord,
	input [9:0] vertCoord,
	input [31:0] tex [2399:0],
	output logic pixel
);
	localparam FONT_WIDTH = 8;
	localparam FONT_HEIGHT = 16;
	integer fontAddress;
	logic [FONT_WIDTH-1:0]  charBits;
	integer charPos = 0;
	integer bitPos = 0;
	
	glyph_rom glyphs(
		.clk(clk),
		.addr(fontAddress),
		.data(charBits)
	);
	
	always_ff @(posedge clk) begin
		charPos <= horzCoord/FONT_WIDTH + (vertCoord/FONT_HEIGHT) * 80;
		bitPos <= horzCoord % FONT_WIDTH;
		fontAddress <= tex[charPos + 1] * 16 + vertCoord % FONT_HEIGHT;
		pixel <= 1'b0;
		if (charBits[FONT_WIDTH-bitPos+1]) pixel <= 1'b1;
	end
endmodule