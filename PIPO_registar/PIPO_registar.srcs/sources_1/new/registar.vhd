
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity registar is
    Port (
    d : in std_logic_vector(7 downto 0);
    clk : in std_logic;
    q : out std_logic_vector(7 downto 0)
    );
end registar;

architecture Behavioral of registar is

begin
    process(clk)
        begin
            if(clk'event and clk = '1') then
                q <= d;
            end if;
        end process;

end Behavioral;
