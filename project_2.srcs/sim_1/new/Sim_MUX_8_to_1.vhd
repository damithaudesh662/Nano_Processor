----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 02:57:08 PM
-- Design Name: 
-- Module Name: Sim_MUX_8_to_1 - Behavioral
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
entity TB_MUX_to_1 is
-- Port ( );
end TB_MUX_to_1;
architecture Behavioral of TB_MUX_to_1 is
 component MUX_8_to_1
     Port ( 
         R0 : in STD_LOGIC_VECTOR (3 downto 0);
         R1 : in STD_LOGIC_VECTOR (3 downto 0);
         R2 : in STD_LOGIC_VECTOR (3 downto 0);
         R3 : in STD_LOGIC_VECTOR (3 downto 0);
         R4 : in STD_LOGIC_VECTOR (3 downto 0);
         R5 : in STD_LOGIC_VECTOR (3 downto 0);
         R6 : in STD_LOGIC_VECTOR (3 downto 0);
         R7 : in STD_LOGIC_VECTOR (3 downto 0);
         RegSel : in STD_LOGIC_VECTOR (2 downto 0);
         Y : out STD_LOGIC_VECTOR (3 downto 0));
 
 end component;
     signal R0 : STD_LOGIC_VECTOR (3 downto 0);
     signal R1 : STD_LOGIC_VECTOR (3 downto 0);
     signal R2 : STD_LOGIC_VECTOR (3 downto 0);
     signal R3 : STD_LOGIC_VECTOR (3 downto 0);
     signal R4 : STD_LOGIC_VECTOR (3 downto 0);
     signal R5 : STD_LOGIC_VECTOR (3 downto 0);
     signal R6 : STD_LOGIC_VECTOR (3 downto 0);
     signal R7 : STD_LOGIC_VECTOR (3 downto 0);
     signal RegSel : STD_LOGIC_VECTOR (2 downto 0);
     signal Y : STD_LOGIC_VECTOR (3 downto 0);
begin
UUT:MUX_8_to_1
    port map(
     R0=>R0,
     R1=>R1,
     R2=>R2,
     R3=>R3,
     R4=>R4,
     R5=>R5,
     R6=>R6,
     R7=>R7,
     RegSel=>RegSel,
     Y=>Y);
 
  --210662R :- 0011 0011 0110 1110 0110

process
begin
     R0<="1010";
    R1<="1100";
      R2<="1110";
      R3<="0000";
      R4<="0011";
      R5<="0001";
      R6<="0101";
      R7<="0100";
      RegSel<="000";
      
      WAIT FOR 50NS;
      RegSel<="001";
      
      wait for 50ns;
      RegSel<="010";
      
      wait for 50ns;
      RegSel<="011";
      
      wait for 50ns;
      RegSel<="100";
      
      wait for 50ns;
      RegSel<="101";
      
      wait for 50ns;
      RegSel<="110";
      
      wait for 50ns;
      RegSel<="111";
      
  
  
  
  
  WAIT;
 end process;
 end Behavioral;
