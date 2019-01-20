----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 26.12.2018 23:55:13
-- Module Name: Top - Structural
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Entidad top encargada de controlar la máquina expendedora
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
    PORT(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        select_order : in STD_LOGIC_VECTOR (2 DOWNTO 0);
        coin_error : in STD_LOGIC;
        --Sensores de las diferentes monedas
        sen10c : in STD_LOGIC;
        sen20c : in STD_LOGIC;
        sen50c : in STD_LOGIC;
        sen1e : in STD_LOGIC        
    );
end Top;

architecture Structural of Top is
------------------------------------------
--Declaracion de componentes usados en Top
------------------------------------------
    component State_machine PORT(
        order_number : in STD_LOGIC_VECTOR (2 downto 0);
        exact_amount : in STD_LOGIC;
        coin_error : in STD_LOGIC;
        overflow : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        end_of_return : in STD_LOGIC;
        end_of_output : in STD_LOGIC;
        standby : out STD_LOGIC;
        show : out STD_LOGIC;
        output : out STD_LOGIC;
        returns : out STD_LOGIC
    );
    end component;
    
    component Coin_manager PORT(
        sensor_10c : in STD_LOGIC;
        sensor_20c : in STD_LOGIC;
        sensor_50c : in STD_LOGIC;
        sensor_1e : in STD_LOGIC;
        rst: in STD_LOGIC;
        clk: in STD_LOGIC;
        salida_overflow : out STD_LOGIC;
        salida_correcto : out STD_LOGIC;
        counter : out INTEGER
    );
    end component;
--------------------------------------
--Declaracion de señales usados en Top
--------------------------------------
--Señales usadas por State Machine
    signal exact_amount : STD_LOGIC;
    signal overflow : STD_LOGIC;
    signal end_of_return : STD_LOGIC;
    signal end_of_output : STD_LOGIC;
    signal standby : STD_LOGIC;
    signal show : STD_LOGIC;
    signal output : STD_LOGIC;
    signal returns : STD_LOGIC;
--Señales usadas por Coin_manager
    signal counter : integer;    
begin
----------------------------------------------------
--Instanciación de la máquina de estados del sistema
----------------------------------------------------
    Inst_ss: State_machine PORT MAP(
        order_number => select_order,
        exact_amount => exact_amount,
        coin_error => coin_error,
        overflow => overflow,
        rst => reset,
        clk => clock,
        end_of_return => end_of_return,
        end_of_output => end_of_output,
        standby => standby,
        show => show,
        output => output,
        returns => returns 
    );

---------------------------------------------------------------------
--Instanciacion de la entidad Coin Manager, gestor del uso de monedas
---------------------------------------------------------------------
    Inst_cm: Coin_manager PORT MAP(
        sensor_10c => Sen10c,
        sensor_20c => Sen20c,
        sensor_50c => Sen50c,
        sensor_1e => Sen1e,
        rst => reset,
        clk => clock,
        salida_overflow => overflow,
        salida_correcto => exact_amount,
        counter => counter
    );
                
end Structural;
