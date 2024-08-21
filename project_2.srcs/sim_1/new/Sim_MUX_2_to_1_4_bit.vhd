----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 02:55:25 PM
-- Design Name: 
-- Module Name: Sim_MUX_2_to_1_4_bit - Behavioral
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

entity TB_MUX_2_to_1_4bit is
-- Port ( );
end TB_MUX_2_to_1_4bit;
architecture Behavioral of TB_MUX_2_to_1_4bit is
 component MUX_2_to_1_4bit
     Port ( 
     A : in STD_LOGIC_VECTOR (3 downto 0);
     I : in STD_LOGIC_VECTOR (3 downto 0);
     LoadSel : in STD_LOGIC;
     S_out : out STD_LOGIC_VECTOR (3 downto 0));
 END COMPONENT; 
SIGNAL A,I,S_out:std_logic_vector(3 downto 0);
signal LoadSel:std_logic;
begin
     UUT:MUX_2_to_1_4bit
     port map(
     A=>A,
     I=>I,
     S_out=>S_out,
     LoadSel=>LoadSel);
 --210662R :- 0011 0011 0110 1110 0110
 process
 begin
     A<="0011";
     I<="1011";
     LoadSel<='0';
 
     wait for 200ns;
     LoadSel<='1';
     wait;
 end process;
end Behavioral;
