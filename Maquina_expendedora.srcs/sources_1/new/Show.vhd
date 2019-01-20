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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
        );
end Show;

architecture Behavioral of Show is
    signal si1: STD_LOGIC := '0';
    signal si2: STD_LOGIC := '0';
    signal si3: STD_LOGIC := '0';
    signal si4: STD_LOGIC := '0';
    signal si5: STD_LOGIC := '0';
    signal si6: STD_LOGIC := '0';
    signal si7: STD_LOGIC := '0';
    signal si8: STD_LOGIC := '0';
    
begin

Conv_dinero: process (dinero)
    if (dinero != 0) then 
            with (dinero mod 100) select
             s8 <= 
                     "00110000" when 0,
                     "00110001" when 1,
                     "00110010" when 2,
                     "00110011" when 3,
                     "00110100" when 4,
                     "00110101" when 5,
                     "00110110" when 6,
                     "00110111" when 7,
                     "00111000" when 8,
                     "00111001" when 9;
        dinero <= dinero/100;
             with (dinero mod 100) select
             s7 <= 
                     "00110000" when 0,
                     "00110001" when 1,
                     "00110010" when 2,
                     "00110011" when 3,
                     "00110100" when 4,
                     "00110101" when 5,
                     "00110110" when 6,
                     "00110111" when 7,
                     "00111000" when 8,
                     "00111001" when 9;
        dinero <= dinero/100;
            with (dinero mod 100) select
              s6 <= 
                     "00110000" when 0,
                     "00110001" when 1,
                     "00110010" when 2,
                     "00110011" when 3,
                     "00110100" when 4,
                     "00110101" when 5,
                     "00110110" when 6,
                     "00110111" when 7,
                     "00111000" when 8,
                     "00111001" when 9;
        end if;    
    end process;
 
 Sincro_proc: process(clk)
 if (clk'event and clk= '1') then
    s1 <= si1;
    s2 <= si2;
    s3 <= si3;
    s4 <= si4;
    s5 <= si5;
    s6 <= si6;
    s7 <= si7;
    s8 <= si8;
    
 end if;
 
 END process;
 
 Show_proc: process(show_en)
  if (show = '1') then
   s1 <= "01001101"  --M
   s2 <= "01001111"  --O
   s3 <= "01001110"  --N
   s4 <= "01000101"  --E
   s5 <= "01011001"  --Y
  else 
   s1 <= si1;
   s2 <= si2;
   s3 <= si3;
   s4 <= si4;
   s5 <= si5;
   s6 <= si6;
   s7 <= si7;
   s8 <= si8;
 end if;
end process;

end Behavioral;
