library ieee;
use ieee.std_logic_1164.all;

entity xor_var is
    port (
        I0 : in  std_ulogic;
        I1 : in  std_ulogic;
        O_XOR : out std_ulogic
    );
end entity xor_var;

architecture Behavioral of xor_var is
begin
    process(all)
        variable v_true  : std_ulogic;
        variable v_false : std_ulogic;
    begin
        v_true  := I0;
        v_false := not I0;

        if I1 = '0' then
            O_XOR <= v_true;
        else
            O_XOR <= v_false;
        end if;
    end process;
end architecture Behavioral;
