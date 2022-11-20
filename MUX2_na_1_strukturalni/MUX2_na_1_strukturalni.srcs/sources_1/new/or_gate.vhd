
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    Port (
    in1 : in std_logic;
    in2 : in std_logic;
    out1 : out std_logic
    );
end or_gate;

architecture Behavioral of or_gate is

begin
    out1 <= in1 or in2;

end Behavioral;
