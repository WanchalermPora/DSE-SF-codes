library ieee;
use ieee.std_logic_1164.all;

entity johnson_counter_ft is
    generic (
        WIDTH : integer := 4 -- Scalable width parameter
    );
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        q     : out std_logic_vector(WIDTH-1 downto 0)
    );
end johnson_counter_ft;

architecture behavioural of johnson_counter_ft is
    signal q_reg : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
        variable q_next : std_logic_vector(WIDTH-1 downto 0);
        variable intermediate_zeroes : std_logic;
    begin
        if rst_n = '0' then
            q_reg <= (others => '0'); -- Safe deterministic power-on vector
        elsif rising_edge(clk) then
            q_next(WIDTH-1 downto 1) := q_reg(WIDTH-2 downto 0);
            
            -- Inductive checking across intermediate bits from 1 to WIDTH-2
            intermediate_zeroes := '1';
            for i in 1 to WIDTH-2 loop
                intermediate_zeroes := intermediate_zeroes and (not q_reg(i));
            end loop;
            
            -- D_0 = Q_n-1' + (Q_n-2' ... Q_1' * Q_0)
            q_next(0) := (not q_reg(WIDTH-1)) or (intermediate_zeroes and q_reg(0));
            
            q_reg <= q_next;
        end if;
    end process;

    q <= q_reg;
end behavioural;