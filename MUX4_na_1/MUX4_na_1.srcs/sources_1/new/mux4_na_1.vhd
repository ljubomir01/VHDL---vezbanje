
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_na_1 is
    Port (
    x1, x2, x3, x4 : in std_logic;
    sel : in std_logic_vector(1 downto 0);
    y : out std_logic
    );
end mux4_na_1;

architecture Behavioral of mux4_na_1 is

begin
    mux4: process(x1, x2, x3, x4, sel(1 downto 0))
    begin
        if(sel(1 downto 0) = "00") then
            y <= x1;
        elsif(sel(1 downto 0) = "01") then
            y <= x2;
        elsif(sel(1 downto 0) = "10") then
            y <= x3;
        else y <= x4;
        end if;
    end process;

end Behavioral;
