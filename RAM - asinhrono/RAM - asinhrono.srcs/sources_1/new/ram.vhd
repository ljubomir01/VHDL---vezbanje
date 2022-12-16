
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ram is
Port (
    address : in std_logic_vector(9 downto 0);
    rdata : out std_logic_vector(31 downto 0);
    wdata : in std_logic_vector(31 downto 0);
    write : in std_logic;
    clk : in std_logic
);
end ram;

architecture Behavioral of ram is
type ram_type_t is array (0 to 1023) of std_logic_vector(31 downto 0);
signal ram_s : ram_type_t;
begin
write_ram: process(clk) is 
begin
if (clk'event and clk = '1') then
    if(write = '1') then
        ram_s(to_integer(unsigned(address))) <= wdata;
    end if;
end if;
end process;
rdata <= ram_s(to_integer(unsigned(address)));

end Behavioral;
