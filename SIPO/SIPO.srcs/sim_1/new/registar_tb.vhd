
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registar_tb is
--  Port ( );
end registar_tb;

architecture Behavioral of registar_tb is
component registar is
Port (
    d : in std_logic;
    clk : in std_logic;
    q : out std_logic_vector(3 downto 0)
);
end component;
signal sd, sclk : std_logic;
signal sq : std_logic_vector(3 downto 0);
begin
duv: registar
port map(
    clk => sclk,
    d => sd,
    q => sq
);
clk_gen: process
begin
    sclk <= '0', '1' after 100ns;
    wait for 200ns;
    end process;
stim_gen: process
    begin
    sd <= '0', '1' after 75ns, '0' after 150ns, '1' after 275ns, '0' after 550ns;
    wait;
end process;
end Behavioral;
