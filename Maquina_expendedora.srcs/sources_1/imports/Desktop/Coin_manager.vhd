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
use IEEE.NUMERIC_STD.ALL;

entity Coin_manager is
    Port ( Sensor_10c : in STD_LOGIC;
           Sensor_20c : in STD_LOGIC;
           Sensor_50c : in STD_LOGIC;
           Sensor_1e : in STD_LOGIC;
           Rst: in STD_LOGIC;
           Clk: in STD_LOGIC;
           Salida_overflow : out STD_LOGIC;
           Salida_correcto : out STD_LOGIC;
           Counter : out INTEGER);
end Coin_manager;

architecture Behavioral of Coin_manager is
    signal contador : integer := 0;
    signal overflow : STD_LOGIC := '0';
    signal correcto : STD_LOGIC := '0';
    
    signal suma : integer := 0;
begin
    -------------------------------------------------------------------------
    --Sincronizacion de procesos con el reloj además de uso de la señal reset
    -------------------------------------------------------------------------
    sync_proc: process(clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '0') then
                contador <= 0;
                Counter <= 0;
                Salida_overflow <= '0';
                Salida_correcto <= '0';
            else
                contador <= contador + suma;
                if (contador < 100) then
                    overflow <= '0';
                    correcto <= '0';
                elsif (contador = 100) then
                    overflow <= '0';
                    correcto <= '1';
                    contador <= 0;
                elsif (contador > 100) then
                    contador <= 0;
                    overflow <= '1';
                    correcto <= '0';
                end if;        
                Counter <= contador;
                Salida_overflow <= overflow;
                Salida_correcto <= correcto;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------
    --Proceso que gestiona el contador de la maquina mediante las señales
    -- diferentes se asignan los correspondientes valores de las monedas
    ---------------------------------------------------------------------
    
    c: process(Sensor_10c, Sensor_20c, Sensor_50c, Sensor_1e, rst)
    begin
        if (Sensor_1e = '1') then
            suma <= 100;
        else
            if (Sensor_50c = '1') then
                suma <= 50;
            else 
                if (Sensor_20c = '1') then
                    suma <= 20;
                else 
                    if (Sensor_10c = '1') then
                        suma <= 10;
                    else 
                        suma <= 0;
                    end if;
                end if;
            end if;
        end if;
    end process;       

end Behavioral;
