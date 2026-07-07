-- File: add_sub_param.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity add_sub_param is
    generic (
        WIDTH : integer := 8
    );
    Port ( Add_Sub   : in  STD_LOGIC; -- 0 for Add, 1 for Sub
           A         : in  STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
           B         : in  STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
           Result    : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
           Carry_Out : out STD_LOGIC);
end add_sub_param;

-- Architecture: Dataflow (Typecasting handled internally without defining typed ports)
architecture Dataflow of add_sub_param is
    signal A_ext, B_ext : unsigned(WIDTH downto 0);
    signal Res_ext      : unsigned(WIDTH downto 0);
begin
    -- Top level interface logic remains untyped. Data types are generated internally
    -- at the computation stage to ensure perfect abstraction boundaries.
    A_ext <= unsigned('0' & A);
    B_ext <= unsigned('0' & B);

    Res_ext <= A_ext - B_ext when Add_Sub = '1' else A_ext + B_ext;

    Result    <= STD_LOGIC_VECTOR(Res_ext(WIDTH - 1 downto 0));
    Carry_Out <= Res_ext(WIDTH);
end Dataflow;