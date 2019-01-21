----------------------------------------------------------------------------------
-- Company: upm
-- Engineer: emilio miralles y emilio peñaranda
-- 
-- Create Date: 20.01.2019 21:12:19
-- Design Name: 
-- Module Name: Display - Behavioral
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

entity Display is
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
end Display;

architecture Behavioral of Display is
    signal cnt : integer :=0;
    signal clk2 : STD_LOGIC;
    signal count : integer := 0;
 begin
 
 clk_2: process(clk)
 begin
    if (rising_edge(clk)) then
        if (count = frec) then
            count <= 0;
            clk2 <= not clk2;
        else 
            count <= count + 1;
        end if;
    end if;
end process;
 
 
 cnt_sum: process (clk2)
 begin 
            if( rising_edge(clk2)) then 
                    cnt <= cnt +1;
                    if ( cnt = 7) then
                          cnt <= 0;
                    end if;
            end if;
 end process;
 
   muestra_displays:process (clk, segment_1, segment_2, segment_3, segment_4, segment_5, segment_6, segment_7)
    begin
              case cnt is
                    when 0 =>
                    display_number <= segment_0;
                    display_selection <= "11111110";
                    when 1 =>
                    display_number <= segment_1;
                    display_selection <= "11111101";
                     when 2 =>
                    display_number <= segment_2;
                    display_selection <= "11111011";
                    when 3 =>
                    display_number <= segment_3;
                    display_selection <= "11110111";
                    when 4 =>
                    display_number <= segment_4;
                    display_selection <= "11101111"; 
                    when 5 =>
                    display_number <= segment_5;
                    display_selection <= "11011111";
                    when 6 =>
                    display_number <= segment_6;
                    display_selection <= "10111111"; 
                    when 7 =>
                    display_number <= segment_7;
                    display_selection <= "01111111";
                    when others =>
                    display_number <= segment_0;
                    display_selection <= "00000000";
             end case; 
    end process;
    
    
   

end Behavioral;
