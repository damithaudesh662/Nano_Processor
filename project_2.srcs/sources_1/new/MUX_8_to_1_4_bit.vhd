----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 01:52:54 PM
-- Design Name: 
-- Module Name: MUX_8_to_1_4_bit - Behavioral
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
entity MUX_8_to_1 is
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
end MUX_8_to_1;

architecture Behavioral of MUX_8_to_1 is
component Decoder_3_to_8
 
Port ( 
     I : in STD_LOGIC_VECTOR (2 downto 0);
     EN : in STD_LOGIC:='1';
     Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

SIGNAL DY:std_logic_vector(7 downto 0);
begin
Decoder_3_to_8_0:Decoder_3_to_8 
Port map(
     I=>RegSel,
     Y=>DY);
  
my_case:PROCESS(DY,R0,R1,R2,R3,R4,R5,R6,R7)
  BEGIN
  CASE DY IS 
    WHEN "00000001"=>
        Y<=R0;
  
    WHEN "00000010"=>
        Y<=R1;
    WHEN "00000100"=>
        Y<=R2;
    WHEN "00001000"=>
        Y<=R3;
    WHEN "00010000"=>
        Y<=R4;
    WHEN "00100000"=>
        Y<=R5;
    WHEN "01000000"=>
        Y<=R6;
    WHEN "10000000"=>Y<=R7;
  
    when others=> 
    END CASE;
END PROCESS my_case; 
end Behavioral;



