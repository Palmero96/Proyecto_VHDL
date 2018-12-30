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
    signal noerror : integer := 0;
    
    signal sprev1 : std_logic := '0';
    signal sprev2 : std_logic := '0';
    signal sprev3 : std_logic := '0';
    signal sprev4 : std_logic := '0';
begin
    -------------------------------------------------------------------------
    --Sincronizacion de procesos con el reloj además de uso de la señal reset
    -------------------------------------------------------------------------
    sync_proc: process(clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                Counter <= 0;
                Salida_overflow <= '0';
                Salida_correcto <= '0';
            else
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
    ------------------------------------------------------------------------------
    --Implementamos un pequeño delay de un par de ciclos de reloj para que no sea
    -- posible un error en el cambio de ciclo (Contador noerror)
    ------------------------------------------------------------------------------
        if (correcto = '1') then
            if (noerror = 2) then
                contador <= 0;
                noerror <= 0;
            else
                noerror <= noerror + 1;
            end if;
        else
            --Manejo de los sensores de las monedas
            if (Sensor_10c = '1') then
                if (sprev1 /= Sensor_10c) then
                    contador <= contador + 10;
                end if;
            end if;
           
            if (Sensor_20c = '1') then
                if (sprev2 /= Sensor_20c) then
                    contador <= contador + 20;
                end if;
            end if;
            
            if (Sensor_50c = '1') then
                if (sprev3 /= Sensor_50c) then
                    contador <= contador + 50;
                end if;
            end if;
            
            if (Sensor_1e = '1') then
                if (sprev4 /= Sensor_1e) then
                    contador <= contador + 100;
                end if;
            end if;
            
            --Tiene en cuenta el overflow
            if (overflow = '1') then
                contador <= 0;
            end if;
    
            --Tiene en cuenta el reset(Puesto que si no solo pone a cero la salida y no 
            -- el contador.
            if (rst = '1') then
                contador <= 0;
            end if;
        end if;
        
        --Se asignan los valores de los sensores para compararlos en el siguiente
        -- ciclo.
        sprev1 <= Sensor_10c;
        sprev2 <= Sensor_20c;
        sprev3 <= Sensor_50c;
        sprev4 <= Sensor_1e;
    end process;
    
    -----------------------------------------------------------------------------
    --Este proceso gestiona las señales que luego se asignan en la sincronizacion
    -----------------------------------------------------------------------------
    cont_man: process (contador)
    begin
        if (contador < 100) then
            overflow <= '0';
            correcto <= '0';
        elsif (contador = 100) then
            overflow <= '0';
            correcto <= '1';
        elsif (contador > 100) then
            overflow <= '1';
            correcto <= '0';
        end if;
    end process;            

end Behavioral;
