
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registri is
    Port (
    d : in std_logic_vector(3 downto 0);
    q : out std_logic_vector(3 downto 0);
    clk : in std_logic;
    ce : in std_logic;
    reset : in std_logic
    );
end registri;

architecture Behavioral of registri is

begin
process(clk)
begin
    if(reset = '1') then
        q <= "0001";
    else
        if(clk'event and clk = '1') then
            if(ce = '1') then
                q <= d;
            end if;
        end if;
    end if;
end process;

end Behavioral;
