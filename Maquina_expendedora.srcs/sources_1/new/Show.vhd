----------------------------------------------------------------------------------
-- Company: UPM 
-- Engineer: Emilio Miralles Rivera
-- 
-- Create Date: 31.12.2018 00:30:50
-- Design Name: 
-- Module Name: Show - Behavioral
-- Project Name: Maquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Tool Versions: 
-- Description: 
--             Entidad Show encargada de mostrar los numeros por el display de 7 segmentos
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Show is
  Port (
        clk: IN std_logic;
        show_en: IN std_logic;
        dinero: IN integer;
        
        s1: OUT std_logic_vector(7 downto 0);
        s2: OUT std_logic_vector(7 downto 0);
        s3: OUT std_logic_vector(7 downto 0);
        s4: OUT std_logic_vector(7 downto 0);
        s5: OUT std_logic_vector(7 downto 0);
        s6: OUT std_logic_vector(7 downto 0);
        s7: OUT std_logic_vector(7 downto 0);
        s8: OUT std_logic_vector(7 downto 0);
        output_s : OUT std_logic
        );
end Show;

architecture Behavioral of Show is
    signal si1: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal si2: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal si3: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal si4: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal si5: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal si6: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal si7: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal si8: STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sshow : STD_LOGIC;
    
    --Señales usadas para calcular el numero
    signal r1 : integer range 0 to 9;
    signal r2 : integer;
    signal r3 : integer;
    
    --Señales usadas para el calculo
    signal ssi6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ssi7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ssi8 : STD_LOGIC_VECTOR ( 7 DOWNTO 0);
begin

    ----------------------------------------------
    --Conversion del dinero a formato ASCII-------
    ----------------------------------------------
    Conv_dinero: process (dinero, clk)
    begin
            r1 <= (dinero / 100) rem 10;
                case r1 is
                    when 0 => ssi6 <= "00110000";
                    when 1 => ssi6 <= "00110001";
                    when 2 => ssi6 <= "00110010";
                    when 3 => ssi6 <= "00110011";
                    when 4 => ssi6 <= "00110100";
                    when 5 => ssi6 <= "00110101";
                    when 6 => ssi6 <= "00110110";
                    when 7 => ssi6 <= "00110111";
                    when 8 => ssi6 <= "00111000";
                    when 9 => ssi6 <= "00111001";
                end case;
            r2 <= (dinero / 10) rem 10;
                case r2 is
                    when 0 => ssi7 <= "00110000";
                    when 1 => ssi7 <= "00110001";
                    when 2 => ssi7 <= "00110010";
                    when 3 => ssi7 <= "00110011";
                    when 4 => ssi7 <= "00110100";
                    when 5 => ssi7 <= "00110101";
                    when 6 => ssi7 <= "00110110";
                    when 7 => ssi7 <= "00110111";
                    when 8 => ssi7 <= "00111000";
                    when 9 => ssi7 <= "00111001";
                    when others => ssi7 <= "00110000";
                end case;
            r3 <= dinero rem 10;
                case r3 is
                    when 0 => ssi8 <= "00110000";
                    when 1 => ssi8 <= "00110001";
                    when 2 => ssi8 <= "00110010";
                    when 3 => ssi8 <= "00110011";
                    when 4 => ssi8 <= "00110100";
                    when 5 => ssi8 <= "00110101";
                    when 6 => ssi8 <= "00110110";
                    when 7 => ssi8 <= "00110111";
                    when 8 => ssi8 <= "00111000";
                    when 9 => ssi8 <= "00111001";
                    when others => ssi8 <= "00110000";
                end case;
        end process;
     
     --------------------------------------
     --Sincronizacion con el reloj---------
     --------------------------------------
     Sincro_proc: process(clk)
     begin
        if (rising_edge(clk)) then
            output_s <= sshow;
            if (show_en = '1') then
                s1 <= si1;
                s2 <= si2;
                s3 <= si3;
                s4 <= si4;
                s5 <= si5;
                s6 <= si6;
                s7 <= si7;
                s8 <= si8;
            end if;
        end if;
     END process;
 
    ----------------------------------------
    --Asignacion de los valores a las salidas
    -----------------------------------------
     Show_proc: process(clk)
         begin
              if (show_en = '1') then
                  sshow <= '1';
                  si1 <= "01001101";  --M
                  si2 <= "01001111";  --O
                  si3 <= "01001110";  --N
                  si4 <= "01000101";  --E
                  si5 <= "01011001";  --Y
                  si6 <= ssi6;
                  si7 <= ssi7;
                  si8 <= ssi8;
              else 
                  sshow <= '0';
         end if;
    end process;

end Behavioral;
