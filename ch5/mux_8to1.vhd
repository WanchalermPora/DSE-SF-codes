-- File: mux_8to1.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8to1 is
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC);
end mux_8to1;

architecture Structural of mux_8to1 is
    component mux_4to1 is
        Port ( E : in  STD_LOGIC;
               D : in  STD_LOGIC_VECTOR (3 downto 0);
               S : in  STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC);
    end component;

    signal y_low, y_high : STD_LOGIC;
begin
    -- Structural instantiation of the lower nibble data router
    mux_lower: mux_4to1
        port map (E => E, D => D(3 downto 0), S => S(1 downto 0), Y => y_low);

    -- Structural instantiation of the upper nibble data router
    mux_upper: mux_4to1
        port map (E => E, D => D(7 downto 4), S => S(1 downto 0), Y => y_high);

    -- Final concurrent routing stage mimicking a structural 2-to-1 select paths block
    Y <= y_high when S(2) = '1' else y_low;
end Structural;