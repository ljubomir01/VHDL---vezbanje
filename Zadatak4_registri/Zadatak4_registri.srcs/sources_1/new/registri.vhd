
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registri is
    Port (
    d : in std_logic;
    q : out std_logic;
    clk : in std_logic;
    ce : in std_logic;
    set : in std_logic;
    we : in std_logic
    );
end registri;

architecture Behavioral of registri is
begin
process(clk)
begin
    if(clk'event and clk = '1') then
        if(ce = '1') then 
            if(we = '1') then
                if(set = '1') then
                    q <= '1';
                end if;
            end if;
        else
            q <= d;
        end if;
    end if;
end process;
end Behavioral;
