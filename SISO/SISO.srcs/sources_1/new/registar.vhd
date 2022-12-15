
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registar is
Port ( 
    clk : in std_logic;
    d : in std_logic;
    q : out std_logic
);
end registar;

architecture Behavioral of registar is
signal q_s : std_logic_vector(3 downto 0);
begin
reg: process(clk) is
begin 
    if(clk'event and clk = '1') then
        q_s <= d & q_s(3 downto 1);
    end if;
end process;
q <= q_s(0);

end Behavioral;
