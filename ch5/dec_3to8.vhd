-- File: dec_3to8.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_3to8 is
    Port ( E : in  STD_LOGIC;
           W : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end dec_3to8;

architecture Structural of dec_3to8 is
    component dec_2to4 is
        Port ( E : in  STD_LOGIC;
               W : in  STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal e_low, e_high : STD_LOGIC;
begin
    -- Decode active path using high-order input bit W(2)
    e_low  <= E and (not W(2));
    e_high <= E and W(2);

    -- Structural instance mapping for the lower block index output
    dec_lower: dec_2to4
        port map (E => e_low, W => W(1 downto 0), Y => Y(3 downto 0));

    -- Structural instance mapping for the upper block index output
    dec_upper: dec_2to4
        port map (E => e_high, W => W(1 downto 0), Y => Y(7 downto 4));
end Structural;