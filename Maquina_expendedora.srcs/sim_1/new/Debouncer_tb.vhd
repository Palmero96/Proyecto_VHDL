----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 21.01.2019 20:29:59
-- Module Name: Debouncer_tb - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
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

entity Debouncer_tb is
end Debouncer_tb;

architecture Behavioral of Debouncer_tb is
    component Debouncer port(
        clk : in STD_LOGIC;
        rst : in STD_LOGIC; 
        boton_in : in STD_LOGIC;
        boton_out : out STD_LOGIC
    );
    end component;
    
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal boton_in : std_logic := '0';
    signal boton_out : std_logic;
begin
    uut: Debouncer PORT MAP(
        clk => clk,
        rst => rst,
        boton_in => boton_in,
        boton_out => boton_out
    );
    
    clk <= not clk after 2 ns;
    rst <= not rst after 50 ns;
    boton_in <= not boton_in after 25 ns;
end Behavioral;