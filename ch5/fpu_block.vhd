-- File: fpu_block.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- The standard fixed/float synthesis library introduced in modern IEEE updates
use IEEE.FLOAT_PKG.ALL; 

entity fpu_block is
    Port ( mode   : in  STD_LOGIC; -- 0 for Add, 1 for Multiply
           A      : in  STD_LOGIC_VECTOR (31 downto 0);
           B      : in  STD_LOGIC_VECTOR (31 downto 0); -- Fixed port size boundary typo
           Result : out STD_LOGIC_VECTOR (31 downto 0));
end fpu_block;

architecture Behavioral of fpu_block is
    -- Internal signals typed to floating-point definitions
    signal f_A, f_B : float32;
    signal f_Res    : float32;
begin
    -- 1. Interface Translation Phase
    -- Cast raw top-level untyped bit packets to native floating-point types
    f_A <= to_float(A);
    f_B <= to_float(B);

    -- 2. Behavioral Processing Phase
    -- The standard library operator automatically instantiates look-ahead alignment trees
    f_Res <= f_A * f_B when mode = '1' else f_A + f_B;

    -- 3. Boundary Type Recovery Phase
    -- Cast the safe float internal signal back to an untyped vector for bus routing
    Result <= to_slv(f_Res);
end Behavioral;