library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sr_ff is
    port (
        clk   : in  STD_LOGIC;
        S     : in  STD_LOGIC;
        R     : in  STD_LOGIC;
        q     : out STD_LOGIC;
        q_bar : out STD_LOGIC
    );
end entity sr_ff;

architecture behavioral of sr_ff is
    signal q_reg : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (S = '1' and R = '0') then
                q_reg <= '1';
            elsif (S = '0' and R = '1') then
                q_reg <= '0';
            elsif (S = '1' and R = '1') then
                q_reg <= 'X';
            end if;
        end if;
    end process;

    q     <= q_reg;
    q_bar <= not q_reg;

end architecture behavioral;