----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 01:51:10 PM
-- Design Name: 
-- Module Name: MUX_2_to_1_4_bit - Behavioral
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
entity MUX_2_to_1_4bit is

Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
    I : in STD_LOGIC_VECTOR (3 downto 0);
    LoadSel : in STD_LOGIC;
    S_out : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_to_1_4bit;

architecture Behavioral of MUX_2_to_1_4bit is
begin
mux:process(A,I,LoadSel)
begin
    if (LoadSel='0') then
        S_out<=A;
    else
        S_out<=I;
    end if;
end process;
end Behavioral;



