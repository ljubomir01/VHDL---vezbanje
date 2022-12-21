library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
entity brojac is
Port (
    clk : in std_logic;
    en : in std_logic;
    ce : in std_logic;
    load : in std_logic;
    counter_value : in std_logic_vector(7 downto 0);
    count : out std_logic_vector(7 downto 0)
);
end brojac;

architecture Behavioral of brojac is
signal count_s: std_logic_vector(7 downto 0):=(others => '0');
begin
cnt: process(clk)
begin
if(en = '1') then
    if(clk'event and clk = '1') then
        if(ce = '1') then
            if(load <= '1') then
                count_s <= counter_value;
            else
                count_s <= std_logic_vector(unsigned(count_s) + 1);
            end if;
        end if;
    end if;
end if;
end process;
count <= count_s;

end Behavioral;
