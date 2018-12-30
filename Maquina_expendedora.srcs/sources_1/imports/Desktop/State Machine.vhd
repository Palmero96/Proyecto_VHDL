----------------------------------------------------------------------------------
-- Company: UPM 
-- Engineer: �lvaro Palmero Mart�nez
-- 
-- Create Date: 26.12.2018 19:56:04
-- Module Name: State _machine - Behavioral
-- Project Name: Maquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      L�gica para la m�quina de estados por la cual funcinar� toda la m�quina expendedora
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity State_machine is
    Port ( order_number : in STD_LOGIC_VECTOR (2 downto 0);
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
           returns : out STD_LOGIC);
end State_machine;

architecture Behavioral of State_machine is
    type state_type is (S_STANDBY, S_SHOW, S_OUTPUT, S_RETURNS);
    signal state, next_state : state_type;
begin
------------------------------------------------------------------------------------
--Se define el uso del bot�n reset as� como se sincroniza el proceso con el reloj.
--En este caso el bot�n reset llevar� al sistema a un estado de devoluci�n de dinero
-- (si hay) para volver despues al standby.
------------------------------------------------------------------------------------
    sync_proc: process(clk, rst)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                state <= S_RETURNS;
            else
                state <= next_state;
            end if;
        end if;
    end process;
    
------------------------------------------------------------------------------------
--Este proceso define las salidas de la m�quina de estados en funci�n de su
--  estado actual, de forma que �nicamente depende de �ste.
------------------------------------------------------------------------------------
    salidas_ss: process(state)
    begin
        case (state) is
            when S_STANDBY => standby <= '1';
                              show <= '0';
                              output <= '0';
                              returns <= '0';
            when S_SHOW =>    standby <= '0';
                              show <= '1';
                              output <= '0';
                              returns <= '0';                              
            when S_OUTPUT =>  standby <= '0';
                              show <= '0';
                              output <= '1';
                              returns <= '0';
            when S_RETURNS => standby <= '0';
                              show <= '0';
                              output <= '0';
                              returns <= '1';
            when OTHERS =>    standby <= '0';
                              show <= '0';
                              output <= '0';
                              returns <= '0';
        end case;
    end process;

-------------------------------------------------------------------------------------
--Este proceso define como evoluciona el sistema en funcion de las entradas que haya.
-------------------------------------------------------------------------------------
    evo_ss: process (state, order_number, exact_amount, overflow, end_of_return, end_of_output, coin_error)
    begin
        next_state <= S_STANDBY;
        case (state) is
            when S_STANDBY =>
                if (order_number /= "000") then
                    next_state <= S_SHOW;
                else
                    next_state <= state;
                end if;
            when S_SHOW =>
                if (exact_amount = '1') then
                    next_state <= S_OUTPUT;
                else 
                    if (overflow = '1' OR coin_error = '1') then
                        next_state <= S_RETURNS;
                    else 
                        next_state <= state;
                    end if;
                end if;
            when S_OUTPUT =>
                if (end_of_output = '1') then
                    next_state <= S_STANDBY;
                else 
                    next_state <= state;
                end if;
            when S_RETURNS =>
                if (end_of_return = '1') then
                    next_state <= S_STANDBY;
                else
                    next_state <= state;
                end if;                    
        end case;
    end process;
end Behavioral;
