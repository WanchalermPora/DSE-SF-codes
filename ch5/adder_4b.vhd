-- File: adder_4b.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder_4b is
    Port ( A   : in  STD_LOGIC_VECTOR (3 downto 0);
           B   : in  STD_LOGIC_VECTOR (3 downto 0);
           C_0 : in  STD_LOGIC;
           S   : out STD_LOGIC_VECTOR (3 downto 0);
           C_4 : out STD_LOGIC);
end adder_4b;

-- Architecture 1: Structural Approach (Explicit Interconnect Cascading)
architecture Structural of adder_4b is
    component full_adder_1b is
        Port ( A     : in  STD_LOGIC;
               B     : in  STD_LOGIC;
               C_in  : in  STD_LOGIC;
               S     : out STD_LOGIC;
               C_out : out STD_LOGIC);
    end component;

    signal C : STD_LOGIC_VECTOR(3 downto 1);
begin
    fa0: full_adder_1b port map (A => A(0), B => B(0), C_in => C_0,  S => S(0), C_out => C(1));
    fa1: full_adder_1b port map (A => A(1), B => B(1), C_in => C(1), S => S(1), C_out => C(2));
    fa2: full_adder_1b port map (A => A(2), B => B(2), C_in => C(2), S => S(2), C_out => C(3));
    fa3: full_adder_1b port map (A => A(3), B => B(3), C_in => C(3), S => S(3), C_out => C_4);
end Structural;

-- Architecture 2: Operator-Driven Dataflow (Safe Internal Conversion)
architecture Dataflow of adder_4b is
    signal S_extended : unsigned(4 downto 0);
begin
    -- Ports remain standard vector arrays. Internal mapping treats bit signals 
    -- as mathematical numbers explicitly for arithmetic operators.
    S_extended <= unsigned('0' & A) + unsigned('0' & B) + unsigned("0000" & C_0);
    
    S   <= STD_LOGIC_VECTOR(S_extended(3 downto 0));
    C_4 <= S_extended(4);
end Dataflow;