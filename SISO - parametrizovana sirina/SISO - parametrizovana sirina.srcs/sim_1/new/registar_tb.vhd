
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registar_tb is
--  Port ( );
end registar_tb;

architecture Behavioral of registar_tb is
component registar is
    generic (WIDTH:positive:= 8);
    Port (
        clk : in std_logic;
        d : in std_logic;
        q : out std_logic_vector(WIDTH - 1 downto 0)
    );
end component;
signal clk_s, d_8, d_16 : std_logic;
signal q_8 : std_logic_vector(7 downto 0);
signal q_16 : std_logic_vector(15 downto 0);
begin
duv_8 : registar
    port map(
        clk => clk_s,
        q => q_8,
        d => d_8
    );
duv_16 : registar
    generic map(WIDTH => 16)
    port map(
        clk => clk_s,
        q => q_16,
        d => d_16
    );
clk_gen: process
begin
    clk_s <= '0', '1' after 100ns;
    wait for 200ns;
end process;
stim_gen: process
begin 
    d_8 <= '0', '1' after 75ns, '0' after 1600ns;
    d_16 <= '0', '1' after 75ns;
    wait;
end process;
end Behavioral;
