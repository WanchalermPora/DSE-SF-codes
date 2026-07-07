library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_2to4 is
    Port ( E : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end decoder_2to4;

architecture Behavioural of decoder_2to4 is
begin
    process(E, A)
    begin
        if E = '0' then
            Y <= "0000";
        else
            case A is
                when "00" => Y <= "0001";
                when "01" => Y <= "0010";
                when "10" => Y <= "0100";
                when "11" => Y <= "1000";
                when others => Y <= "0000";
            end case;
        end if;
    end process;
end Behavioural;