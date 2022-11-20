

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiply_tb is
--  Port ( );
end multiply_tb;

architecture Behavioral of multiply_tb is
component multiply is
    Port (
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    C0 : out std_logic;
    C1 : out std_logic;
    C2 : out std_logic;
    C3 : out std_logic
    );
end component;
    signal sa0 : std_logic;
    signal sa1 : std_logic;
    signal sb0 : std_logic;
    signal sb1 : std_logic;
    signal sc0 : std_logic;
    signal sc1 : std_logic;
    signal sc2 : std_logic;
    signal sc3 : std_logic;
begin
    duv: multiply
    port map(
    A0 => sa0,
    A1 => sa1,
    B0 => sb0,
    B1 => sb1,
    C0 => sc0,
    C1 => sc1,
    C2 => sc2,
    C3 => sc3
    );
    sim: process
    begin
        sa0 <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns, '0' after 800ns;
        sa1 <= '0', '1' after 400ns, '0' after 800ns;
        sb0 <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns, '0' after 800ns;
        sb1 <= '0', '1' after 400ns, '0' after 800ns;
    wait;
    end process;
end Behavioral;
