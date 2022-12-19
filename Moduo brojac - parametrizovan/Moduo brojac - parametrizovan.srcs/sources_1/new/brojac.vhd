library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity brojac is
    generic (
        UP : boolean:=true;
        MODUO : positive:=100;
        WIDTH : positive:=7
    );
    Port (
        clk : in std_logic;
        q : out std_logic_vector(WIDTH-1 downto 0)
    );
end brojac;

architecture Behavioral of brojac is
signal count_s : integer:=0;
begin
cnt:process(clk)
begin
    if(clk'event and clk = '1') then
        if(UP = true) then
            if(count_s < MODUO-1)then
                count_s <= count_s + 1;
            else
                count_s <= 0;
            end if;
        else
            if(count_s > 0) then
                count_s <= count_s - 1;
            else
                count_s <= MODUO - 1;
            end if;
        end if;
    end if;
end process;
    q <= std_logic_vector(to_unsigned(count_s, WIDTH));

end Behavioral;
