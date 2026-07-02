-- Testbench for AOI21 gate
-- Reference: Behavioral architecture of aoi21
-- DUT:       Structural architecture of aoi21
--

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_aoi21 is
end entity tb_aoi21;

architecture Stimulus of tb_aoi21 is

    -- Testbench signals
    signal I0, I1, I2    : STD_ULOGIC := '0';
    signal O_REF, O_DUT  : STD_ULOGIC;

begin

    --------------------------------------------------------------------
    -- Reference Instance: Behavioral architecture
    --------------------------------------------------------------------
    REF: entity work.aoi21(Behavioral)
        port map (
            I0 => I0,
            I1 => I1,
            I2 => I2,
            O_AOI => O_REF
        );

    --------------------------------------------------------------------
    -- DUT Instance: Structural architecture
    --------------------------------------------------------------------
    DUT: entity work.aoi21(Structural)
        port map (
            I0 => I0,
            I1 => I1,
            I2 => I2,
            O_AOI => O_DUT
        );
    --------------------------------------------------------------------
    -- Stimulus and Self-Checking
    --------------------------------------------------------------------
    process
    begin
        -- Three nested loops written compactly
        for a, b, c in '0' to '1' loop
            I0 <= a;
            I1 <= b;
            I2 <= c;
            wait for 10 ns;

            -- Self-check using ASSERT
            assert (O_REF = O_DUT)
                report "Mismatch: I0=" & std_ulogic'image(a)
                     & " I1=" & std_ulogic'image(b)
                     & " I2=" & std_ulogic'image(c)
                     & " REF=" & std_ulogic'image(O_REF)
                     & " DUT=" & std_ulogic'image(O_DUT)
                severity error;
        end loop;
        report "AOI21 structural vs behavioural comparison completed.";
        wait;
    end process;
end architecture Stimulus;
