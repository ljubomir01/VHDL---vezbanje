
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity pipo_tb is
--Port ( );
end pipo_tb;

architecture Behavioral of pipo_tb is
component registar is
    Port (
    d : in std_logic_vector(7 downto 0);
    clk : in std_logic;
    q : out std_logic_vector(7 downto 0)
    );
end component;
signal sq, sd : std_logic_vector(7 downto 0);
signal sclk : std_logic;
begin
duv: registar
port map(
    q => sq,
    d => sd,
    clk => sclk
);

clk_gen: process
    begin
        sclk <= '0', '1' after 100ns;
        wait for 200ns;
    end process;
    stim_gen: process
    begin
        sd <= "00000000", "00000001" after 80ns, "00000011" after 160ns, "00001111" after 365ns;
        wait;
    end process;
end Behavioral;
