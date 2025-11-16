-- AND Gate
entity and_gate is
  port (a, b: in bit; out: out bit);
end entity;

architecture behavioral of and_gate is
begin
  out <= a and b;
end architecture;

-- OR Gate
entity or_gate is
  port (a, b: in bit; out: out bit);
end entity;

architecture behavioral of or_gate is
begin
  out <= a or b;
end architecture;

-- NOT Gate
entity not_gate is
  port (a: in bit; out: out bit);
end entity;

architecture behavioral of not_gate is
begin
  out <= not a;
end architecture;