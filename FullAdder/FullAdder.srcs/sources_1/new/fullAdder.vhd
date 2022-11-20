

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port (
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    S : out std_logic;
    Cout : out std_logic
    );
end fullAdder;

architecture Behavioral of fullAdder is
    signal s1 : std_logic;
    signal s2 : std_logic;
    signal s3 : std_logic;
begin
    s1 <= A xor B;
    s2 <= s1 and Cin;
    s3 <= A and B;
    S <= s1 xor Cin;
    Cout <= s2 or s3;

end Behavioral;
