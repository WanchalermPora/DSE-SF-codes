-- File: mac_unit.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mac_unit is
    generic (
        DATA_WIDTH : integer := 16; -- Port width parameters
        ACC_WIDTH  : integer := 40  -- Padded accumulator width
    );
    Port ( clk          : in  STD_LOGIC;
           rst_n        : in  STD_LOGIC;
           clr_acc      : in  STD_LOGIC;
           A            : in  STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           B            : in  STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           Accum_Result : out STD_LOGIC_VECTOR (ACC_WIDTH - 1 downto 0));
end mac_unit;

architecture Behavioral of mac_unit is
    -- Internal tracking networks matching combinational and sequential loops
    signal internal_prod : signed((2 * DATA_WIDTH) - 1 downto 0);
    signal accum_reg     : signed(ACC_WIDTH - 1 downto 0);
begin

    -- 1. Combinational Logic Component: Multiplier Block
    -- Type safety casting occurs strictly inside the architecture block.
    -- The multiplication operator handles the extensive underlying transistor interconnects.
    internal_prod <= signed(A) * signed(B);

    -- 2. Sequential Logic Component: Accumulator Pipeline Registers
    process(clk)
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                accum_reg <= (others => '0');
            elsif clr_acc = '1' then
                accum_reg <= (others => '0');
            else
                -- Concurrent sum accumulation loop utilizing signed math types
                accum_reg <= accum_reg + resize(internal_prod, ACC_WIDTH);
            end if;
        end if;
    end process;

    -- Map state variables back out to the untyped top-level vector ports
    Accum_Result <= STD_LOGIC_VECTOR(accum_reg);
end Behavioral;