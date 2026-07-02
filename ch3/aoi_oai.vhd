library ieee;
use ieee.std_logic_1164.all;

entity aoi_oai is
    port (
        I0 : in  std_ulogic;
        I1 : in  std_ulogic;
        I2 : in  std_ulogic;
        O_AOI : out std_ulogic;
        O_OAI : out std_ulogic
    );
end entity aoi_oai;

architecture Behavioral of aoi_oai is
begin
    process(all)
        variable and_i0i1 : std_ulogic;
        variable or_i0i1  : std_ulogic;
    begin
        and_i0i1 := I0 and I1;
        or_i0i1  := I0 or  I1;

        O_AOI <= not (and_i0i1 or I2);
        O_OAI <= not (or_i0i1  and I2);
    end process;
end architecture Behavioral;

