library ieee;
use ieee.std_logic_1164.all;

entity ex2_y is
    port(
        A : in  std_logic;
        B : in  std_logic;
        C : in  std_logic;
        D : in  std_logic;
        Y : out std_logic
    );
end entity ex2_y;

--============================================================
-- Architecture 1: Gold standard (Step 3 equation)
--============================================================
architecture gold of ex2_y is
begin
    -- Y = (A+B)(A+~B+C) + ~A(C xor D)(B+~C+D) + ~(A+~C)
    Y <= ((A or B) and (A or (not B) or C))
         or ((not A) and (C xor D) and (B or (not C) or D))
         or (not (A or (not C)));
end architecture gold;

--============================================================
-- Architecture 2: Optimised DUT (Step 4 result)
--============================================================
architecture dut of ex2_y is
begin
    -- Simplified: Y = A + C + D
    Y <= A or C or D;
end architecture dut;
