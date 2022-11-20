

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity majorityVoter_tb is
--  Port ( );
end majorityVoter_tb;

architecture Behavioral of majorityVoter_tb is
component majorityVoter is
    Port (
    X : in std_logic;
    Y : in std_logic;
    Z : in std_logic;
    V : out std_logic
    );
end component;
    signal sx : std_logic;
    signal sy : std_logic;
    signal sz : std_logic;
    signal sv : std_logic;
begin
    duv: majorityVoter
    port map(
    X => sx,
    Y => sy,
    Z => sz,
    V => sv
    );
    stim_gen: process
    begin
        sx <= '0', '1' after 400ns, '0' after 800ns;
        sy <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns, '0' after 800ns;
        sz <= '0', '1' after 100ns, '0' after 200ns, '1' after 300ns, '0' after 400ns, '1' after 500ns, '0' after 600ns, '1' after 700ns, '0' after 800ns;
    wait;
    end process;

end Behavioral;
