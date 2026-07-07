-- File: alu_param.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_param is
    generic (
        WIDTH : integer := 8 -- Scalable data path parameter width
    );
    Port ( A        : in  STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
           B        : in  STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
           Op       : in  STD_LOGIC_VECTOR (2 downto 0); -- Functional Opcode
           Result   : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
           Zero     : out STD_LOGIC;     -- Z Flag
           Carry    : out STD_LOGIC;     -- C Flag
           Overflow : out STD_LOGIC;     -- V Flag
           Negative : out STD_LOGIC);    -- N Flag
end alu_param;

architecture Behavioural of alu_param is
begin
    process(A, B, Op)
        variable res_val  : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
        variable math_ext : unsigned(WIDTH downto 0);
        variable sign_A   : STD_LOGIC;
        variable sign_B   : STD_LOGIC;
    begin
        -- Default initialisations
        res_val  := (others => '0');
        math_ext := (others => '0');
        Carry    <= '0';
        Overflow <= '0';
        
        sign_A   := A(WIDTH - 1);
        sign_B   := B(WIDTH - 1);

        case Op is
            when "000" => -- Addition
                math_ext := unsigned('0' & A) + unsigned('0' & B);
                res_val  := STD_LOGIC_VECTOR(math_ext(WIDTH - 1 downto 0));
                Carry    <= math_ext(WIDTH);
                
                -- Signed Overflow check: same sign inputs, opposite sign output
                if (sign_A = sign_B) and (res_val(WIDTH - 1) /= sign_A) then
                    Overflow <= '1';
                end if;

            when "001" => -- Subtraction
                math_ext := unsigned('0' & A) - unsigned('0' & B);
                res_val  := STD_LOGIC_VECTOR(math_ext(WIDTH - 1 downto 0));
                Carry    <= math_ext(WIDTH);
                
                -- Signed Overflow check: differing sign inputs, mismatched output sign
                if (sign_A /= sign_B) and (res_val(WIDTH - 1) /= sign_A) then
                    Overflow <= '1';
                end if;

            when "010" => res_val := A and B; -- AND
            when "011" => res_val := A or B;  -- OR
            when "100" => res_val := A xor B; -- XOR
            when "101" => res_val := not A;   -- NOT

            when "110" => -- Logical Shift Left
                res_val := A(WIDTH - 2 downto 0) & '0';

            when "111" => -- Logical Shift Right
                res_val := '0' & A(WIDTH - 1 downto 1);

            when others =>
                res_val := (others => '0');
        end case;

        -- Status flag validation blocks
        if res_val = STD_LOGIC_VECTOR(to_unsigned(0, WIDTH)) then
            Zero <= '1';
        else
            Zero <= '0';
        end if;

        Negative <= res_val(WIDTH - 1); -- Driving N directly from MSB
        Result   <= res_val;            -- Drive the main structural output port
    end process;
end Behavioural;