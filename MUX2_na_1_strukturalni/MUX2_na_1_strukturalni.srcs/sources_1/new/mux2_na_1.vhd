
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

architecture Struct of mux2_na_1 is
signal s1, s2, s3 : std_logic;
begin
    not1 : entity work.not_gate(Behavioral)
        port map(
        in1 => sel,
        out1 => s1
        );
    and1 : entity work.and_gate(Behavioral)
        port map(
        in1 => x1,
        in2 => s1,
        out1 => s2
        );
    and2 : entity work.and_gate(Behavioral)
        port map(
        in1 => sel,
        in2 => x2,
        out1 => s3
        );
    or1 : entity work.or_gate(Behavioral)
        port map(
            in1 => s2,
            in2 => s3,
            out1 => y
        );


end Struct;
