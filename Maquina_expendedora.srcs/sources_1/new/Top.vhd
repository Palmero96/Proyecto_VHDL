----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: �lvaro Palmero Mart�nez
-- 
-- Create Date: 26.12.2018 23:55:13
-- Module Name: Top - Structural
-- Project Name: M�quina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Entidad top encargada de controlar la m�quina expendedora
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
        coin_error : in STD_LOGIC
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
    
--------------------------------------
--Declaracion de se�ales usados en Top
--------------------------------------
    signal exact_amount : STD_LOGIC;
    signal overflow : STD_LOGIC;
    signal end_of_return : STD_LOGIC;
    signal end_of_output : STD_LOGIC;
    signal standby : STD_LOGIC;
    signal show : STD_LOGIC;
    signal output : STD_LOGIC;
    signal returns : STD_LOGIC;
    
begin
----------------------------------------------------
--Instanciaci�n de la m�quina de estados del sistema
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

end Structural;
