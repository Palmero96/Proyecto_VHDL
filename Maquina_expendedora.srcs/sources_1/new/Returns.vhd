----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 31.12.2018 00:30:50
-- Module Name: Returns - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Entidad creada para implementar el estado de devolucion de dinero, asi como
--          de reset en el proyecto
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Returns is
    PORT(
        clk : in STD_LOGIC;
        returns_en : in STD_LOGIC;
        s1 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s2 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s3 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s4 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s5 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s6 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s7 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s8 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        end_of_returns : out STD_LOGIC
    );
end Returns;

architecture Behavioral of Returns is
    signal eor : STD_LOGIC := '0';
    -------------------------------------------
    --Señales del mensaje para el display
    -------------------------------------------
    signal ss1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ss2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ss3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ss4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ss5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ss6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ss7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ss8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    --Señal contador
    signal counter : integer := 0;
    signal counter2 : integer := 0;
begin
    --------------------------------------------
    ----Sincronizacion de la salida con clk-----
    --------------------------------------------
    sync: process(clk)
    begin
        if (rising_edge(clk)) then
            end_of_returns <= eor;
            s1 <= ss1;
            s2 <= ss2;
            s3 <= ss3;
            s4 <= ss4;
            s5 <= ss5;
            s6 <= ss6;
            s7 <= ss7;
            s8 <= ss8;
        end if;
    end process;
    
    ---------------------------------------------
    --Asignacion del mensaje mostrado por display
    -- en el estado returns == "RETURNING"-------
    ---------------------------------------------
    asignacion: process(returns_en)
    begin
        if (returns_en = '1') then
            ss1 <= "01010010"; --R
            ss2 <= "01000101"; --E
            ss3 <= "01010100"; --T
            ss4 <= "01010101"; --U
            ss5 <= "01010010"; --R
            ss6 <= "01001110"; --N
            ss7 <= "01001001"; --I
            ss8 <= "01001110"; --N
        else 
            ss1 <= ss1;
            ss2 <= ss2;
            ss3 <= ss3;
            ss4 <= ss4;
            ss5 <= ss5;
            ss6 <= ss6;
            ss7 <= ss7;
            ss8 <= ss8;
        end if;
    end process;
    
    --------------------------------------------
    --Contador para el tiempo en el que debe de 
    -- estar en el estado de returns 
    --------------------------------------------
    cont_ini: process(returns_en, clk, counter)
    begin
        if (rising_edge(clk)) then
            counter <= counter + 1;
        end if;
        
        --Inicializamos el contador
        if (returns_en = '0') then
            counter <= 0;
            counter2 <= 0;
        end if;
        
        --Evolucion del segundo contador (En ms)
        if (counter = 10000000) then
            counter2 <= counter2 + 1;
            counter <= 0;
        end if;
        
        -----------------------------------------
        -- Si el contador es mayor de 2 segundos
        -- activa la señal de salida del estado
        -----------------------------------------
        if (counter2 = 2000) then
            eor <= '1';
        else
            eor <= '0';
        end if;
    end process;
    
end Behavioral;
