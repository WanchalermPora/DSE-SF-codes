library ieee;
use ieee.std_logic_1164.all;

entity gray_counter is
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        q     : out std_logic_vector(2 downto 0)
    );
end gray_counter;

architecture beh of gray_counter is
    signal q_reg, q_next : std_logic_vector(2 downto 0);
begin
    -- Register process loop
    reg_proc: process(clk, rst_n)
    begin
        if rst_n = '0' then
            q_reg <= "000";
        elsif rising_edge(clk) then
            q_reg <= q_next;
        end if;
    end process;

    -- Combinational decode matrix
    comb_proc: process(q_reg)
    begin
        case q_reg is
            when "000"  => q_next <= "001";
            when "001"  => q_next <= "011";
            when "011"  => q_next <= "010";
            when "010"  => q_next <= "110";
            when "110"  => q_next <= "111";
            when "111"  => q_next <= "101";
            when "101"  => q_next <= "100";
            when "100"  => q_next <= "000";
            when others => q_next <= "000";
        end case;
    end process;

    q <= q_reg;
end beh;