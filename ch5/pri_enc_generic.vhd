-- File: pri_enc_generic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pri_enc_generic is
    generic (
        N : integer := 3 -- Number of encoded output bits
    );
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR ((2**N) - 1 downto 0);
           V : out STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (N - 1 downto 0));
end pri_enc_generic;

architecture Behavioural of pri_enc_generic is
begin
    process(E, D)
    begin
        Y <= (others => '0');
        V <= '0';
        
        if E = '1' then
            -- Loop scans from the absolute highest index down to the lowest
            -- The first active high line found automatically blocks lower terms
            for i in (2**N) - 1 downto 0 loop
                if D(i) = '1' then
                    Y <= STD_LOGIC_VECTOR(to_unsigned(i, N));
                    V <= '1';
                    exit; -- Break loop execution immediately upon priority match
                end if;
            end loop;
        end if;
    end process;
end Behavioural;