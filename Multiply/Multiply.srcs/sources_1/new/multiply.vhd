

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiply is
    Port (
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    C0 : out std_logic;
    C1 : out std_logic;
    C2 : out std_logic;
    C3 : out std_logic
    );
end multiply;

architecture Behavioral of multiply is
    signal s1 : std_logic;
    signal s2 : std_logic;
    signal s3 : std_logic;
    signal s4 : std_logic;
begin
    s1 <= A0 and B1;
    C0 <= A0 and B0;
    s2 <= A1 and B0;
    s3 <= A1 and B1;
    C1 <= s1 xor s2;
    s4 <= s1 and s2;
    C2 <= s3 xor s4;
    C3 <= s3 and s4;


end Behavioral;
