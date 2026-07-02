library ieee;
use ieee.std_logic_1164.all;

entity nand2 is
    port (
        I0 : in  std_ulogic;
        I1 : in  std_ulogic;
        O_NAND : out std_ulogic
    );
end entity nand2;

architecture direct of nand2 is
begin
    O_NAND <= I0 nand I1;
end architecture direct;

architecture alternative of nand2 is
begin
    O_NAND <= (not I0) or (not I1) after 2 ns;
end architecture alternative;

