
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity memorija is
Port (
    clk : in std_logic;
    address : in std_logic_vector(5 downto 0);
    rdata : out std_logic_vector(15 downto 0);
    wdata : in std_logic_vector(15 downto 0);
    write : in std_logic;
    reset : in std_logic;
    ce : in std_logic
);
end memorija;

architecture Behavioral of memorija is
type ram_type_t is array(0 to 64) of std_logic_vector(15 downto 0);
signal ram_s:ram_type_t;
begin
ram: process(clk)
begin
    if(reset = '1') then
        rdata <= "0000000000000001";
    else
        if(clk'event and clk = '1') then
            if(ce = '1') then
                if(write = '1') then
                    ram_s(to_integer(unsigned(address))) <= wdata;
                    rdata <= wdata;
                else
                    rdata <= ram_s(to_integer(unsigned(address)));
                end if;
            end if;
        end if;
    end if;
end process;

end Behavioral;
