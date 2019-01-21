----------------------------------------------------------------------------------
-- Company: Upm
-- Engineer: Emilio Peñaranda
-- 
-- Create Date: 31.12.2018 00:30:50
-- Design Name: 
-- Module Name: Returns - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
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

entity Standby is
Port ( Clk: in STD_LOGIC;
      standby_en: in STD_LOGIC; 
      Mens0 : out STD_LOGIC_vector(7 downto 0);
      Mens1: out STD_LOGIC_vector(7 downto 0);
      Mens2 : out STD_LOGIC_vector(7 downto 0);
      Mens3 : out STD_LOGIC_vector(7 downto 0);
      Mens4 : out STD_LOGIC_vector(7 downto 0);
      Mens5 : out STD_LOGIC_vector(7 downto 0);
      Mens6 : out STD_LOGIC_vector(7 downto 0);
      Mens7 : out STD_LOGIC_vector(7 downto 0);
      output_standby : out STD_LOGIC);
end Standby;

architecture Behavioral of Standby is

signal salida0: std_logic_vector (7 downto 0);
signal salida1: std_logic_vector (7 downto 0);
signal salida2: std_logic_vector (7 downto 0);
signal salida3: std_logic_vector (7 downto 0);
signal salida4: std_logic_vector (7 downto 0);
signal salida5: std_logic_vector (7 downto 0);
signal salida6: std_logic_vector (7 downto 0);
signal salida7: std_logic_vector (7 downto 0);
signal soutput: std_logic;

begin
   -------------------------------------------------------------------------
   -- Proceso que actualiza la salida mientras standby este a 1 y sncrono
   ------------------------------------------------------------------------
   
         actualizar : process (standby_en)
         begin 
                   if (standby_en = '1')then
                         salida0 <= ("01010111"); --W
                         salida1<= ("01000001");  --A
                         salida2 <= ("01001001");  --I
                         salida3 <= ("01010100");   --T
                         salida4 <= ("01001001");   --I
                         salida5<= ("01001110");    -- N
                         salida6 <= ("01000111");   -- G                     
                         salida7 <= ("10000000");    --
                         soutput <= '1';
                    
                   elsif (standby_en = '0') then
                         salida0 <= salida0; 
                         salida1 <= salida1;                              
                         salida2 <= salida2;                  
                         salida3 <= salida3;                  
                         salida4 <= salida4;                   
                         salida5 <= salida5;                   
                         salida6 <= salida6;                  
                         salida7 <= salida7;
                         soutput <= '0';
                   end if; 
                     
        end process;
  ------------------------------------------  
          -- Mostramos por pantalla la salida
  ------------------------------------------            
        show: process (clk, standby_en)
            begin 
            if (rising_edge(Clk))then
                output_standby <= soutput; 
                Mens0 <=salida0;
                Mens1 <=salida1;
                Mens2 <=salida2;
                Mens3 <=salida3;  
                Mens4 <=salida4;
                Mens5 <=salida5;
                Mens6 <=salida6;
                Mens7 <=salida7;    
            end if;
        end process;

-------------------------------------------------------
end Behavioral;
