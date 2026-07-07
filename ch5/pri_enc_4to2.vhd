-- File: pri_enc_4to2.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pri_enc_4to2 is
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (1 downto 0));
end pri_enc_4to2;

-- Architecture 1: Behavioural Approach (Using Nested Conditional Blocks)
architecture Behavioural of pri_enc_4to2 is
begin
    process(E, D)
    begin
        Y <= "00";
        V <= '0';
        
        if E = '1' then
            if D(3) = '1' then
                Y <= "11"; V <= '1';
            elsif D(2) = '1' then
                Y <= "10"; V <= '1';
            elsif D(1) = '1' then
                Y <= "01"; V <= '1';
            elsif D(0) = '1' then
                Y <= "00"; V <= '1';
            else
                V <= '0';
            end if;
        end if;
    end process;
end Behavioural;

-- Architecture 2: Dataflow Approach (Following our Analytical Boolean Derivation)
architecture Dataflow of pri_enc_4to2 is
begin
    V    <= E and (D(3) or D(2) or D(1) or D(0));
    Y(1) <= E and (D(3) or D(2));
    Y(0) <= E and (D(3) or (not D(2) and D(1)));
end Dataflow;