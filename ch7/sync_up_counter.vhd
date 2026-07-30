library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync_up_counter is
    generic (
        WIDTH : integer := 4
    );
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        q     : out std_logic_vector(WIDTH-1 downto 0)
    );
end sync_up_counter;

architecture behavioural of sync_up_counter is
    signal q_reg : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
    -- Register allocation and arithmetic process loop
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            q_reg <= (others => '0');
        elsif rising_edge(clk) then
            q_reg <= q_reg + 1; -- Synchronous progression assignment
        end if;
    end process;

    q <= std_logic_vector(q_reg);
end behavioural;