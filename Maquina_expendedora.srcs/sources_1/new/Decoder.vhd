----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 07.01.2019 16:29:08
-- Module Name: Decoder - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Entidad "Decoder" creada para el uso de el display de 7 segmentos de la placa
--       que nos permitirá leer información relevante sobre los estados en los que se
--       encuentra el dispositivo.
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
    
entity Decoder is
    PORT(
        code: in STD_LOGIC_VECTOR(7 DOWNTO 0);
        led : out STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
end Decoder;

architecture Dataflow of Decoder is
------------------------------------------------------------
--Se trata de un decodificador de codigo ASCII a las salidas
-- de los leds para poder leer el display de 7 segmentos. De
-- la forma en la que se encuentra hecho el código solo se
-- pueden usar letras mayusculas.
------------------------------------------------------------
begin
    with code select
        led <= "1000000" when "00110000",   --0
               "1111001" when "00110001",   --1
               "0100100" when "00110010",   --2
               "0110000" when "00110011",   --3
               "0011001" when "00110100",   --4
               "0010010" when "00110101",   --5
               "0000010" when "00110110",   --6
               "1111000" when "00110111",   --7
               "0000000" when "00111000",   --8
               "0010000" when "00111001",   --9
               "0001000" when "01000001",   --A
               "0000011" when "01000010",   --B
               "1000110" when "01000011",   --C
               "0100001" when "01000100",   --D
               "0000110" when "01000101",   --E
               "0001110" when "01000110",   --F
               "0010000" when "01000111",   --G
               "0001001" when "01001000",   --H
               "1001111" when "01001001",   --I
               "1100001" when "01001010",   --J
               "0001001" when "01001011",   --K
               "1000111" when "01001100",   --L
               "1101010" when "01001101",   --M
               "0101011" when "01001110",   --N
               "1000000" when "01001111",   --O
               "0001100" when "01010000",   --P
               "0011000" when "01010001",   --Q
               "0101111" when "01010010",   --R
               "0010010" when "01010011",   --S
               "0000111" when "01010100",   --T
               "1000001" when "01010101",   --U
               "1100011" when "01010110",   --V
               "1010101" when "01010111",   --W
               "0001001" when "01011000",   --X
               "0010001" when "01011001",   --Y
               "0100100" when "01011010",   --Z
               "1111111" when "00100000",   --()
               "0111111" when others;
end Dataflow;
