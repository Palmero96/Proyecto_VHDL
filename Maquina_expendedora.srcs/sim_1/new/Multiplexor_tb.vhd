----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero, Emilio Miralles, Emilio Peñaranda
-- 
-- Create Date: 21.01.2019 01:09:52
-- Module Name: Multiplexor_tb - Behavioral
-- Project Name: Maquina Expendedora
-- Target Devices: Nexys 4 DDR
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

entity Multiplexor_tb is
end Multiplexor_tb;

architecture Behavioral of Multiplexor_tb is
    component Multiplexor PORT(
        clk : in STD_LOGIC;
        --Entradas Standby
        sb0 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sb1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sb2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sb3 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sb4 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sb5 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sb6 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sb7 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        --Entradas Show
        sh0 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sh1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sh2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sh3 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sh4 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sh5 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sh6 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        sh7 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        --Entradas Output
        ou0 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        ou1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        ou2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        ou3 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        ou4 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        ou5 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        ou6 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        ou7 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        --Entradas Returns
        re0 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        re1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        re2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        re3 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        re4 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        re5 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        re6 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        re7 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
        --Entradas Seleccionadoras
        sel_sb : in STD_LOGIC;
        sel_sh : in STD_LOGIC;
        sel_ou : in STD_LOGIC;
        sel_re : in STD_LOGIC;
        --Salidas 
        ss0 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        ss1 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        ss2 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        ss3 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        ss4 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        ss5 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        ss6 : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        ss7 : out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    end component;
    
    --Input Signals
    signal clk : STD_LOGIC := '0';
    signal sb1 : STD_LOGIC_VECTOR (7 DOWNTO 0) := "01010101";
    signal sb2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh3 : STD_LOGIC_VECTOR (7 DOWNTO 0) := "11111000";
    signal sh4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou6 : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00010000";
    signal ou7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re0 : STD_LOGIC_VECTOR (7 DOWNTO 0) := "11111111";
    signal sel_sb : STD_LOGIC;
    signal sel_sh : STD_LOGIC;
    signal sel_ou : STD_LOGIC;
    signal sel_re : STD_LOGIC;
    --OUTPUT SIGNALS
    signal ss0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ss1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ss2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ss3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ss4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ss5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ss6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ss7 : STD_LOGIC_VECTOR(7 DOWNTO 0);   
begin
-------------------------------------------
--Declaramos el uut: unit under test-------
-------------------------------------------
    uut : Multiplexor PORT MAP(
        clk => clk,
        sb0 => sb0,
        sb1 => sb1,
        sb2 => sb2,
        sb3 => sb3,
        sb4 => sb4,
        sb5 => sb5,
        sb6 => sb6,
        sb7 => sb7,
        sh0 => sh0,
        sh1 => sh1,
        sh2 => sh2,
        sh3 => sh3,
        sh4 => sh4,
        sh5 => sh5,
        sh6 => sh6,
        sh7 => sh7,
        ou0 => ou0,
        ou1 => ou1,
        ou2 => ou2,
        ou3 => ou3,
        ou4 => ou4,
        ou5 => ou5,
        ou6 => ou6,
        ou7 => ou7,
        re0 => re0,
        re1 => re1,
        re2 => re2,
        re3 => re3,
        re4 => re4,
        re5 => re5,
        re6 => re6,
        re7 => re7,
        sel_sb => sel_sb,
        sel_sh => sel_sh,
        sel_ou => sel_ou,
        sel_re => sel_re,
        ss0 => ss0,
        ss1 => ss1,
        ss2 => ss2,
        ss3 => ss3,
        ss4 => ss4,
        ss5 => ss5,
        ss6 => ss6,
        ss7 => ss7
    );        
    
    ----------------------------------------
    --Procesos para la simulacion de señales
    ----------------------------------------
    clk_tb: process(clk)
    begin
        clk <= not clk after 5 ns;
    end process;
    
    ---------------------------------
    ---Señales de seleccion----------
    ---------------------------------
    Sel_tb: process
    begin
        sel_sb <= '1';
        sel_sh <= '0';
        sel_ou <= '0';
        sel_re <= '0';
        wait for 25 ns;
        sel_sb <= '0';
        sel_sh <= '1';
        sel_ou <= '0';
        sel_re <= '0';
        wait for 25 ns;
        sel_sb <= '0';
        sel_sh <= '0';
        sel_ou <= '1';
        sel_re <= '0';
        wait for 25 ns;
        sel_sb <= '0';
        sel_sh <= '0';
        sel_ou <= '0';
        sel_re <= '1';
        wait for 25 ns;
    end process;

end Behavioral;
