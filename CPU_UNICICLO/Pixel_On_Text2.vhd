-- Pixel_On_Text2 determines if the current pixel is on text and make it easiler to call from verilog
-- param:
--   display text
-- input: 
--   VGA clock(the clk you used to update VGA)
--   top left corner of the text area -- positionX, positionY
--   current X and Y position
-- output:
--   a bit that represent whether is the pixel in text

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- note this line.The package is compiled to this directory by default.
-- so don't forget to include this directory. 
library work;
-- this line also is must.This includes the particular package into your program.
use work.commonPak.all;

entity Pixel_On_Text2 is
	port (
		tex: in chars(0 to 2400);
		clk: in std_logic;
		-- current pixel postion
		horzCoord: in integer;
		vertCoord: in integer;
		
		pixel: out std_logic := '0'
	);

end Pixel_On_Text2;

architecture Behavioral of Pixel_On_Text2 is

	signal fontAddress: integer;
	-- A row of bit in a charactor, we check if our current (x,y) is 1 in char row
	signal charBitInRow: std_logic_vector(FONT_WIDTH-1 downto 0) := (others => '0');
	-- the position(column) of a charactor in the given text
	signal charPosition:integer := 0;
	-- the bit position(column) in a charactor
	signal bitPosition:integer := 0;
	
begin
    -- (horzCoord - position.x): x positionin the top left of the whole text
    charPosition <= (horzCoord)/FONT_WIDTH + (vertCoord/FONT_HEIGHT) * 80;
    bitPosition <= (horzCoord) mod FONT_WIDTH;
	 fontAddress <= tex(charPosition+1)*16+(vertCoord mod FONT_HEIGHT);


	FontRom: entity work.Font_Rom
	port map(
		clk => clk,
		addr => fontAddress,
		fontRow => charBitInRow
	);
	
	pixelOn: process(clk)
	begin
        if rising_edge(clk) then
            pixel <= '0';
				
				if charBitInRow(FONT_WIDTH-bitPosition) = '1' then
                    pixel <= '1';
				end if;
        
        end if;
	end process;

end Behavioral;