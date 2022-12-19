
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4_na_1 is
    generic(WIDTH: positive:=8);
    Port (
        x1 : in std_logic_vector(WIDTH - 1 downto 0);
        x2 : in std_logic_vector(WIDTH - 1 downto 0);
        x3 : in std_logic_vector(WIDTH - 1 downto 0);
        x4 : in std_logic_vector(WIDTH - 1 downto 0);
        sel : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(WIDTH - 1 downto 0)
    );
end mux_4_na_1;

architecture Behavioral of mux_4_na_1 is

begin
mux: process(sel, x1, x2, x3, x4)
begin
    case sel is
        when "00" =>
            y <= x1;
        when "01" =>
            y <= x2;
        when "10" =>
            y <= x3;
        when others =>
            y <= x4;
    end case;
end process;

end Behavioral;
