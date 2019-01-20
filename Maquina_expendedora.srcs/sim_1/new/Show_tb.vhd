----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2018 00:34:21
-- Design Name: 
-- Module Name: Show_tb - Behavioral
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

entity Show_tb is
end Show_tb;

architecture Behavioral of Show_tb is
 component show PORT(
       clk : in STD_LOGIC;
       show_en : in STD_LOGIC;
       dinero : in INTEGER;
       s1: OUT std_logic_vector(7 downto 0);
       s2: OUT std_logic_vector(7 downto 0);
       s3: OUT std_logic_vector(7 downto 0);
       s4: OUT std_logic_vector(7 downto 0);
       s5: OUT std_logic_vector(7 downto 0);
       s6: OUT std_logic_vector(7 downto 0);
       s7: OUT std_logic_vector(7 downto 0);
       s8: OUT std_logic_vector(7 downto 0)
   );
   end component;
   
      --Input signals
      signal clk : STD_LOGIC := '0';
      signal show_en : STD_LOGIC := '0';
      signal dinero : INTEGER;
      
      --Output signals
      signal s1 : STD_LOGIC_VECTOR(7 downto 0);
      signal s2 : STD_LOGIC_VECTOR(7 downto 0);
      signal s3 : STD_LOGIC_VECTOR(7 downto 0);
      signal s4 : STD_LOGIC_VECTOR(7 downto 0);
      signal s5 : STD_LOGIC_VECTOR(7 downto 0);
      signal s6 : STD_LOGIC_VECTOR(7 downto 0);
      signal s7 : STD_LOGIC_VECTOR(7 downto 0);
      signal s8 : STD_LOGIC_VECTOR(7 downto 0);   
begin
---------------------------------------
--Declaracion del unit under test (uut)
---------------------------------------
uut: show PORT MAP(
    clk => clk,
    show_en => show_en,
    dinero => dinero,
    s1 => s1,
    s2 => s2,
    s3 => s3,
    s4 => s4,
    s5 => s5,
    s6 => s6,
    s7 => s7,
    s8 => s8
);

  ------------------
    --Uso de reloj
  ------------------
   clk_tb: process(clk)
   begin
        clk <= not clk after 2 ns;
        show_en <= not show_en after 5 ns;
    end process;
    
  ------------------
  --simulacion LETRAS
  ------------------
    s_tb: process 
     begin
         s1 <= s1;
         s2 <= s2;
         s3 <= s3;
         s4 <= s4;
         s5 <= s5;
     end process;
     
   ------------------
   --simulacion dinero
   ------------------   
     
   dinero_tb: process(dinero,clk)
        dinero = dinero + 5 after 7 ns;
        s6 <= s6;
        s7 <= s7;
        s8 <= s8;
         
     end if;
   end process;     
    
    
   
    

end Behavioral;
