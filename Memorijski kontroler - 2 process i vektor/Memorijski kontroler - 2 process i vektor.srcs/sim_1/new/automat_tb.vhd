library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity automat_tb is
--  Port ( );
end automat_tb;

architecture Behavioral of automat_tb is
component automat is
Port (
    clk : in std_logic;
    reset : in std_logic;
    rw : in std_logic;
    mem : in std_logic;
    burst : in std_logic;
    oe : out std_logic;
    we : out std_logic;
    we_me : out std_logic
);
end component;
signal clk_s, reset_s, rw_s, mem_s, burst_s, oe_s, we_s, we_me_s : std_logic;
begin
duv: automat
    port map(
        clk => clk_s,
        reset => reset_s,
        rw => rw_s,
        mem => mem_s,
        burst => burst_s,
        oe => oe_s,
        we => we_s,
        we_me => we_me_s
    );
clk_gen: process
begin
    clk_s <= '0', '1' after 100ns;
    wait for 200ns;
end process;
stim_gen: process
begin
    --inicijalizacija ulaznih signala
    mem_s <= '0';
    rw_s <= '0';
    burst_s <= '0';
    --inicijalizacija memorijskog kontrolera
    reset_s <= '1';
    wait until falling_edge(clk_s);
    reset_s <= '0';
    
    for i in 1 to 2 loop
        wait until falling_edge(clk_s);
    end loop;
    --zadavanje komande upisa, treba da ode u write stanje
    mem_s <= '1';
    wait until falling_edge(clk_s);
    mem_s <= '0';
    wait until falling_edge(clk_s);
    --Zadavanje komande citanja 
    --treba da ode u read1 pa da se vrati u idle
    mem_s <= '1';
    rw_s <= '1';
    wait until falling_edge(clk_s);
    mem_s <= '0';
    rw_s <= '0';
    wait until falling_edge(clk_s);
    --zadavanje burst komande citanja sadrzaja iz memorije
    --treba da ode u read1 stanje pa da nastavi sve do read4
    --pa na kraju da se vrati u idle stanje
    mem_s <= '1';
    rw_s <= '1';
    burst_s <= '1';
    wait until falling_edge(clk_s);
    mem_s <= '0';
    rw_s <= '0';
    burst_s <= '1';
    wait until falling_edge(clk_s);
    burst_s <= '1';
    for i in 1 to 3 loop
        wait until falling_edge(clk_s);
    end loop;
    wait;
end process;
end Behavioral;
