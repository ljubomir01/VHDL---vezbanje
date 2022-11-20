
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlop is
    Port (
    clk : in std_logic;
    J : in std_logic;
    K : in std_logic;
    Q : out std_logic
    );
end FlipFlop;

architecture Behavioral of FlipFlop is
    
begin
diff:process(clk) is
    begin
        if(clk'event and clk = '1') then
           if(J = '0' and K = '1') then
            Q <= J;
           elsif(J = '1' and K = '0') then
            Q <= J;
            end if;
            end if;
            end process;

end Behavioral;
