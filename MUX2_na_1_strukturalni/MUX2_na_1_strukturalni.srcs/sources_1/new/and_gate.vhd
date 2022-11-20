
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    Port (
    in1 : in std_logic;
    in2 : in std_logic;
    out1 : out std_logic
    );
end and_gate;

architecture Behavioral of and_gate is

begin
    out1 <= in1 and in2;

end Behavioral;
