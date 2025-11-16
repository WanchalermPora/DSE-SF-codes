-- D Flip-flop
entity d_flipflop is
  port (clk, d: in std_logic; q: out std_logic);
end entity;

architecture behavioral of d_flipflop is
begin
  process (clk)
  begin
    if rising_edge(clk) then
      q <= d;
    end if;
  end process;
end architecture;