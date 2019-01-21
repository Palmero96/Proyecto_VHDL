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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
   signal order_number : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
   signal exact_amount : STD_LOGIC := '0';
   signal coin_error : STD_LOGIC := '0';
   signal overflow : STD_LOGIC := '0';
   signal rst : STD_LOGIC;
   signal clk : STD_LOGIC := '0';
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
    
-----------------------------------------
--Declaramos los diferentes pulsos del tb
-----------------------------------------
--Reloj
    clk_tb: process(clk)
    begin
        clk <= not clk after 5 ns;
    end process;
--Reset   
    rst_tb: process
    begin
        rst <= '1';
        wait for 200 ns;
        rst <= '0';
        wait for 10 ns;
    end process;
--Order number
    signals_tb: process
    begin
        wait for 50 ns;
        order_number <= order_number + 1;
        --if (order_number > 8) then
        --    order_number <= "000";
        --end if;
    end process;
--Exact amount, coin error & overflow
    ea_tb: process(exact_amount, coin_error, overflow)
    begin
        exact_amount <= not exact_amount after 21 ns;
        coin_error <= not coin_error after 26 ns;
        overflow <= not overflow after 31 ns;
    end process;
--End of return & end of output
    eo_tb: process
    begin
        end_of_return <= '0';
        end_of_output <= '1';
        wait for 55 ns;
        end_of_return <= '1';
        end_of_output <= '0';
        wait for 10 ns;
    end process;   

----------------------------------------------------
--Se comprueba si solo se ejecuta un estado a la vez
----------------------------------------------------
    ss_tb: process(standby, show, output, returns)
    begin       
        --assert(((standby AND show) OR (standby AND output) OR (standby AND returns) OR (show AND output)
        --         OR (show AND returns) OR (output AND returns)) = '1')
        --    report "Error: Estado no ejecutado correctamente"
        --severity failure;
    end process;
        
end Behavioral;
