library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registar is
    generic (WIDTH:positive:= 8);
    Port (
        clk : in std_logic;
        d : in std_logic;
        q : out std_logic_vector(WIDTH - 1 downto 0)
    );
end registar;

architecture Behavioral of registar is
signal q_s:std_logic_vector(WIDTH - 1 downto 0);
begin
reg: process(clk)
begin
    if(clk'event and clk = '1')then
        q_s <= d & q_s(WIDTH-1 downto 1);
    end if;
end process;
q <= q_s;

end Behavioral;
