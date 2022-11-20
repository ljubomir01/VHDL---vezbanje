

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity halfadder_tb is

end halfadder_tb;

architecture Behavioral of halfadder_tb is
component halfadder
Port (
    A : in std_logic;
    B : in std_logic;
    S : out std_logic;
    C : out std_logic
);
end component halfadder;
    signal sa : std_logic;
    signal sb : std_logic;
    signal ss : std_logic;
    signal sc : std_logic;
begin
    sabirac: halfadder
    port map(A => sa, B => sb, C => sc, S => ss);
    tb : process
    begin
        sa <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns, '0' after 800 ns;
        sb <= '0', '1' after 400 ns, '0' after 800 ns;
        wait;
    end process;

end Behavioral;
