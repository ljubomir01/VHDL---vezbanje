library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4_na_1_tb is
--  Port ( );
end mux_4_na_1_tb;

architecture Behavioral of mux_4_na_1_tb is
component mux_4_na_1 is
    generic(WIDTH: positive:=8);
    Port (
        x1 : in std_logic_vector(WIDTH - 1 downto 0);
        x2 : in std_logic_vector(WIDTH - 1 downto 0);
        x3 : in std_logic_vector(WIDTH - 1 downto 0);
        x4 : in std_logic_vector(WIDTH - 1 downto 0);
        sel : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(WIDTH - 1 downto 0)
    );
end component;
signal x1_8, x2_8, x3_8, x4_8, y_8 : std_logic_vector(7 downto 0);
signal sel_8, sel_16 : std_logic_vector(1 downto 0);
signal x1_16, x2_16, x3_16, x4_16, y_16 : std_logic_vector(15 downto 0);
begin
duv_8: mux_4_na_1
    port map(
        x1 => x1_8,
        x2 => x2_8,
        x3 => x3_8,
        x4 => x4_8,
        y => y_8,
        sel => sel_8
    );
duv_16: mux_4_na_1
    generic map(WIDTH => 16)
    port map(
        x1 => x1_16,
        x2 => x2_16,
        x3 => x3_16,
        x4 => x4_16,
        y => y_16,
        sel => sel_16
    );
stim_gen_8: process
begin
    x1_8 <= X"00", X"FF" after 100 ns,
X"00" after 200 ns, X"FF" after 600 ns,
X"00" after 700 ns, X"FF" after 1000 ns,
X"00" after 1100 ns, X"FF" after 1400 ns,
X"00" after 1500 ns;
    x2_8 <= X"00", X"FF" after 200 ns,
X"00" after 300 ns, X"FF" after 500 ns,
X"00" after 600 ns, X"FF" after 1100 ns,
X"00" after 1200 ns, X"FF" after 1500 ns,
X"00" after 1700 ns;
    x3_8 <= X"00", X"FF" after 300 ns,
X"00" after 400 ns, X"FF" after 700 ns,
X"00" after 800 ns, X"FF" after 900 ns,
X"00" after 1000 ns, X"FF" after 1600 ns,
X"00" after 1700 ns;
    x4_8 <= X"00", X"FF" after 400 ns,
X"00" after 500 ns, X"FF" after 800 ns,
X"00" after 900 ns, X"FF" after 1200 ns,
X"00" after 1400 ns;
    sel_8 <= "00" , "01" after 500 ns, "10" after 900 ns,
"11" after 1300 ns;
wait;
end process;
stim_gen_16: process
begin
    x1_16 <= X"0000", X"FFFF" after 100 ns,
X"0000" after 200 ns, X"FFFF" after 600 ns,
X"0000" after 700 ns, X"FFFF" after 1000 ns,
X"0000" after 1100 ns, X"FFFF" after 1400 ns,
X"0000" after 1500 ns;
    x2_16 <= X"0000", X"FFFF" after 200 ns,
X"0000" after 300 ns, X"FFFF" after 500 ns,
X"0000" after 600 ns, X"FFFF" after 1100 ns,
X"0000" after 1200 ns, X"FFFF" after 1500 ns,
X"0000" after 1700 ns;
    x3_16 <= X"0000", X"FFFF" after 300 ns,
X"0000" after 400 ns, X"FFFF" after 700 ns,
X"0000" after 800 ns, X"FFFF" after 900 ns,
X"0000" after 1000 ns, X"FFFF" after 1600 ns,
X"0000" after 1700 ns;
    x4_16 <= X"0000", X"FFFF" after 400 ns,
X"0000" after 500 ns, X"FFFF" after 800 ns,
X"0000" after 900 ns, X"FFFF" after 1200 ns,
X"0000" after 1400 ns;
    sel_16 <= "00" , "01" after 500 ns, "10" after 900 ns,
"11" after 1300 ns;
    wait;
end process;
end Behavioral;
