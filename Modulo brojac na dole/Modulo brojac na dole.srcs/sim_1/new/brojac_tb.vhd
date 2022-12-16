
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity brojac_tb is
--  Port ( );
end brojac_tb;

architecture Behavioral of brojac_tb is
component brojac is
Port (
    clk : in std_logic;
    q : out std_logic_vector(7 downto 0)
);
end component;
signal clk_s : std_logic;
signal q_s : std_logic_vector(7 downto 0);
begin
duv: brojac
    port map(
        clk => clk_s,
        q => q_s
    );
clk_gen:process
begin
    clk_s <= '0', '1' after 100ns;
    wait for 200ns;
end process;

end Behavioral;
