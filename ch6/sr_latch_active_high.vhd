library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sr_latch_active_high is
    port (
        S     : in  STD_LOGIC;
        R     : in  STD_LOGIC;
        Q     : out STD_LOGIC;
        Q_bar : out STD_LOGIC
    );
end entity sr_latch_active_high;

architecture dataflow of sr_latch_active_high is
    signal q_net     : STD_LOGIC;
    signal q_bar_net : STD_LOGIC;
begin

    -- Concurrent cross-coupled NOR expressions utilizing internal signals
    q_net     <= R nor q_bar_net;
    q_bar_net <= S nor q_net;

    -- Route internal signal networks to external port boundaries
    Q     <= q_net;
    Q_bar <= q_bar_net;

end architecture dataflow;