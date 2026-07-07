-- File: mux_generic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_generic is
    generic (
        M : integer := 3 -- Number of selection configuration bits
    );
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR ((2**M) - 1 downto 0);
           S : in  STD_LOGIC_VECTOR (M - 1 downto 0);
           Y : out STD_LOGIC);
end mux_generic;

architecture Behavioural of mux_generic is
begin
    process(E, D, S)
    begin
        Y <= '0';
        if E = '1' then
            -- Safely typecast the select address vector into an integer index channels lookup
            Y <= D(to_integer(unsigned(S)));
        end if;
    end process;
end Behavioural;