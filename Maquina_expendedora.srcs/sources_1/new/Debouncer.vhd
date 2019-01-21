----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 21.01.2019 20:29:28
-- Module Name: Debouncer - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Entidad Debouncer para eliminar los rebotes de las entradas por boton
--        de la maquina.
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Debouncer is
    PORT(
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        boton_in : in STD_LOGIC;
        boton_out : out STD_LOGIC
    );
end Debouncer;

architecture Behavioral of Debouncer is
    signal Q1, Q2, Q3 : STD_LOGIC;
begin
    p: process(clk)
    begin
        if(rising_edge(clk))then
            if (rst = '0') then
                Q1 <= '0';
                Q2 <= '0';
                Q3 <= '0';
            else 
                Q3 <= Q2;
                Q2 <= Q1;
                Q1 <= boton_in;
            end if;
        end if;
    end process;
    
    boton_out <= Q1 AND Q2 AND (NOT Q3);

end Behavioral;
