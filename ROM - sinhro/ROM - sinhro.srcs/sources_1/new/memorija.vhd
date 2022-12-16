library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memorija is
Port (
    clk : in std_logic;
    address : in std_logic_vector(4 downto 0);
    rdata : out std_logic_vector(19 downto 0)
);
end memorija;

architecture Behavioral of memorija is
type rom_type_t is array(0 to 31) of std_logic_vector(19 downto 0);
signal rom_s : rom_type_t:=(
    X"00F00", X"00F01", X"00F02", X"00F03", X"00F04",
    X"00F05", X"00F06", X"00F07", X"00F08", X"00F09",
    X"00F0A", X"00F0B", X"00F0C", X"00F0D", X"00F0E",
    X"00F0F", X"00F10", X"00F11", X"00F12", X"00F13",
    X"00F14", X"00F15", X"00F16", X"00F17", X"00F18",
    X"00F19", X"00F1A", X"00F1B", X"00F1C", X"00F1D",
    X"00F1E", X"00F1F");
begin
rom: process(clk)
begin
    if(clk'event and clk = '1') then
        rdata <= rom_s(to_integer(unsigned(address)));
    end if;
end process;

end Behavioral;
