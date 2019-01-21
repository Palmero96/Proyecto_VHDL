----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 31.12.2018 00:34:21
-- Module Name: Returns_tb - Behavioral
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Testbench para la entidad (estado) Returns
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Returns_tb is
end Returns_tb;

architecture Behavioral of Returns_tb is
    component Returns 
    GENERIC(
        frec : integer := 50000000);
    PORT(
        clk : in STD_LOGIC;
        returns_en : in STD_LOGIC;
        s1 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s2 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s3 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s4 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s5 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s6 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s7 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        s8 : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        end_of_returns : out STD_LOGIC;
        output_ret : out STD_LOGIC
    );
    end component;
    
    --Input signals
    signal clk : STD_LOGIC := '0';
    signal returns_en : STD_LOGIC := '0';
    --Output signals
    signal s1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal s2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal s3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal s4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal s5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal s6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal s7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal s8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal end_of_returns : STD_LOGIC;
    signal output_ret : STD_LOGIC;
begin
    -----------------------
    --UUT : UNIT UNDER TEST
    -----------------------
    uut: Returns 
    GENERIC MAP(
        frec => 50000000)
    PORT MAP(
        clk => clk,
        returns_en => returns_en,
        s1 => s1,
        s2 => s2,
        s3 => s3,
        s4 => s4,
        s5 => s5,
        s6 => s6,
        s7 => s7,
        s8 => s8,
        end_of_returns => end_of_returns,
        output_ret => output_ret
    );
    
    -------------------------------------------
    -- Declaramos el pulso de reloj y el enable
    --  reloj = 100MHZ para coincidir
    -------------------------------------------
    --Reloj
    clk_tb: process(clk)
    begin
        clk <= not clk after 5 ns;
    end process;
    
    --Returns_enable
    Ren_tb: process
    begin
        Returns_en <= '0';
        wait for 500 ns;
        Returns_en <= '1';
        wait for 20000 ns;
    end process;
    
end Behavioral;
