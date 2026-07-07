-- File: demux_1to8.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1to8 is
    Port ( D : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end demux_1to8;

architecture Structural of demux_1to8 is
    component demux_1to4 is
        Port ( D : in  STD_LOGIC;
               S : in  STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal d_low, d_high : STD_LOGIC;
begin
    -- Generate block data cascades using select bit S(2)
    d_low  <= D and (not S(2));
    d_high <= D and S(2);

    -- Structural component mapping for the lower distribution bank
    demux_lower: demux_1to4
        port map (D => d_low, S => S(1 downto 0), Y => Y(3 downto 0));

    -- Structural component mapping for the upper distribution bank
    demux_upper: demux_1to4
        port map (D => d_high, S => S(1 downto 0), Y => Y(7 downto 4));
end Structural;