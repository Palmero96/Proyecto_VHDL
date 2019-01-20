----------------------------------------------------------------------------------
-- Company: upm
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

entity Output is
    Port ( 
               output_en: in  std_logic;
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
end Output;

architecture Behavioral of Output is





begin


asig_proc: process(codbebida, clk)
    begin
        if (rising_edge(clk)) then
           mens0 <= "01010011";       --S
           mens1 <= "01000001";       --A
           mens2 <= "01001100";       --L
           mens3 <= "01000101";       --E	
           mens4 <= "01000000";        -- 
           if (codbebida(0)= '0')then
               mens5 <= "00000000" ;
           else
               mens5 <="00000001";
               end if;    
 
           if (codbebida(1)= '0')then
               mens6 <= "00000000" ;
           else
               mens6 <="00000001";
 
               end if; 
           if (codbebida(2)= '0')then
               mens7 <= "00000000" ;
           else
               mens7 <="00000001";
           end if;                    
        end if;
    end process;

sacar_proc: process(output_en)
    begin
        if (output_en='1') then
           sacarbebida <= '1';
        elsif(output_en ='0')then
           sacarbebida <= '0';
        end if;
    end process;


end Behavioral;
