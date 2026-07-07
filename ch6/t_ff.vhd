library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity t_ff is
    port (
        clk   : in  STD_LOGIC;
        t     : in  STD_LOGIC;
        q     : out STD_LOGIC;
        q_bar : out STD_LOGIC
    );
end entity t_ff;

architecture behavioral of t_ff is
    signal q_reg : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if t = '1' then
                q_reg <= not q_reg;
            end if;
        end if;
    end process;

    q     <= q_reg;
    q_bar <= not q_reg;

end architecture behavioral;