----------------------------------------------------------------------------------
-- Company: UPM
-- Engineer: Álvaro Palmero Martínez
-- 
-- Create Date: 26.12.2018 23:55:13
-- Module Name: Top - Structural
-- Project Name: Máquina Expendedora
-- Target Devices: Nexys 4 DDR
-- Description: 
--      Entidad top encargada de controlar la máquina expendedora
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
    PORT(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        select_order : in STD_LOGIC_VECTOR (2 DOWNTO 0);
        coin_error : in STD_LOGIC;
        end_of_output : in STD_LOGIC;
        --Sensores de las diferentes monedas
        sen10c : in STD_LOGIC;
        sen20c : in STD_LOGIC;
        sen50c : in STD_LOGIC;
        sen1e : in STD_LOGIC;
        --Señales para las salidas necesarias
        output_sal : inout STD_LOGIC;
        output_ret : inout STD_LOGIC; 
        output_sho : inout STD_LOGIC;
        output_stb : inout STD_LOGIC;
        --Señal de salida para el display    
        display_select : out STD_LOGIC_VECTOR (7 DOWNTO 0);
        mensaje : out STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
end Top;

architecture Structural of Top is
------------------------------------------
--Declaracion de componentes usados en Top
------------------------------------------
    component State_machine PORT(
        order_number : in STD_LOGIC_VECTOR (2 downto 0);
        exact_amount : in STD_LOGIC;
        coin_error : in STD_LOGIC;
        overflow : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        end_of_return : in STD_LOGIC;
        end_of_output : in STD_LOGIC;
        standby : out STD_LOGIC;
        show : out STD_LOGIC;
        output : out STD_LOGIC;
        returns : out STD_LOGIC
    );
    end component;
    
    component Coin_manager PORT(
        sensor_10c : in STD_LOGIC;
        sensor_20c : in STD_LOGIC;
        sensor_50c : in STD_LOGIC;
        sensor_1e : in STD_LOGIC;
        rst: in STD_LOGIC;
        clk: in STD_LOGIC;
        salida_overflow : out STD_LOGIC;
        salida_correcto : out STD_LOGIC;
        counter : out INTEGER
    );
    end component;
    
    component Output PORT(
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
    end component;
    
    component Standby PORT(
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
    
    component Show PORT(
        clk: IN std_logic;
        show_en: IN std_logic;
        dinero: IN integer;
        
        s1: OUT std_logic_vector(7 downto 0);
        s2: OUT std_logic_vector(7 downto 0);
        s3: OUT std_logic_vector(7 downto 0);
        s4: OUT std_logic_vector(7 downto 0);
        s5: OUT std_logic_vector(7 downto 0);
        s6: OUT std_logic_vector(7 downto 0);
        s7: OUT std_logic_vector(7 downto 0);
        s8: OUT std_logic_vector(7 downto 0);
        output_s : OUT std_logic
        );
    end component;
    
    component Returns PORT(
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
    
    component Decoder PORT(
        code : in STD_LOGIC_VECTOR (7 DOWNTO 0);
        led : out STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
    end component;
    
    component Display PORT(
        clk : in STD_LOGIC;
        segment_0 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        segment_1 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        segment_2 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        segment_3 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        segment_4 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        segment_5 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        segment_6 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        segment_7 : in STD_LOGIC_VECTOR (6 DOWNTO 0);
        display_number : out STD_LOGIC_VECTOR(6 DOWNTO 0);
        display_selection : out STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
    end component;
    
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
--------------------------------------
--Declaracion de señales usados en Top
--------------------------------------
--Señales usadas por State Machine
    signal exact_amount : STD_LOGIC;
    signal overflow : STD_LOGIC;
    signal end_of_return : STD_LOGIC;
    signal s_standby : STD_LOGIC;
    signal s_show : STD_LOGIC;
    signal s_output : STD_LOGIC;
    signal s_returns : STD_LOGIC;
--Señales usadas por Coin_manager
    signal counter : integer;    
--Señales del mensaje mostrado para el display
    --Señales Standby
    signal sb1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sb8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    --Señales Show
    signal sh1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal sh8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    --Señales Output
    signal ou1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal ou8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    --Señales Returns
    signal re1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal re8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    --Señales Mult
    signal m1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal m2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal m3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal m4 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal m5 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal m6 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal m7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal m8 : STD_LOGIC_VECTOR (7 DOWNTO 0);
--Señales del mensaje para el display (Decodificado)
    signal d1: STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal d2: STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal d3: STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal d4: STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal d5: STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal d6: STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal d7: STD_LOGIC_VECTOR (6 DOWNTO 0);
    signal d8: STD_LOGIC_VECTOR (6 DOWNTO 0);
begin
----------------------------------------------------
--Instanciación de la máquina de estados del sistema
----------------------------------------------------
    Inst_ss: State_machine PORT MAP(
        order_number => select_order,
        exact_amount => exact_amount,
        coin_error => coin_error,
        overflow => overflow,
        rst => reset,
        clk => clock,
        end_of_return => end_of_return,
        end_of_output => end_of_output,
        standby => s_standby,
        show => s_show,
        output => s_output,
        returns => s_returns 
    );

---------------------------------------------------------------------
--Instanciacion de la entidad Coin Manager, gestor del uso de monedas
---------------------------------------------------------------------
    Inst_cm: Coin_manager PORT MAP(
        sensor_10c => Sen10c,
        sensor_20c => Sen20c,
        sensor_50c => Sen50c,
        sensor_1e => Sen1e,
        rst => reset,
        clk => clock,
        salida_overflow => overflow,
        salida_correcto => exact_amount,
        counter => counter
    );

----------------------------------------------------------------------
------------------Instanciacion de la entidad Output------------------
----------------------------------------------------------------------
    Inst_op: Output PORT MAP(
        output_en => s_output,
        clk => clock,
        codbebida => select_order,
        sacarbebida => output_sal,
        mens0 => ou1,
        mens1 => ou2,
        mens2 => ou3,
        mens3 => ou4,
        mens4 => ou5,
        mens5 => ou6,
        mens6 => ou7,
        mens7 => ou8
    );
    
----------------------------------------------------------------------
------------------Instanciacion de la entidad Standby-----------------
----------------------------------------------------------------------
    Inst_sb: Standby PORT MAP(
        clk => clock,
        standby_en => s_standby,
        Mens0 => sb1,
        Mens1 => sb2,
        Mens2 => sb3,
        Mens3 => sb4,
        Mens4 => sb5,
        Mens5 => sb6,
        Mens6 => sb7,
        Mens7 => sb8,
        output_standby => output_stb
    );
    
----------------------------------------------------------------------
------------------Instanciacion de la entidad Show--------------------
----------------------------------------------------------------------
    Inst_sh: Show PORT MAP(
        clk => clock,
        show_en => s_show,
        dinero => counter,
        s1 => sh1,
        s2 => sh2,
        s3 => sh3,
        s4 => sh4,
        s5 => sh5,
        s6 => sh6,
        s7 => sh7,
        s8 => sh8,
        output_s => output_sho
    );
    
----------------------------------------------------------------------
------------------Instanciacion de la entidad Show--------------------
----------------------------------------------------------------------
    Inst_Rt: Returns PORT MAP(
        clk => clock,
        returns_en => s_returns,
        s1 => re1,
        s2 => re2,
        s3 => re3,
        s4 => re4,
        s5 => re5,
        s6 => re6,
        s7 => re7,
        s8 => re8,
        end_of_returns => end_of_return,
        output_ret => output_ret
    );
    
----------------------------------------------------------------------
-----------------Instanciacion de la entidad Decoder------------------
----------------------------------------------------------------------
    Inst_dec1: Decoder PORT MAP(
        code => m1,
        led => d1
    );
    
    Inst_dec2: Decoder PORT MAP(
        code => m2,
        led => d2
    );
    
    Inst_dec3: Decoder PORT MAP(
        code => m3,
        led => d3
    );
    
    Inst_dec4: Decoder PORT MAP(
        code => m4,
        led => d4
    );
    
    Inst_dec5: Decoder PORT MAP(
        code => m5,
        led => d5
    );
    
    Inst_dec6: Decoder PORT MAP(
        code => m6,
        led => d6
    );
    
    Inst_dec7: Decoder PORT MAP(
        code => m7,
        led => d7
    );
    
    Inst_dec8: Decoder PORT MAP(
        code => m8,
        led => d8
    );
    
----------------------------------------------------------------------
-----------------Instanciacion de la entidad Display------------------
----------------------------------------------------------------------
    Inst_Dis: Display PORT MAP(
        clk => clock,
        segment_0 => d1,
        segment_1 => d2,
        segment_2 => d3,
        segment_3 => d4,
        segment_4 => d5,
        segment_5 => d6,
        segment_6 => d7,
        segment_7 => d8,
        display_number => mensaje,
        display_selection => display_select
    );
    
--------------------------------------------------------------
-----------Instanciacion de la entidad Multiplexor------------
--------------------------------------------------------------
    Inst_mult: Multiplexor PORT MAP(
        clk => clock,
        sb0 => sb1,
        sb1 => sb2,
        sb2 => sb3,
        sb3 => sb4,
        sb4 => sb5,
        sb5 => sb6,
        sb6 => sb7,
        sb7 => sb8,
        sh0 => sh1,
        sh1 => sh2,
        sh2 => sh3,
        sh3 => sh4,
        sh4 => sh5,
        sh5 => sh6,
        sh6 => sh7,
        sh7 => sh8,
        ou0 => ou1,
        ou1 => ou2,
        ou2 => ou3,
        ou3 => ou4,
        ou4 => ou5,
        ou5 => ou6,
        ou6 => ou7,
        ou7 => ou8,
        re0 => re1,
        re1 => re2,
        re2 => re3,
        re3 => re4,
        re4 => re5,
        re5 => re6,
        re6 => re7,
        re7 => re8,
        sel_sb => output_stb,
        sel_sh => output_sho,
        sel_ou => output_sal,
        sel_re => output_ret,
        ss0 => m1,
        ss1 => m2,
        ss2 => m3,
        ss3 => m4,
        ss4 => m5,
        ss5 => m6,
        ss6 => m7,
        ss7 => m8
    );        
end Structural;
