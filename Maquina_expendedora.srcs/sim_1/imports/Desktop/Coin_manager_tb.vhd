----------------------------------------------------------------------------------
-- Company: UPM 
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 30.12.2018 21:12:49
-- Module Name: Coin_manager - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Entidad para la gestion de las monedas introducidas en la maquina 
--      expendedora.
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Coin_manager_tb is
end Coin_manager_tb;

architecture Behavioral of Coin_manager_tb is
    component Coin_manager PORT(
       Sensor_10c : in STD_LOGIC;
       Sensor_20c : in STD_LOGIC;
       Sensor_50c : in STD_LOGIC;
       Sensor_1e : in STD_LOGIC;
       Rst: in STD_LOGIC;
       Clk: in STD_LOGIC;
       Salida_overflow : out STD_LOGIC;
       Salida_correcto : out STD_LOGIC;
       Counter : out INTEGER
   );
   end component;
   
   --Input signals
   signal Sensor_10c : STD_LOGIC;
   signal Sensor_20c : STD_LOGIC;
   signal Sensor_50c : STD_LOGIC;
   signal Sensor_1e : STD_LOGIC;
   signal Rst : STD_LOGIC;
   signal Clk : STD_LOGIC := '0';
   
   --Output signals
   signal Salida_overflow : STD_LOGIC;
   signal Salida_correcto : STD_LOGIC;
   signal Counter : INTEGER;    
begin
    ---------------------------------------
    --Declaracion del unit under test (uut)
    ---------------------------------------
    uut: Coin_manager PORT MAP(
        Sensor_10c => Sensor_10c,
        Sensor_20c => Sensor_20c,
        Sensor_50c => Sensor_50c,
        Sensor_1e => Sensor_1e,
        Rst => Rst,
        Clk => clk,
        Salida_overflow => Salida_overflow,
        Salida_correcto => Salida_correcto,
        Counter => Counter
   );
   
    -------------------------------
    --Uso de reloj y señal de reset
    -------------------------------
    clk_tb: process(clk)
    begin
        clk <= not clk after 2 ns;
    end process;
    
    rst_tb: process
    begin
        rst <= '1';
        wait for 500 ns;
        rst <= '0';
        wait for 20 ns;
    end process;
    
    -------------------------------------
    --Declaracion de los pulsos de inputs
    -------------------------------------
    c10_tb: process
    begin
        Sensor_10c <= '0';
        wait for 20 ns;
        Sensor_10c <= '1';
        wait for 10 ns;
    end process;
    
    c20_tb: process
    begin
        Sensor_20c <= '0';
        wait for 35 ns;
        Sensor_20c <= '1';
        wait for 10 ns;
    end process;
    
    c50_tb: process
    begin
        Sensor_50c <= '0';
        wait for 55 ns;
        Sensor_50c <= '1';
        wait for 10 ns;
    end process;
    
    e1_tb: process
    begin
        Sensor_1e <= '0';
        wait for 75 ns;
        Sensor_1e <= '1';
        wait for 10 ns;
    end process;
end Behavioral;
