library ieee;
use ieee.std_logic_1164.all;

entity aoi21 is
    port (
        I0 : in  std_ulogic;
        I1 : in  std_ulogic;
        I2 : in  std_ulogic;
        O_AOI : out std_ulogic;
    );
end entity aoi21;

architecture Behavioral of aoi21 is
begin
    process(all)
        variable and_i0i1 : std_ulogic;
    begin
        and_i0i1 := I0 and I1;
        O_AOI <= not (and_i0i1 or I2);
    end process;
end architecture Behavioral;

