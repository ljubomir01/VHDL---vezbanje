
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity banka_tb is
--  Port ( );
end banka_tb;

architecture Behavioral of banka_tb is
component banka is
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
end component;
signal sclk, swrite1 : std_logic;
signal srdata1, srdata2, swdata1 : std_logic_vector(7 downto 0);
signal sraddress1, sraddress2, swaddress1 : std_logic_vector(2 downto 0);
begin
duv: banka
    port map(
        clk => sclk,
        raddress1 => sraddress1,
        rdata1 => srdata1,
        raddress2 => sraddress2,
        rdata2 => srdata2,
        waddress1 => swaddress1,
        wdata1 => swdata1,
        write1 => swrite1
    );
clk_gen: process
begin
    sclk <= '0', '1' after 100ns;
    wait for 200ns;
end process;
stim_gen: process
begin
    sraddress1 <= (others => '0');
    sraddress2 <= (others => '0');
    swaddress1 <= (others => '0');
    swdata1 <= (others => '0');
    swrite1 <= '0';
    wait for 200ns;
    swrite1 <= '1';
    for i in 0 to 7 loop
        swaddress1 <= std_logic_vector(to_unsigned(i, 3));
        swdata1 <= std_logic_vector(to_unsigned(2 * i + 1, 8));
    end loop;
    swrite1 <= '0';
    wait for 200ns;
    for i in 0 to 7 loop
        sraddress1 <= std_logic_vector(to_unsigned(i, 3));
        sraddress2 <= std_logic_vector(to_unsigned(7 - i, 3));
        wait for 200ns;
    end loop;
    wait for 200ns;
    swrite1 <= '1';
    for i in 0 to 7 loop
        swaddress1 <= std_logic_vector(to_unsigned(i, 3));
        swdata1 <= std_logic_vector(to_unsigned(2*i+2, 8));
        sraddress1 <= std_logic_vector(to_unsigned(i, 3));
        sraddress2 <= std_logic_vector(to_unsigned(7-i, 3));
    end loop;
end process;

end Behavioral;
