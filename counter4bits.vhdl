-- 4-bit Up Counter
entity counter_4bit is
  port (clk, reset: in std_logic; count: out std_logic_vector (3 downto 0));
end entity;

architecture behavioral of counter_4bit is
begin
  process (clk, reset)
  begin
    if reset = '1' then
      count <= "0000";
    elsif rising_edge(clk) then
      count <= std_logic_vector(unsigned(count) + 1); 
    end if;
  end process;
end architecture;