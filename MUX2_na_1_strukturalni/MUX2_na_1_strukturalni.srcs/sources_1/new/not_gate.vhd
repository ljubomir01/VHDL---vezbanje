
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    Port (
    in1 : in std_logic;
    out1 : out std_logic
    );
end not_gate;

architecture Behavioral of not_gate is

begin
    out1 <= not in1;

end Behavioral;
