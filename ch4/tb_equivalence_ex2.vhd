library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_equivalence_ex2 is end entity;

architecture sim of tb_equivalence_ex2 is
    signal A,B,C,D : std_logic := '0';
    signal Y_gold, Y_dut : std_logic;
begin
    U_GOLD : entity work.ex2_y(gold) port map (A=>A,B=>B,C=>C,D=>D,Y=>Y_gold);
    U_DUT  : entity work.ex2_y(dut)  port map (A=>A,B=>B,C=>C,D=>D,Y=>Y_dut);

    process
        variable vec : unsigned(3 downto 0);
    begin
        for i in 0 to 15 loop
            vec := to_unsigned(i,4);
            A <= vec(3); B <= vec(2); C <= vec(1); D <= vec(0);
            wait for 1 ns;
            assert Y_gold = Y_dut report "Mismatch i=" & integer'image(i) severity error;
        end loop;
        report "PASS: gold = dut for all vectors." severity note;
        wait;
    end process;
end architecture;
