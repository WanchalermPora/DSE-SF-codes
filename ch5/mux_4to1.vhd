-- File: mux_4to1.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC);
end mux_4to1;

-- Architecture 1: Behavioural Approach (Using a Case Statement)
architecture Behavioural of mux_4to1 is
begin
    process(E, D, S)
    begin
        Y <= '0';
        if E = '1' then
            case S is
                when "00"   => Y <= D(0);
                when "01"   => Y <= D(1);
                when "10"   => Y <= D(2);
                when "11"   => Y <= D(3);
                when others => Y <= '0';
            end case;
        end if;
    end process;
end Behavioural;

-- Architecture 2: Dataflow Approach (Following Minterm Summation Equations)
architecture Dataflow of mux_4to1 is
begin
    Y <= E and ((D(0) and (not S(1)) and (not S(0))) or
                (D(1) and (not S(1)) and S(0))       or
                (D(2) and S(1)       and (not S(0))) or
                (D(3) and S(1)       and S(0)));
end Dataflow;