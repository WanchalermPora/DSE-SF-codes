library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity jk_ff is
    port (
        clk   : in  STD_LOGIC;
        j     : in  STD_LOGIC;
        k     : in  STD_LOGIC;
        q     : out STD_LOGIC;
        q_bar : out STD_LOGIC
    );
end entity jk_ff;

architecture behavioral of jk_ff is
    signal q_reg : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (j = '0' and k = '0') then
                q_reg <= q_reg;
            elsif (j = '0' and k = '1') then
                q_reg <= '0';
            elsif (j = '1' and k = '0') then
                q_reg <= '1';
            elsif (j = '1' and k = '1') then
                q_reg <= not q_reg;
            end if;
        end if;
    end process;

    q     <= q_reg;
    q_bar <= not q_reg;

end architecture behavioral;