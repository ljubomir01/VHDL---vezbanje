
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registar is
Port (
    d : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    shift : in std_logic;
    q : out std_logic
);
end registar;

architecture Behavioral of registar is
signal q_s : std_logic_vector(3 downto 0);
begin
reg: process(clk) is
begin 
    if(clk' event and clk = '1') then
        if(shift = '0') then
            q_s <= d;
        else
            q <= q_s(0);
            q_s <= '0' & q_s(3 downto 1);
            end if;
        end if;
end process;

end Behavioral;
