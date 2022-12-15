
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity banka is
Port (
    clk : in std_logic;
    raddress1 : in std_logic_vector(2 downto 0);
    rdata1 : out std_logic_vector(7 downto 0);
    raddress2 : in std_logic_vector(2 downto 0);
    rdata2 : out std_logic_vector(7 downto 0);
    waddress1 : in std_logic_vector(2 downto 0);
    wdata1 : in std_logic_vector(7 downto 0);
    write1 : in std_logic
);
end banka;
--sinhrono citanje
architecture Behavioral of banka is
type reg_file_t is array(0 to 7) of std_logic_vector(7 downto 0);
signal reg_file_s : reg_file_t;
begin
write_reg_file: process(clk)
begin
    if(clk'event and clk = '1') then
        if(write1 = '1') then
            reg_file_s(to_integer(unsigned(waddress1))) <= wdata1;
        end if;
    end if;
end process;
read_reg_file: process(clk) is
begin
    if(clk'event and clk = '1') then
        rdata1 <= reg_file_s(to_integer(unsigned(raddress1)));
        rdata2 <= reg_file_s(to_integer(unsigned(raddress2)));
    end if;
end process;
end Behavioral;
