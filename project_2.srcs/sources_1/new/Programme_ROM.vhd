----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 07/21/2022 05:32:06 PM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity Program_ROM is
Port ( 
    MemSel : in STD_LOGIC_VECTOR (2 downto 0);
    InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array(0 to 7) of std_logic_vector(11 downto 0);

signal instruction_rom:rom_type:=(
     "101110000001", --move 1 to R7
     "101100000010", --move 2 to R6
     "001111100000", --add R7,R6 and store in R7
     "101100000011", --move 3 to R6
     "001111100000", --add R7,R6 and store in R7
     "100010000000", --move 0 to R1
     "110010000000", --jump to start
     "000000000000"); --nothing happens
begin
    InstructionBus<=instruction_rom(to_integer(unsigned(MemSel)));
end Behavioral;
