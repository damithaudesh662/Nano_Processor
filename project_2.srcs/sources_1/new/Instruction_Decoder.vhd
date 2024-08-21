----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 07/23/2022 04:30:58 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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
entity Instruction_Decoder is
 Port ( 
     InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);--
     RegCheckforJmp : in STD_LOGIC_VECTOR (3 downto 0);--
     RegisterEnable : out STD_LOGIC_VECTOR (2 downto 0);--
     LoadSelect : out STD_LOGIC:='0';
     ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);--
     RegisterSelect : out STD_LOGIC_VECTOR (2 downto 0);--
     Add_SubSelection : out STD_LOGIC;
     JumpFlag : out STD_LOGIC:='0';
     RCAEN:OUT STD_LOGIC:='0';
     JumpAddress : out STD_LOGIC_VECTOR (2 downto 0):="000";--
     RegisterSelect2 : out STD_LOGIC_VECTOR (2 downto 0));--
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

signal I:std_logic_vector(1 downto 0);

begin
case1:process(InstructionBus)
begin
case InstructionBus(11 downto 10) is
    when "10"=>
        JumpFlag<='0';
        RegisterEnable<=InstructionBus( 9 downto 7);
        ImmediateValue<=InstructionBus( 3 downto 0);
        LoadSelect<='1';
    when "00"=>
        JumpFlag<='0';
        RegisterSelect<=InstructionBus(9 downto 7);
        RegisterSelect2<=InstructionBus(6 downto 4);
        Add_SubSelection<='0';
        RegisterEnable<=InstructionBus(9 downto 7);
        LoadSelect<='0';
        RCAEN<='1';
    when "01"=>
        JumpFlag<='0';
        RegisterSelect<=InstructionBus(9 downto 7);
        RegisterEnable<=InstructionBus(9 downto 7);
        RegisterSelect2<="000";
        Add_SubSelection<='1';
        LoadSelect<='0';
 
    when "11"=>
        JumpFlag<='0';
        RegisterSelect<=InstructionBus(9 downto 7);
        if (RegCheckforJmp="0000") then
            JumpFlag<='1';
            JumpAddress<=InstructionBus(2 downto 0);
        end if;
    when others=>
 
end case;
 
 
 
 
end process case1;
end Behavioral;
