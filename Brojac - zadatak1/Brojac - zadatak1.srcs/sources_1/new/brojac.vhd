library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity brojac is
Port (
    clk : in std_logic;
    ce : in std_logic;
    en : in std_logic;
    reset : in std_logic;
    count : out std_logic_vector(7 downto 0)
);
end brojac;

architecture Behavioral of brojac is
signal count_s: std_logic_vector(7 downto 0):= (others => '0');
begin
process(clk)
begin
    if(en = '1') then
        if(clk'event and clk = '1') then
            if(ce = '1') then
                if(reset = '1') then
                    count_s <= (others => '0');
                else
                    count_s <= std_logic_vector(unsigned(count_s) + 1);
                end if;
            end if;
        end if;
    end if;
end process;
count <= count_s;

end Behavioral;
