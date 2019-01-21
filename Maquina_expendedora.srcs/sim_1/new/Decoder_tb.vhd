----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 07.01.2019 16:29:49
-- Module Name: Decoder_tb - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Testbench para la entidad Decoder que trata los leds del display de 7 seg
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Decoder_tb is
end Decoder_tb;

architecture Behavioral of Decoder_tb is
    component Decoder PORT(
        code: in STD_LOGIC_VECTOR(7 DOWNTO 0);
        led : out STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
    end component;
    
    --INPUT SIGNALS
    signal code : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00100000";
    
    --OUTPUT SIGNALS
    signal led : STD_LOGIC_VECTOR(6 DOWNTO 0);
    
begin
    uut: Decoder PORT MAP(
        code => code,
        led => led
    );
    
    code_tb : process
    begin
        wait for 20 ns;
        code <= code + 1;
    end process;
end Behavioral;
