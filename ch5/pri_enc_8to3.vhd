-- File: pri_enc_8to3.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pri_enc_8to3 is
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           V : out STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end pri_enc_8to3;

architecture Structural of pri_enc_8to3 is
    component pri_enc_4to2 is
        Port ( E : in  STD_LOGIC;
               D : in  STD_LOGIC_VECTOR (3 downto 0);
               V : out STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

    signal v_high, v_low : STD_LOGIC;
    signal y_high, y_low : STD_LOGIC_VECTOR(1 downto 0);
    signal e_lower        : STD_LOGIC;
begin
    -- Structural component mapping for the higher-order group
    enc_high: pri_enc_4to2 
        port map (E => E, D => D(7 downto 4), V => v_high, Y => y_high);

    -- Cascade enable logic generation
    e_lower <= E and (not v_high);

    -- Structural component mapping for the lower-order group
    enc_low: pri_enc_4to2 
        port map (E => e_lower, D => D(3 downto 0), V => v_low, Y => y_low);

    -- Interconnect composition equations
    Y(2) <= v_high;
    Y(1) <= y_high(1) or y_low(1);
    Y(0) <= y_high(0) or y_low(0);
    V    <= v_high or v_low;
end Structural;