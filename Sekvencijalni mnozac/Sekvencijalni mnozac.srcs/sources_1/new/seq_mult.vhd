library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity seq_mult is
generic(WIDTH:positive:= 8);
Port (
    clk : in std_logic;
    reset : in std_logic;
    a_in : in std_logic_vector(WIDTH-1 downto 0);
    b_in : in std_logic_vector(WIDTH-1 downto 0);
    start : in std_logic;
    r_out : out std_logic_vector(2*WIDTH-1 downto 0);
    ready : out std_logic
);
end seq_mult;

architecture struct of seq_mult is
signal a_is_0_s, b_is_0_s, count_0_s : std_logic;
signal sel_s : std_logic_vector(1 downto 0);
begin
controlpath: entity work.control_path(beh)
    port map(
        clk => clk,
        reset => reset,
        start => start,
        count_0 => count_0_s,
        a_is_0 => a_is_0_s,
        b_is_0 => b_is_0_s,
        sel => sel_s,
        ready => ready
    );
datapath: entity work.data_path(struct)
    generic map(WIDTH => WIDTH)
    port map(
        clk => clk,
        a_in => a_in,
        b_in => b_in,
        sel => sel_s,
        count_0 => count_0_s,
        a_is_0 => a_is_0_s,
        b_is_0 => b_is_0_s,
        r_out => r_out
    );
end struct;
