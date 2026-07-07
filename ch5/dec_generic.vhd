-- File: dec_generic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dec_generic is
    generic (
        N : integer := 3 -- Number of input configuration bits
    );
    Port ( E : in  STD_LOGIC;
           W : in  STD_LOGIC_VECTOR (N - 1 downto 0);
           Y : out STD_LOGIC_VECTOR ((2**N) - 1 downto 0));
end dec_generic;

architecture Behavioural of dec_generic is
begin
    process(E, W)
    begin
        -- Initialize entire output vector to zero
        Y <= (others => '0');
        
        if E = '1' then
            -- Loop iterates across all possible combinations
            -- A single index matching the decimal value of W is driven high
            for i in 0 to (2**N) - 1 loop
                if to_integer(unsigned(W)) = i then
                    Y(i) <= '1';
                end if;
            end loop;
        end if;
    end process;
end Behavioural;