library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity d_ff is
    port (
        clk   : in  STD_LOGIC;
        d     : in  STD_LOGIC;
        q     : out STD_LOGIC;
        q_bar : out STD_LOGIC
    );
end entity d_ff;

architecture behavioral of d_ff is
    signal q_reg : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            q_reg <= d;
        end if;
    end process;

    q     <= q_reg;
    q_bar <= not q_reg;

end architecture behavioral;