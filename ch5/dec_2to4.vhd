-- File: dec_2to4.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_2to4 is
    Port ( E : in  STD_LOGIC;
           W : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end dec_2to4;

-- Architecture 1: Behavioural Approach (Using a Case Statement)
architecture Behavioural of dec_2to4 is
begin
    process(E, W)
    begin
        Y <= "0000";
        if E = '1' then
            case W is
                when "00"   => Y <= "0001";
                when "01"   => Y <= "0010";
                when "10"   => Y <= "0100";
                when "11"   => Y <= "1000";
                when others => Y <= "0000";
            end case;
        end if;
    end process;
end Behavioural;

-- Architecture 2: Dataflow Approach (Following Minterm Derivation Equations)
architecture Dataflow of dec_2to4 is
begin
    Y(0) <= E and (not W(1)) and (not W(0));
    Y(1) <= E and (not W(1)) and W(0);
    Y(2) <= E and W(1)       and (not W(0));
    Y(3) <= E and W(1)       and W(0);
end Dataflow;