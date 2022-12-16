library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memorija_tb is
--  Port ( );
end memorija_tb;

architecture Behavioral of memorija_tb is
component memorija is
Port (
    clk : in std_logic;
    address : in std_logic_vector(4 downto 0);
    rdata : out std_logic_vector(19 downto 0)
);
end component;
signal clk_s : std_logic;
signal address_s : std_logic_vector(4 downto 0);
signal rdata_s : std_logic_vector(19 downto 0);
begin
duv: memorija
    port map(
        clk => clk_s,
        address => address_s,
        rdata => rdata_s
    );
clk_gen: process
begin
    clk_s <= '0', '1' after 100ns;
    wait for 200ns;
end process;
stim_gen: process
begin
    address_s <= (others => '0');
    for i in 0 to 31 loop
        address_s <= std_logic_vector(to_unsigned(i, 5));
        wait for 200ns;
    end loop;
    wait;
end process;
end Behavioral;
