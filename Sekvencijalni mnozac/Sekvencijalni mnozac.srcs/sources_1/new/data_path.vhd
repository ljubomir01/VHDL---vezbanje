library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use ieee.std_logic_arith.all;

entity data_path is
generic(WIDTH:positive:=8);
Port (
    clk : in std_logic;
    a_in : in std_logic_vector(WIDTH-1 downto 0);
    b_in : in std_logic_vector(WIDTH-1 downto 0);
    sel : in std_logic_vector(1 downto 0);
    count_0 : out std_logic;
    a_is_0 : out std_logic;
    b_is_0 : out std_logic;
    r_out : out std_logic_vector(2*WIDTH-1 downto 0)
);
end data_path;

architecture struct of data_path is
signal a_reg_s, a_next_s : std_logic_vector(WIDTH-1 downto 0);
signal n_reg_s, n_next_s : std_logic_vector(WIDTH-1 downto 0);
signal r_reg_s, r_next_s : std_logic_vector(2*WIDTH-1 downto 0);
signal adder_out_s : std_logic_vector(2*WIDTH-1 downto 0);
signal sub_out_s : std_logic_vector(WIDTH-1 downto 0);
begin
r_out <= r_reg_s;
a_reg: entity work.reg(beh)
    generic map(WIDTH => WIDTH)
    port map(
        clk => clk,
        d => a_next_s,
        q => a_reg_s
    );
n_reg: entity work.reg(beh)
    generic map(WIDTH => WIDTH)
    port map(
        clk => clk,
        d => n_next_s,
        q => n_reg_s
    );
r_reg: entity work.reg(beh)
    generic map(WIDTH => 2*WIDTH)
    port map(
        clk => clk,
        d => r_next_s,
        q => r_reg_s
    );
--funkcionalne jedinice
add: entity work.adder(beh)
    generic map(WIDTH => WIDTH)
    port map(
        op1 => a_reg_s,
        op2 => r_reg_s,
        res => adder_out_s
    );
decrement: entity work.decrementor(beh)
    generic map(WIDTH => WIDTH)
    port map(
        op1 => n_reg_s,
        res => sub_out_s
    );
zero_comp1: entity work.comparator(beh)
    generic map(WIDTH => WIDTH)
    port map(
        op1 => n_next_s,
        res => count_0
    );
zero_comp2: entity work.comparator(beh)
    generic map(WIDTH => WIDTH)
    port map(
        op1 => a_in,
        res => a_is_0
    );
zero_comp3: entity work.comparator(beh)
    generic map(WIDTH => WIDTH)
    port map(
        op1 => b_in,
        res => b_is_0
    );
--multiplekseri za rutiranje
mux1: entity work.mux4na1(beh)
    generic map(WIDTH => WIDTH)
    port map(
        x1 => a_reg_s,
        x2 => a_in,
        x3 => a_in,
        x4 => a_reg_s,
        sel => sel,
        y => a_next_s
    );
mux2: entity work.mux4na1(beh)
    generic map(WIDTH => WIDTH)
    port map(
        x1 => n_reg_s,
        x2 => b_in,
        x3 => b_in,
        x4 => sub_out_s,
        sel => sel,
        y => n_next_s
    );
mux3: entity work.mux4na1(beh)
    generic map(WIDTH => 2*WIDTH)
    port map(
        x1 => r_reg_s,
        x2 => conv_std_logic_vector(0, 2*WIDTH),
        x3 => conv_std_logic_vector(0, 2*WIDTH),
        x4 => adder_out_s,
        sel => sel,
        y => r_next_s
    );
end struct;
