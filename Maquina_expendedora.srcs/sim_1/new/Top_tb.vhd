----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Alvaro Palmero, Emilio Miralles y Emilio Peñaranda
-- 
-- Create Date: 20.01.2019 23:22:33
-- Module Name: Top_tb - Behavioral
-- Project Name: Maquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--  Testbench para la entidad general
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_tb is
end Top_tb;

architecture Behavioral of Top_tb is
    component Top PORT(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        select_order : in STD_LOGIC_VECTOR (2 DOWNTO 0);
        coin_error : in STD_LOGIC;
        end_of_output : in STD_LOGIC;
        sen10c : in STD_LOGIC;
        sen20c : in STD_LOGIC;
        sen50c : in STD_LOGIC;
        sen1e : in STD_LOGIC;
        output_sal : inout STD_LOGIC;
        output_ret : inout STD_LOGIC;
        output_sho : inout STD_LOGIC;
        output_stb : inout STD_LOGIC; 
        display_select : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        mensaje : out STD_LOGIC_VECTOR (6 DOWNTO 0);
        
        trampita : out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    end component;
    
    --INPUT SIGNALS
    signal clock : STD_LOGIC := '0';
    signal reset : STD_LOGIC;
    signal select_order : STD_LOGIC_VECTOR (2 DOWNTO 0);
    signal coin_error : STD_LOGIC;
    signal end_of_output : STD_LOGIC;
    signal sen10c : STD_LOGIC := '0';
    signal sen20c : STD_LOGIC := '0';
    signal sen50c : STD_LOGIC := '0';
    signal sen1e : STD_LOGIC := '0';
    --OUTPUT SIGNALS
    signal output_sal : STD_LOGIC;
    signal output_ret : STD_LOGIC;
    signal output_sho : STD_LOGIC;
    signal output_stb : STD_LOGIC;
    signal display_select : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal mensaje : STD_LOGIC_VECTOR (6 DOWNTO 0);
    
    signal trampita : STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
    ------------------------------------
    --Declaramos el uut: Unit under test
    ------------------------------------
    uut: Top PORT MAP(
        clock => clock,
        reset => reset,
        select_order => select_order,
        coin_error => coin_error,
        end_of_output => end_of_output,
        sen10c => sen10c,
        sen20c => sen20c,
        sen50c => sen50c,
        sen1e => sen1e,
        output_sal => output_sal,
        output_ret => output_ret,
        output_sho => output_sho,
        output_stb => output_stb,
        display_select => display_select,
        mensaje => mensaje,
        trampita => trampita
    );
    
    -------------------------------------
    --Declaramos las variables de entrada
    -------------------------------------
    --Clk
    clk_tb: process(clock)
    begin
        clock <= not clock after 5 ns;
    end process;
    
    --Rst
    rs_tb: process
    begin
        reset <= '0';
        wait for 750 ns;
        reset <= '1';
        wait for 50 ns;
    end process;
    
    --Select order
    So_tb: process
    begin
        select_order <= "000";
        wait for 20 ns;
        select_order <= "001";
        wait for 200 ns;
    end process;
    
    --Coin error
    Ce_tb: process
    begin
        coin_error <= '0';
        wait for 700 ns;
        coin_error <= '1';
        wait for 20 ns;
    end process;
    
    Sensores: process
    begin
        Sen50c <= '0';
        wait for 50 ns;
        Sen50c <= '1';
        wait for 100 ns;
    end process;
    
    Sensores2: process
    begin
        Sen20c <= '0';
        wait for 50 ns;
        Sen20c <= '1';
        wait for 270 ns;
    end process;
    
    eou: process
    begin
        end_of_output <= '0';
        wait for 50 ns;
        end_of_output <= '1';
        wait for 50 ns;
    end process;

end Behavioral;
