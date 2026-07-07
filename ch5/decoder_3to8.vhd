library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_3to8 is
    Port ( E : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end decoder_3to8;

architecture Structural of decoder_3to8 is
    signal E_lower, E_upper : STD_LOGIC;
begin
    E_lower <= E and not A(2);
    E_upper <= E and A(2);

    lower_half: entity work.decoder_2to4
        port map (E => E_lower, A => A(1 downto 0), Y => Y(3 downto 0));

    upper_half: entity work.decoder_2to4
        port map (E => E_upper, A => A(1 downto 0), Y => Y(7 downto 4));
end Structural;