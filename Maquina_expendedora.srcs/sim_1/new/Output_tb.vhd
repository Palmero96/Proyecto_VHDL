----------------------------------------------------------------------------------
-- Company: upm
-- Engineer: Emilio Peñaranda 
-- 
-- Create Date: 31.12.2018 00:34:21
-- Design Name: 
-- Module Name: Output_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Output_tb is
--  Port ( );
end Output_tb;

architecture Behavioral of Output_tb is

   component output PORT(
                output_en: in std_logic;
                Clk: in std_logic;
                codbebida: in std_logic_vector (2 downto 0);
                sacarbebida: out std_logic;
                mens0: out std_logic_vector (7 downto 0);
                mens1: out std_logic_vector (7 downto 0);
                mens2: out std_logic_vector (7 downto 0);
                mens3: out std_logic_vector (7 downto 0);
                mens4: out std_logic_vector (7 downto 0);
                mens5: out std_logic_vector (7 downto 0);
                mens6: out std_logic_vector (7 downto 0);
                mens7: out std_logic_vector (7 downto 0)
   );
   end component;


 --Input signals
   signal  output_en: std_logic:='0';
   signal  Clk:  std_logic :='0';
   signal codbebida: std_logic_vector(2 downto 0):=("000");
   
   --Output signals
 signal  sacarbebida: std_logic := '0';
 signal mens0:  std_logic_vector (7 downto 0);
 signal mens1: std_logic_vector (7 downto 0);
 signal mens2:  std_logic_vector (7 downto 0);
 signal mens3:  std_logic_vector (7 downto 0);
 signal mens4:  std_logic_vector (7 downto 0);
 signal mens5:  std_logic_vector (7 downto 0);
 signal mens6:  std_logic_vector (7 downto 0);
 signal mens7:  std_logic_vector (7 downto 0);

begin

      uut : output PORT MAP(
               output_en => output_en,
               clk => clk,
               sacarbebida => sacarbebida,
               codbebida => codbebida,
               mens0 => mens0,
               mens1 => mens1,
              mens2 => mens2,
              mens3 => mens3,
              mens4 => mens4,
              mens5 => mens5,
              mens6 => mens6,
              mens7 => mens7
               
               );
               
      clk_tb: process(clk)
                   begin
                       clk <= not clk after 5 ns;
                   end process;
      sacarbebida_tb: process(output_en)
                   begin
                       output_en <= not output_en after 70 ns;
                       end process;
       codigobebida_tb: process
                   begin
                   codbebida <= codbebida + 1;
                   wait for 16 ns;
                   end process;

end Behavioral;
