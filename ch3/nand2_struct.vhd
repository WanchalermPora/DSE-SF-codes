-- ============================================================
-- File: nand2_struct.vhd
-- Description: Structural architecture instantiating the NAND2
--              gate defined in nand2.vhd (entity nand2).
-- ============================================================

library IEEE;
use IEEE.std_logic_1164.all;

-- Top-level entity that reuses the NAND2 gate structurally.
entity nand2_struct is
    port (
        A : in  STD_ULOGIC;
        B : in  STD_ULOGIC;
        Y  : out STD_ULOGIC
    );
end entity nand2_struct;

architecture Structural of nand2_struct is
begin
    -- Direct entity instantiation of the NAND2 gate.
    U_NAND2 : entity work.nand2
        port map (
            I0 => A,
            I1 => B,
            O_NAND => Y
        );
end architecture Structural;
