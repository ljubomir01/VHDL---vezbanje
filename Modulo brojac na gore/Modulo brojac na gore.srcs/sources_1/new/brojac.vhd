
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity brojac is
Port (
    clk : in std_logic;
    q : out std_logic_vector(7 downto 0)
);
end brojac;

architecture Behavioral of brojac is
signal count_s:std_logic_vector(7 downto 0):= (others => '0');
begin
cnt:process(clk)
begin
if(clk'event and clk = '1')then
    if(count_s < std_logic_vector(to_unsigned(154, 8)))then
        count_s <= std_logic_vector(unsigned(count_s) + 1);
    else
        count_s <= (others => '0');
    end if;
end if;
end process;
q <= count_s;

end Behavioral;
