library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seq_mult_tb is
--  Port ( );
end seq_mult_tb;

architecture Behavioral of seq_mult_tb is
constant width_c:integer:=8;
signal clk_s, reset_s, start_s, ready_s: std_logic;
signal a_in_s, b_in_s: std_logic_vector(width_c-1 downto 0);
signal res_s: std_logic_vector(2*width_c-1 downto 0);
begin
duv: entity work.seq_mult(struct)
    generic map(WIDTH => width_c)
    port map(
        clk => clk_s,
        reset => reset_s,
        start => start_s,
        a_in => a_in_s,
        b_in => b_in_s,
        r_out => res_s,
        ready => ready_s
    );
clk_gen: process
begin
    clk_s <= '0', '1' after 100ns;
    wait for 200ns;
end process;
stim_gen: process
type op_array_t is array(1 to 10) of integer;
variable a_v: op_array_t:=(3, 5, 23, 55, 79, 123, 145, 178, 201, 224);
variable b_v: op_array_t:=(2, 9, 13, 35, 89, 132, 153, 163, 211, 254);
begin
    start_s <= '0';
    a_in_s <= (others => '0');
    b_in_s <= (others => '0');
    reset_s <= '1';
    for i in 1 to 2 loop
        wait until falling_edge(clk_s);
    end loop;
    for i in 1 to 10 loop
        --dovedi operande koje treba pomnoziti
        a_in_s <= std_logic_vector(to_unsigned(a_v(i), width_c));
        b_in_s <= std_logic_vector(to_unsigned(a_v(i), width_c));
        
        start_s <= '1';
        
        loop
            wait until falling_edge(clk_s);
            start_s <= '0';
            if(ready_s = '1') then
                exit;
            end if;
        end loop; 
    end loop;
wait;
end process;
end Behavioral;
