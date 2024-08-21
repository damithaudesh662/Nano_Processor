----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 03:01:05 PM
-- Design Name: 
-- Module Name: Sim_Programme_ROM - Behavioral
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

entity TB_Program_ROM is
-- Port ( );
end TB_Program_ROM;
architecture Behavioral of TB_Program_ROM is
 component Program_ROM 
 Port ( 
  MemSel : in STD_LOGIC_VECTOR (2 downto 0);
  InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
 end component;
 signal MemSel:std_logic_vector(2 downto 0);
 signal InstructionBus:std_logic_vector(11 downto 0);
 begin
 UUT:Program_ROM
  Port Map(
   MemSel=>MemSel,
   InstructionBus=>InstructionBus);
 
 process 
  begin
   MemSel<="000";
   wait for 100ns;
 
   MemSel<="010";
   wait for 100ns;
 
   MemSel<="111";
   wait;
 
 end process;
 
end Behavioral;
