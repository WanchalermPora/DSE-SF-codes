library ieee;
use ieee.std_logic_1164.all;

entity ripple_counter is
    generic (
        WIDTH : integer := 4
    );
    port (
        clk   : in  std_logic;
        rst_n : in  std_logic;
        q     : out std_logic_vector(WIDTH-1 downto 0)
    );
end ripple_counter;

architecture structural of ripple_counter is
    signal q_reg     : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal q_bar_reg : std_logic_vector(WIDTH-1 downto 0) := (others => '1');
    signal clk_line  : std_logic_vector(WIDTH-1 downto 0);
begin
    clk_line(0) <= clk;
    
    gen_clk_matrix: for i in 1 to WIDTH-1 generate
        clk_line(i) <= q_bar_reg(i-1);
    end generate;

    gen_counter: for i in 0 to WIDTH-1 generate
    begin
        process(clk_line(i), rst_n)
        begin
            if rst_n = '0' then
                q_reg(i)     <= '0';
                q_bar_reg(i) <= '1';
            elsif rising_edge(clk_line(i)) then
                q_reg(i)     <= not q_reg(i);
                q_bar_reg(i) <= not q_bar_reg(i);
            end if;
        end process;
    end generate;

    q <= q_reg;
end structural;