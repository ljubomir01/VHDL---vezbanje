
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_tb is
--  Port ( );
end shift_tb;

architecture Behavioral of shift_tb is
component shift_struct is
    Port (
    x0, x1, x2, x3, shift : in std_logic;
    y0, y1, y2, y3, k : out std_logic
    );
end component;
    signal sx0, sx1, sx2, sx3, sshift : std_logic;
    signal sy0, sy1, sy2, sy3, sk : std_logic;
begin
    duv: shift_struct
    port map(
    x0 => sx0,
    x1 => sx1,
    x2 => sx2, 
    x3 => sx3,
    shift => sshift,
    y0 => sy0,
    y1 => sy1,
    y2 => sy2,
    y3 => sy3,
    k => sk
    );
    sshift <= '0', '1' after 500ns;
    sx0 <= '0', '1' after 250ns, '0' after 500ns, '1' after 750ns;
    sx1 <= '0', '1' after 250ns, '0' after 500ns, '1' after 750ns;
    sx2 <= '0', '1' after 250ns, '0' after 500ns, '1' after 750ns;
    sx3 <= '0', '1' after 250ns, '0' after 500ns, '1' after 750ns;
end Behavioral;
