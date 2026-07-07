-- File: demux_1to4.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1to4 is
    Port ( D : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end demux_1to4;

-- Architecture 1: Behavioural Approach (Using a Case Statement)
architecture Behavioural of demux_1to4 is
begin
    process(D, S)
    begin
        Y <= "0000";
        case S is
            when "00"   => Y(0) <= D;
            when "01"   => Y(1) <= D;
            when "10"   => Y(2) <= D;
            when "11"   => Y(3) <= D;
            when others => Y <= "0000";
        end case;
    end process;
end Behavioural;

-- Architecture 2: Dataflow Approach (Following Minterm Gating Equations)
architecture Dataflow of demux_1to4 is
begin
    Y(0) <= D and (not S(1)) and (not S(0));
    Y(1) <= D and (not S(1)) and S(0);
    Y(2) <= D and S(1)       and (not S(0));
    Y(3) <= D and S(1)       and S(0);
end Dataflow;