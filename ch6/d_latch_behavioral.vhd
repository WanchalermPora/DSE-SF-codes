library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity d_latch_behavioral is
    port (
        E     : in  STD_LOGIC;
        D     : in  STD_LOGIC;
        Q     : out STD_LOGIC;
        Q_bar : out STD_LOGIC
    );
end entity d_latch_behavioral;

architecture behavioral of d_latch_behavioral is
begin

    process(E, D)
    begin
        if E = '1' then
            Q     <= D;
            Q_bar <= not D;
        end if;
        -- Omission of else clause forces the EDA compiler to synthesize level-sensitive latch cells
    end process;

end architecture behavioral;