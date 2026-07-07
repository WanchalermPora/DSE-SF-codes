-- File: full_adder_1b.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_1b is
    Port ( A     : in  STD_LOGIC;
           B     : in  STD_LOGIC;
           C_in  : in  STD_LOGIC;
           S     : out STD_LOGIC;
           C_out : out STD_LOGIC);
end full_adder_1b;

-- Architecture 1: Dataflow Approach (Following Analytical Boolean Expressions)
architecture Dataflow of full_adder_1b is
begin
    S     <= A xor B xor C_in;
    C_out <= (A and B) or (C_in and (A xor B));
end Dataflow;

-- Architecture 2: Behavioural Approach (Algorithmic Processing Block)
architecture Behavioural of full_adder_1b is
begin
    process(A, B, C_in)
        variable count : integer;
    begin
        count := 0;
        if A = '1'    then count := count + 1; end if;
        if B = '1'    then count := count + 1; end if;
        if C_in = '1' then count := count + 1; end if;
        
        if (count = 1) or (count = 3) then
            S <= '1';
        else
            S <= '0';
        end if;
        
        if (count >= 2) then
            C_out <= '1';
        else
            C_out <= '0';
        end if;
    end process;
end Behavioural;