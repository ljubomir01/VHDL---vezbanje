

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity majorityVoter is
    Port (
    X : in std_logic;
    Y : in std_logic;
    Z : in std_logic;
    V : out std_logic
    );
end majorityVoter;

architecture Behavioral of majorityVoter is
    signal s1 : std_logic;
    signal s2 : std_logic;
    signal s3 : std_logic;
begin
    s1 <= X nand Y;
    s2 <= Y nand Z;
    s3 <= Z nand X;
    V <= not (s1 and s2 and s3);

end Behavioral;
