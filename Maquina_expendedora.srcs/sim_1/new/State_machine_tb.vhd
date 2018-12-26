----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 26.12.2018 20:31:02
-- Module Name: State_machine_tb - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Banco de pruebas para la máquina de estados del sistema

-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity State_machine_tb is
end State_machine_tb;

architecture Behavioral of State_machine_tb is
    component State_machine PORT(
        order_number : in STD_LOGIC_VECTOR (2 DOWNTO 0);
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
   
   --INPUT SIGNALS
   signal order_number : STD_LOGIC_VECTOR(2 DOWNTO 0);
   signal exact_amount : STD_LOGIC;
   signal coin_error : STD_LOGIC;
   signal overflow : STD_LOGIC;
   signal rst : STD_LOGIC;
   signal clk : STD_LOGIC;
   signal end_of_return : STD_LOGIC;
   signal end_of_output : STD_LOGIC;
   
   --OUTPUT SIGNALS
   signal standby : STD_LOGIC;
   signal show : STD_LOGIC;
   signal output : STD_LOGIC;
   signal returns : STD_LOGIC;
   
   
begin
-------------------------------------
--Declaramos el uut (Unit under test)
-------------------------------------
    uut: State_machine PORT MAP(
        order_number => order_number,
        exact_amount => exact_amount,
        coin_error => coin_error,
        overflow => overflow,
        rst => rst,
        clk => clk,
        end_of_return => end_of_return,
        end_of_output => end_of_output,
        standby => standby,
        show => show,
        output => output,
        returns => returns 
    );

end Behavioral;
