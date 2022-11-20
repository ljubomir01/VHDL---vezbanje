
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux16_na_1 is
    Port (
    x0 : in std_logic_vector(15 downto 0);
    x1 : in std_logic_vector(15 downto 0);
    x2 : in std_logic_vector(15 downto 0);
    x3 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0);
    sel : in std_logic_vector(1 downto 0)
    );
end mux16_na_1;

architecture Behavioral of mux16_na_1 is

begin
    with sel(1 downto 0) select
        y <= x0 when "00",
            x1 when "01",
            x2 when "10",
            x3 when others;

end Behavioral;
