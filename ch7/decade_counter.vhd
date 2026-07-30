library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decade_counter is
    generic (
        WIDTH : integer := 4 -- Baseline bit-width for BCD encoding
    );
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        q     : out std_logic_vector(WIDTH-1 downto 0)
    );
end decade_counter;

architecture behavioural of decade_counter is
    signal q_reg : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
    -- Register allocation and conditional boundary process loop
    process(clk, rst_n)
    begin
        if rst_n = '0' then -- Asynchronous reset
            q_reg <= (others => '0');
        elsif rising_edge(clk) then
            -- Explicit conditional boundary acting as a synchronous reset mux
            if q_reg >= 9 then
                q_reg <= (others => '0'); -- Synchronous reset to zero if q>=9
            else
                q_reg <= q_reg + 1;       -- Standard incremental progression step
            end if;
        end if;
    end process;

    q <= std_logic_vector(q_reg);
end behavioural;