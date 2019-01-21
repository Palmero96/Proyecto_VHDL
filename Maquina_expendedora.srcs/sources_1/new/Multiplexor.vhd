----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.01.2019 01:09:21
-- Design Name: 
-- Module Name: Multiplexor - Behavioral
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

entity Multiplexor is
    PORT(
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
end Multiplexor;

architecture Behavioral of Multiplexor is
    signal sig0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sig1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sig2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sig3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sig4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sig5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sig6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sig7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
    -----------------------------------
    --------Sync de la entidad---------
    -----------------------------------
    clk_tb: process(clk)
    begin
        if (rising_edge(clk)) then
            ss0 <= sig0;
            ss1 <= sig1;
            ss2 <= sig2;
            ss3 <= sig3;
            ss4 <= sig4;
            ss5 <= sig5;
            ss6 <= sig6;
            ss7 <= sig7;
        end if;
    end process;
    
    -----------------------------------------------------
    -----------Seleccionador del multiplexor-------------
    -----------------------------------------------------
    seleccionador: process(sel_sb, sel_sh, sel_ou, sel_re)
    begin
        if (sel_sb = '1') then
            sig0 <= sb0;
            sig1 <= sb1;
            sig2 <= sb2;
            sig3 <= sb3;
            sig4 <= sb4;
            sig5 <= sb5;
            sig6 <= sb6;
            sig7 <= sb7;
        else 
            if (sel_sh = '1') then
                sig0 <= sh0;
                sig1 <= sh1;
                sig2 <= sh2;
                sig3 <= sh3;
                sig4 <= sh4;
                sig5 <= sh5;
                sig6 <= sh6;
                sig7 <= sh7;
            else
                if (sel_ou = '1') then
                    sig0 <= ou0;
                    sig1 <= ou1;
                    sig2 <= ou2;
                    sig3 <= ou3;
                    sig4 <= ou4;
                    sig5 <= ou5;
                    sig6 <= ou6;
                    sig7 <= ou7;
                else
                    if (sel_re = '1') then
                        sig0 <= re0;
                        sig1 <= re1;
                        sig2 <= re2;
                        sig3 <= re3;
                        sig4 <= re4;
                        sig5 <= re5;
                        sig6 <= re6;
                        sig7 <= re7;
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
