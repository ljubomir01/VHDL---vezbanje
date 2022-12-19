library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity brojac_tb is
--  Port ( );
end brojac_tb;

architecture Behavioral of brojac_tb is
component brojac is
    generic (
        UP : boolean:=true;
        MODUO : positive:=100;
        WIDTH : positive:=7
    );
    Port (
        clk : in std_logic;
        q : out std_logic_vector(WIDTH-1 downto 0)
    );
end component;
signal clk_s : std_logic;
signal up_counter_s : std_logic_vector(2 downto 0);
signal down_counter_s : std_logic_vector(3 downto 0);
begin
up_counter: brojac
    generic map(
        UP => true,
        MODUO => 5,
        WIDTH => 3
    )
    port map(
        clk => clk_s,
        q => up_counter_s
    );
down_counter: brojac
    generic map(
        UP => false,
        MODUO => 10,
        WIDTH => 4
    )
    port map(
        clk => clk_s,
        q => down_counter_s
    );
clk_gen: process
begin
    clk_s <= '0', '1' after 100ns;
    wait for 200ns;
end process;
end Behavioral;
