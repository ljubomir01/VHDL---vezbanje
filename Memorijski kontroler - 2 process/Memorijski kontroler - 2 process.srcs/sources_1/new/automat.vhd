library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity automat is
Port (
    clk : in std_logic;
    reset : in std_logic;
    mem : in std_logic;
    rw : in std_logic;
    burst : in std_logic;
    oe : out std_logic;
    we : out std_logic;
    we_me : out std_logic
);
end automat;

architecture Behavioral of automat is
type mc_state_type is (idle, read1, read2, read3, read4, write);
signal state_reg, state_next : mc_state_type;
begin
--registar stanja
process(clk, reset)
begin
    if(reset = '1')then
        state_reg <= idle;
    elsif(clk'event and clk = '1') then
        state_reg <= state_next;
    end if;
end process;
--logika za generisanje narednog stanja i izlazla logika
process(state_reg, mem, rw, burst)
begin
    oe <= '0';
    we <= '0';
    we_me <= '0';
    case state_reg is
        when idle =>
            if(mem = '1') then
                if(rw = '1') then
                    state_next <= read1;
                else
                    state_next <= write;
                    we_me <= '1';
                end if;
            else
                state_next <= idle;
            end if;
        when write =>
            state_next <= idle;
            we <= '1';
        when read1 =>
            if(burst = '1') then
                state_next <= read2;
            else
                state_next <= idle;
            end if;
            oe <= '1';
        when read2 => 
            state_next <= read3;
            oe <= '1';
        when read3 =>
            state_next <= read4;
            oe <= '1';
        when read4 =>
            state_next <= idle;
            oe <= '1';
    end case;
end process;
end Behavioral;
