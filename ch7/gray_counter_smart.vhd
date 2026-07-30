library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_counter_smart is
    generic (
        WIDTH : integer := 4
    );
    port (
        clk    : in  std_logic;
        rst_n  : in  std_logic;
        q_gray : out std_logic_vector(WIDTH-1 downto 0)
    );
end gray_counter_smart;

architecture behavioural of gray_counter_smart is
    signal q_gray_reg : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin
    -- Unified algorithmic transformation and registration process loop
    process(clk, rst_n)
        variable binary_val  : std_logic_vector(WIDTH-1 downto 0);
        variable binary_next : unsigned(WIDTH-1 downto 0);
        variable gray_next   : std_logic_vector(WIDTH-1 downto 0);
    begin
        if rst_n = '0' then
            q_gray_reg <= (others => '0');
        elsif rising_edge(clk) then
            -- 1. Convert current registered Gray code value back into binary
            binary_val(WIDTH-1) := q_gray_reg(WIDTH-1);
            for i in WIDTH-2 downto 0 loop
                binary_val(i) := binary_val(i+1) xor q_gray_reg(i);
            end loop;

            -- 2. Increment recovered binary vector via standard addition
            binary_next := unsigned(binary_val) + 1;

            -- 3. Convert next binary state vector back into a Gray token
            gray_next := std_logic_vector(binary_next xor (binary_next shift_right 1));

            -- Sequential register allocation
            q_gray_reg <= gray_next;
        end if;
    end process;

    q_gray <= q_gray_reg;
end behavioural;