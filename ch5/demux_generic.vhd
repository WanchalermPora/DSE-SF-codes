-- File: demux_generic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity demux_generic is
    generic (
        M : integer := 3 -- Number of address selection bits
    );
    Port ( D : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (M - 1 downto 0);
           Y : out STD_LOGIC_VECTOR ((2**M) - 1 downto 0));
end demux_generic;

architecture Behavioural of demux_generic is
begin
    process(D, S)
    begin
        -- Initialize the entire output vector to zero
        Y <= (others => '0');
        
        -- Loop scans across all available channels in the array
        -- The single channel matching the integer value of vector S receives input data D
        for i in 0 to (2**M) - 1 loop
            if to_integer(unsigned(S)) = i then
                Y(i) <= D;
            end if;
        end loop;
    end process;
end Behavioural;