----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2019 21:12:38
-- Design Name: 
-- Module Name: Display_tb - Behavioral
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

entity Display_tb is
--  Port ( );
end Display_tb;

architecture Behavioral of Display_tb is

component display 
        Generic(
            frec : integer := 50000000);
        Port (
            clk : in  STD_LOGIC;
            segment_0 : IN std_logic_vector(6 downto 0);
            segment_1 : IN std_logic_vector(6 downto 0);
            segment_2 : IN std_logic_vector(6 downto 0);
	        segment_3 : IN std_logic_vector(6 downto 0);
	        segment_4 : IN std_logic_vector(6 downto 0);
	        segment_5 : IN std_logic_vector(6 downto 0);
	        segment_6 : IN std_logic_vector(6 downto 0);
	        segment_7 : IN std_logic_vector(6 downto 0);
            display_number : out  STD_LOGIC_VECTOR (6 downto 0);
            display_selection : out  STD_LOGIC_VECTOR (7 downto 0)
           );
           end component;
           
        
           --input signals
               signal   clk :   STD_LOGIC :='0';
               signal  segment_0 : std_logic_vector(6 downto 0) :="0000000";
               signal segment_1 :  std_logic_vector(6 downto 0) :="0000001";
               signal segment_2 :  std_logic_vector(6 downto 0) :="0000010";
               signal segment_3 :  std_logic_vector(6 downto 0) :="0001000";
               signal segment_4 :  std_logic_vector(6 downto 0) :="0010000";
               signal segment_5 :  std_logic_vector(6 downto 0) :="0100000";
               signal segment_6 :  std_logic_vector(6 downto 0) :="0000100";
               signal segment_7 :  std_logic_vector(6 downto 0) :="1000000";
--output signals 
               signal display_number : std_logic_vector(6 downto 0);
               signal display_selection : std_logic_vector(7 downto 0);
               
begin

uut: display 
    Generic map(
        frec => 50000000)
    port map(
        Clk =>Clk,
       segment_0 => segment_0,
       segment_1 => segment_1,
       segment_2 => segment_2,
       segment_3 => segment_3,
       segment_4 => segment_4,
       segment_5 => segment_5,
       segment_6 => segment_6,
       segment_7 => segment_7,
       display_number => display_number,
       display_selection => display_selection
       );
       
       
      -------------------------------
      --Uso de reloj y señal de reset
      -------------------------------
      clk_tb: process(clk)
       begin
           clk <= not clk after 2 ns;
       end process;
      
       display_tb: process
       begin
       
       
       end process;
end Behavioral;

