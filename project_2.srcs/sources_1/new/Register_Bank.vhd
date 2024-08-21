----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 01:54:23 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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
entity Register_bank is
     Port ( 
     RegisterEnable : in STD_LOGIC_VECTOR (2 downto 0);
     Clk : in STD_LOGIC;
     reset : in STD_LOGIC;
     Q0 : out STD_LOGIC_VECTOR (3 downto 0);
     Q1 : out STD_LOGIC_VECTOR (3 downto 0);
     Q2 : out STD_LOGIC_VECTOR (3 downto 0);
     Q3 : out STD_LOGIC_VECTOR (3 downto 0);
     Q4 : out STD_LOGIC_VECTOR (3 downto 0);
     Q5 : out STD_LOGIC_VECTOR (3 downto 0);
     Q6 : out STD_LOGIC_VECTOR (3 downto 0);
     Q7 : out STD_LOGIC_VECTOR (3 downto 0);
     D : in STD_LOGIC_VECTOR (3 downto 0));
end Register_bank;
architecture Behavioral of Register_bank is

component Decoder_3_to_8
Port ( 
    I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg
    Port ( 
    D : in STD_LOGIC_VECTOR (3 downto 0);
    En : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0);
    Res : in STD_LOGIC);
end component;

signal en:std_logic;
signal y : STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0:Decoder_3_to_8
port map(
     I =>RegisterEnable,
     EN =>en,
     Y=>y
);
Reg_0:Reg
port map(
     D=>"0000",
     EN=>y(0),
     Clk=>Clk,
     Q=>Q0,
     Res=>reset
);
Reg_1:Reg
port map(
     D=>D,
     EN=>y(1),
     Clk=>Clk,
     Q=>Q1,
     Res=>reset
);
Reg_2:Reg
port map(
     D=>D,
     EN=>y(2),
     Clk=>Clk,
     Q=>Q2,
     Res=>reset
);
Reg_3:Reg
port map(
     D=>D,
     EN=>y(3),
     Clk=>Clk,
     Q=>Q3,
     Res=>reset
);
Reg_4:Reg
port map(
     D=>D,
     EN=>y(4),
     Clk=>Clk,
     Q=>Q4,
     Res=>reset
);
Reg_5:Reg
port map(
     D=>D,
     EN=>y(5),
     Clk=>Clk,
     Q=>Q5,
     Res=>reset
);
Reg_6:Reg
port map(
     D=>D,
     EN=>y(6),
     Clk=>Clk,
     Q=>Q6,
     Res=>reset
);
Reg_7:Reg
port map(
     D=>D,
     EN=>y(7),
     Clk=>Clk,
     Q=>Q7,
     Res=>reset
);
en <='1';
end Behavioral;
