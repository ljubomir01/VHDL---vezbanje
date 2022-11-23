
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_tb is
--  Port ( );
end reg_tb;

architecture Behavioral of reg_tb is
component registri is
    Port (
    d : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    ce : in std_logic;
    q : out std_logic_vector(3 downto 0)
    );
end component;
signal sd, sq : std_logic_vector(3 downto 0);
signal sclk, sce : std_logic;
begin
duv: registri
port map(
    d => sd,
    clk => sclk,
    ce => sce,
    q => sq
);
sim_gen: process
begin
    sclk <= '0', '1' after 100ns;
    wait for 200ns;
end process;
d_gen: process
begin
    sd <= "0000", "0001" after 80ns, "0011" after 180ns, "0000" after 356ns, "0101" after 460ns, "0111" after 580ns;
    wait;
end process;
ce: process
begin
    sce <= '0', '1' after 200ns, '0' after 500ns, '1' after 650ns, '0' after 800ns;
    wait;
end process;
end Behavioral;
