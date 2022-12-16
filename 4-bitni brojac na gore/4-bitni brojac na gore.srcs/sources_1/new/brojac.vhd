library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity brojac is
Port (
    clk : in std_logic;
    q : out std_logic_vector(3 downto 0)
);
end brojac;

architecture Behavioral of brojac is
signal count_s:std_logic_vector(3 downto 0):= (others => '0');
begin
cnt: process(clk)
begin
    if(clk'event and clk = '1') then
        count_s <= std_logic_vector(unsigned(count_s) + 1);
    end if;
end process;
q <= count_s;
end Behavioral;
