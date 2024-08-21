----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 07/26/2022 04:04:29 PM
-- Design Name: 
-- Module Name: Adder_3bi - Behavioral
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
entity Adder_3_bit is
     Port ( 
     A : in STD_LOGIC_VECTOR (2 downto 0);
     S : out STD_LOGIC_VECTOR (2 downto 0);
     C_out : out STD_LOGIC);
end Adder_3_bit;

architecture Behavioral of Adder_3_bit is
signal B : STD_LOGIC_VECTOR (2 downto 0):= "000";
signal C_in : STD_LOGIC := '1';

component FA 
     port( 
     A : in STD_LOGIC;
     B : in STD_LOGIC;
     C_in : in STD_LOGIC;
     C_out : out STD_LOGIC;
     S : out STD_LOGIC);
end component;

signal FA0_C, FA1_C, FA2_C : std_logic; 
signal BB0,BB1,BB2,BB3 :std_logic;
begin
 
 FA_0 : FA 
     port map(
     A => A(0),
     B => B(0),
     C_in => C_in,
     S => S(0),
     C_out => FA0_C);
 
 FA_1 : FA
     port map(
     A => A(1),
     B => B(1),
     C_in => FA0_C,
     S => S(1),
     C_out => FA1_C);
 
 FA_2 : FA
     port map(
     A => A(2),
     B => B(2),
     C_in => FA1_C,
     S => S(2),
     C_out => FA2_C);
 
 
 
C_out <= FA2_C;
end Behavioral;