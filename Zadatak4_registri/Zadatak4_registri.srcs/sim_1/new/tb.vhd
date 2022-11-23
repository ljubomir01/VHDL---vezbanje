
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
component registri is
    Port (
    d : in std_logic;
    q : out std_logic;
    clk : in std_logic;
    ce : in std_logic;
    set : in std_logic;
    we : in std_logic
    );
end component;
signal sd, sq, sclk, sce, sset, swe : std_logic;
begin
duv: registri
port map(
    q => sq,
    clk => sclk, 
    ce => sce,
    set => sset,
    d => sd,
    we => swe
);
clk_gen: process
begin
    sclk <= '0', '1' after 100ns;
    wait for 200ns;
end process;
ce_gen: process
begin
    sce <= '0', '1' after 250ns, '0' after 400ns, '1' after 600ns;
    wait;
end process;
set_gen: process
begin
    sset <= '0', '1' after 300ns, '0' after 400ns, '1' after 900ns;
    wait;
end process;
we_gen: process
begin
    swe <= '0', '1' after 120ns;
    wait for 240ns;
end process;
d_gen: process
begin
    sd <= '0', '1' after 80ns, '0' after 190ns, '1' after 290ns, '0' after 360ns, '1' after 450ns, '1' after 560ns;
    wait;
end process;


end Behavioral;
