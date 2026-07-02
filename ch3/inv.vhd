library IEEE;
use IEEE.std_logic_1164.all;

entity inv is
    port (
        I : in  STD_ULOGIC;
        O : out STD_ULOGIC
    );
end entity inv;

architecture rtl of inv is
begin
    O <= not I;
end architecture rtl;
