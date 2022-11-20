

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipFlop is
    Port (
    clk : in std_logic;
    D : in std_logic;
    Q : out std_logic
    );
end flipFlop;

architecture Behavioral of flipFlop is

begin
    dff: process (clk)
    begin
        if(clk'event and clk = '1') then
            q <= d;
        end if;
    end process;

end Behavioral;
