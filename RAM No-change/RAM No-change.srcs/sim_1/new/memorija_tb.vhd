library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memorija_tb is
--  Port ( );
end memorija_tb;

architecture Behavioral of memorija_tb is
component memorija is
Port (
    clk : in std_logic;
    write : in std_logic;
    address : in std_logic_vector(9 downto 0);
    rdata : out std_logic_vector(31 downto 0);
    wdata : in std_logic_vector(31 downto 0)
);
end component;
signal clk_s, write_s : std_logic;
signal address_s : std_logic_vector(9 downto 0);
signal rdata_s, wdata_s : std_logic_vector(31 downto 0);
begin
duv: memorija
    port map(
        clk => clk_s,
        write => write_s,
        address => address_s,
        rdata => rdata_s,
        wdata => wdata_s
    );
clk_gen: process
begin
    clk_s <= '0', '1' after 100ns;
    wait for 200ns;
end process;
stim_gen: process
begin
    address_s <= (others => '0');
    wdata_s <= (others => '0');
    write_s <= '0';
    
    wait for 200ns;
    write_s <= '1';
    for i in 0 to 1023 loop
        address_s <= std_logic_vector(to_unsigned(i, 10));
        wdata_s <= std_logic_vector(to_unsigned(2*i+1, 32));
        wait for 200ns;
    end loop;
    write_s <= '0';
    wait for 200ns;
    for i in 0 to 1023 loop
        address_s <= std_logic_vector(to_unsigned(i, 10));
        wait for 200ns;
    end loop;
end process;

end Behavioral;
