

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg is
    Port (
    x3, x2, x1, x0 : in std_logic;
    a, b, c, d, e, f, g : out std_logic
    );
end seg;

architecture Behavioral of seg is

begin
konvertor: process(x0, x1, x2, x3) is
    variable input_vector_v: std_logic_vector(3 downto 0);
    begin
        input_vector_v:= x3&x2&x1&x0;
        case input_vector_v is
            when "0000" =>
            a <= '1';
            b <= '1';
            c <= '1';
            d <= '1';
            e <= '1';
            f <= '1';
            g <= '0';
            when "0001" =>
            a <= '0';
            b <= '1';
            c <= '1';
            d <= '0';
            e <= '0';
            f <= '0';
            g <= '0';
            when "0010" =>
            a <= '1';
            b <= '1';
            c <= '0';
            d <= '1';
            e <= '1';
            f <= '0';
            g <= '1';
            when "0011" =>
            a <= '1';
            b <= '1';
            c <= '1';
            d <= '1';
            e <= '0';
            f <= '1';
            g <= '1';
            when "0100" =>
            a <= '0';
            b <= '1';
            c <= '1';
            d <= '0';
            e <= '0';
            f <= '1';
            g <= '1';
            when "0101" =>
            a <= '1';
            b <= '0';
            c <= '1';
            d <= '1';
            e <= '0';
            f <= '1';
            g <= '1';
            when "0110" =>
            a <= '1';
            b <= '0';
            c <= '1';
            d <= '1';
            e <= '1';
            f <= '1';
            g <= '1';
            when "0111" =>
            a <= '1';
            b <= '1';
            c <= '1';
            d <= '0';
            e <= '0';
            f <= '0';
            g <= '0';
            when "1000" =>
            a <= '1';
            b <= '1';
            c <= '1';
            d <= '1';
            e <= '1';
            f <= '1';
            g <= '1';
            when others =>
            a <= '1';
            b <= '1';
            c <= '1';
            d <= '1';
            e <= '0';
            f <= '1';
            g <= '1';
        end case;
    end process;
            

end Behavioral;
