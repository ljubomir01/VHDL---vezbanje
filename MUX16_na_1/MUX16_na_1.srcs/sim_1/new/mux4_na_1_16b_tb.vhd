

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_na_1_16b_tb is
--  Port ( );
end mux4_na_1_16b_tb;

architecture Behavioral of mux4_na_1_16b_tb is
component mux16_na_1 is
    Port (
    x0 : in std_logic_vector(15 downto 0);
    x1 : in std_logic_vector(15 downto 0);
    x2 : in std_logic_vector(15 downto 0);
    x3 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0);
    sel : in std_logic_vector(1 downto 0)
    );
end component;
signal sx0, sx1, sx2, sx3, sx4, sy : std_logic_vector( 15 downto 0);
signal ssel : std_logic_vector(1 downto 0);
begin
duv: mux16_na_1
    port map(
        x0 => sx0,
        x1 => sx1,
        x2 => sx2,
        x3 => sx3,
        y => sy,
        sel => ssel
);
    sx0 <= "0000000000000000", "0000000000000001" after 200ns;
    sx1 <= "0000000000000000", "0000000000000001" after 400ns;
    sx2 <= "0000000000000000", "0000000000000001" after 600ns;
    sx3 <= "0000000000000000", "0000000000000001" after 800ns;
    ssel <= "00", "01" after 250ns, "10" after 400ns, "11" after 550ns;
end Behavioral;
