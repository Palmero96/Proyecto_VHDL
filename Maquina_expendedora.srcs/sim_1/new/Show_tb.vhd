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
       s8: OUT std_logic_vector(7 downto 0);
       trampita : out integer
   );
   end component;
   
      --Input signals
      signal clk : STD_LOGIC := '0';
      signal show_en : STD_LOGIC := '0';
      signal dinero : INTEGER := 0;
      
      --Output signals
      signal s1 : STD_LOGIC_VECTOR(7 downto 0);
      signal s2 : STD_LOGIC_VECTOR(7 downto 0);
      signal s3 : STD_LOGIC_VECTOR(7 downto 0);
      signal s4 : STD_LOGIC_VECTOR(7 downto 0);
      signal s5 : STD_LOGIC_VECTOR(7 downto 0);
      signal s6 : STD_LOGIC_VECTOR(7 downto 0);
      signal s7 : STD_LOGIC_VECTOR(7 downto 0);
      signal s8 : STD_LOGIC_VECTOR(7 downto 0);  
      
      signal trampita : integer; 
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
        s8 => s8,
        trampita => trampita
    );

      ------------------
        --Uso de reloj
      ------------------
       clk_tb: process(clk)
       begin
            clk <= not clk after 2 ns;
        end process;
        
       show_tb : process
       begin
           show_en <= '0';
           wait for 20 ns;
           show_en <= '1';
           wait for 1000 ns;
       end process;
         
       ------------------
       --simulacion dinero
       ------------------   
         
       dinero_tb: process
       begin
            dinero <= (dinero + 5);
            wait for 25 ns;
       end process;     
end Behavioral;
