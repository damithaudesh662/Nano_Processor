----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 01:36:24 PM
-- Design Name: 
-- Module Name: MUX_2_to_1_3_bit - Behavioral
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
entity MUX_2_to_1_3bit is
     Port ( 
     J : in STD_LOGIC_VECTOR (2 downto 0);
     A : in STD_LOGIC_VECTOR (2 downto 0);
     JmpF : in STD_LOGIC;
     S_out : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_to_1_3bit;
architecture Behavioral of MUX_2_to_1_3bit is
begin
mux:process(J,A,JmpF)
     begin
     if (JmpF='0') then
        S_out<=A;
     else
        S_out<=J;
     end if;
     end process;
 
end Behavioral;
