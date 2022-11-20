----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 01:26:39 PM
-- Design Name: 
-- Module Name: shift_struct - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_struct is
    Port (
    x0, x1, x2, x3, shift : in std_logic;
    y0, y1, y2, y3, k : out std_logic
    );
end shift_struct;

architecture Struct of shift_struct is
component mux is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           sel : in STD_LOGIC;
           y : out STD_LOGIC);
end component;
begin
    mux0: mux
    port map(
    x1 => '0',
    x2 => x0, 
    sel => shift,
    y => k
    );
    
    mux1: mux
    port map(
    x1 => x0,
    x2 => x1,
    sel => shift,
    y => y0
    );
    mux2: mux
    port map(
    x1 => x1,
    x2 => x2,
    sel => shift,
    y => y1
    );
    mux3: mux
    port map(
    x1 => x2,
    x2 => x3,
    sel => shift,
    y => y2
    );
    mux4: mux
    port map(
    x1 => x3,
    x2 => '0',
    sel => shift,
    y => y3
    );
end Struct;
