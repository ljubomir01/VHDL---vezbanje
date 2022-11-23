
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registri_tb is
--  Port ( );
end registri_tb;

architecture Behavioral of registri_tb is
component registri is
    Port (
    d : in std_logic_vector(3 downto 0);
    q : out std_logic_vector(3 downto 0);
    clk : in std_logic;
    ce : in std_logic;
    reset : in std_logic
    );
end component;
signal sd, sq : std_logic_vector(3 downto 0);
signal sclk, sce, sreset : std_logic;
begin
duv: registri
port map(
    q => sq,
    clk => sclk, 
    ce => sce,
    reset => sreset,
    d => sd
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
reset_gen: process
begin
    sreset <= '0', '1' after 300ns, '0' after 400ns, '1' after 900ns;
    wait;
end process;
d_gen: process
begin
    sd <= "0000", "0001" after 80ns, "0101" after 190ns, "0111" after 290ns, "0000" after 360ns, "1111" after 450ns, "1000" after 560ns;
    wait;
end process;
end Behavioral;
