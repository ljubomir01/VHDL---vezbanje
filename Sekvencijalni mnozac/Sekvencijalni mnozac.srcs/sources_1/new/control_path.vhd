library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_path is
Port (
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    count_0 : in std_logic;
    a_is_0 : in std_logic;
    b_is_0 : in std_logic;
    sel : out std_logic_vector(1 downto 0);
    ready : out std_logic
);
end control_path;

architecture beh of control_path is
type state_type is(idle, ab0, load, op);
signal state_reg, state_next : state_type;
begin
clock: process(clk, reset)
begin
    if reset = '1' then
        state_reg <= state_next;
    elsif (clk'event and clk = '1') then
        state_reg <= state_next;
    end if;
end process;
state: process(state_reg, a_is_0, b_is_0, count_0, start)
begin
    case state_reg is
        when idle =>
            ready <= '1';
            sel <= "00";
            if(start = '1') then
                if(a_is_0 = '1' or b_is_0 = '1') then
                    state_next <= ab0;
                else
                    state_next <= load;
                end if;
            else
                state_next <= idle;
            end if;
        when ab0 => 
            sel <= "01";
            ready <= '0';
            state_next <= idle;
        when load =>
            sel <= "10";
            ready <= '0';
            state_next <= op;
        when op =>
            sel <= "11";
            ready <= '0';
            if count_0 = '1' then
                state_next <= idle;
            else
                state_next <= op;
            end if;
            
    end case;
end process;
end beh;
