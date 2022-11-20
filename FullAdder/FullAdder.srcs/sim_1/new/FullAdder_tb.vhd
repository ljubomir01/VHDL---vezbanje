

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder_tb is
--  Port ( );
end FullAdder_tb;

architecture Behavioral of FullAdder_tb is
component fullAdder is
    Port (
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    S : out std_logic;
    Cout : out std_logic
    );
end component;
    signal sa : std_logic;
    signal sb : std_logic;
    signal scin : std_logic;
    signal ss : std_logic;
    signal scout : std_logic;
    begin
    duv: fullAdder
    port map(
        A => sa,
        B => sb,
        Cin => scin,
        S => ss,
        Cout => scout
    );
    stim_gen: process
    begin
        sa <= '0', '1' after 400ns, '0' after 800ns;
        sb <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns, '0' after 800ns;
        scin <= '0', '1' after 100ns, '0' after 200ns,'1' after 300ns, '0' after 400ns,'1' after 500ns, '0' after 600ns,'1' after 700ns, '0' after 800ns;
    wait;
    end process;
end architecture Behavioral;
