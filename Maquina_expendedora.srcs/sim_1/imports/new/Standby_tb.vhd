----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2018 00:34:21
-- Design Name: 
-- Module Name: Standby_tb - Behavioral
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

entity Standby_tb is
--  Port ( );
end Standby_tb;

architecture Behavioral of Standby_tb is
 component standby PORT(
      Clk: in STD_LOGIC;
       standby_en: in STD_LOGIC; 
       Mens0 : out STD_LOGIC_vector(7 downto 0);
       Mens1: out STD_LOGIC_vector(7 downto 0);
       Mens2 : out STD_LOGIC_vector(7 downto 0);
       Mens3 : out STD_LOGIC_vector(7 downto 0);
       Mens4 : out STD_LOGIC_vector(7 downto 0);
       Mens5 : out STD_LOGIC_vector(7 downto 0);
       Mens6 : out STD_LOGIC_vector(7 downto 0);
       Mens7 : out STD_LOGIC_vector(7 downto 0);
       output_standby : out STD_LOGIC
       );
  end component;
  
     --Input signals 
      signal Clk:  std_logic := '0';
      signal standby_en:  std_logic :='0'; 
     --Output signals
     signal Mens0: std_logic_vector (7 downto 0);
     signal Mens1: std_logic_vector (7 downto 0);
     signal mens2: std_logic_vector (7 downto 0);
     signal mens3: std_logic_vector (7 downto 0);
     signal mens4: std_logic_vector (7 downto 0);
     signal mens5: std_logic_vector (7 downto 0);
     signal mens6: std_logic_vector (7 downto 0);
     signal mens7: std_logic_vector (7 downto 0); 
     signal output_standby : std_logic;
     
begin


 uut: standby PORT MAP(
       Clk  =>Clk,
       standby_en =>standby_en,
       Mens0=>Mens0,
       Mens1=>Mens1,
       Mens2=>Mens2,
       Mens3=>Mens3,
       Mens4=>Mens4,
       Mens5=>Mens5,
       Mens6 =>Mens6,
       Mens7=>Mens7,
       output_standby => output_standby
       );
       
       
           -------------------------------
           --Uso de reloj y señal de reset
           -------------------------------
           clk_tb: process(clk)
           begin
               clk <= not clk after 2 ns;
           end process;

           standby_en_tb: process(standby_en)
           begin
               standby_en <= not standby_en after 35 ns;
           end process;



end Behavioral;
