

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2_na_1 is
    Port (
    x1 : in std_logic;
    x2 : in std_logic;
    sel : in std_logic;
    y : out std_logic
    );
end mux2_na_1;

architecture Behavioral of mux2_na_1 is

begin
-- I nacin konkurentna naredba uslovne dodele
--  y <= x1 when sel = '0' else x2;

-- II nacin konkurentna naredba selektovane dodele
--    with sel select
--        y <= x1 when '0',
--            x2 when others;

--III nacin process i if naredba
--    mux: process(x1, x2, sel) is
--        begin
--            if(sel = '0') then
--                y <= x1;
--            else
--                y <= x2;
--            end if;
--        end process;

--IV nacin process i case naredba
    mux: process(x1, x2, sel)
        begin
            case sel is
                when '0' => y <= x1;
                when others => y <= x2;
           end case;
        end process;


end Behavioral;
