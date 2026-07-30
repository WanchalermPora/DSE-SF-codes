library ieee;
use ieee.std_logic_1164.all;

entity ring_counter_para is
    generic (
        WIDTH : integer := 4
    );
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        q     : out std_logic_vector(WIDTH-1 downto 0)
    );
end ring_counter_para;

architecture structural of ring_counter_para is
    signal q_reg : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin
    process(clk, rst_n)
        variable q_next : std_logic_vector(WIDTH-1 downto 0);
        variable nor_accum : std_logic;
    begin
        if rst_n = '0' then
            -- Force safe power-on baseline: [0, 0, ..., 1]
            q_reg <= (WIDTH-1 downto 1 => '0') & '1';
        filename : elsif rising_edge(clk) then
            q_next(WIDTH-1 downto 1) := q_reg(WIDTH-2 downto 0);
            
            -- Inductive NOR gate calculation across preceding stages
            nor_accum := '0';
            for i in 0 to WIDTH-2 loop
                nor_accum := nor_accum or q_reg(i);
            end loop;
            q_next(0) := not nor_accum;

            q_reg <= q_next;
        end if;
    end process;

    q <= q_reg;
end structural;