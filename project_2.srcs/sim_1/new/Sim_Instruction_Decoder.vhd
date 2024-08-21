----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 03:02:25 PM
-- Design Name: 
-- Module Name: Sim_Instruction_Decoder - Behavioral
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
entity TB_Instruction_decoder is
-- Port ( );
end TB_Instruction_decoder;
architecture Behavioral of TB_Instruction_decoder is
     component Instruction_decoder 
         Port ( 
         InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);
         
         RegCheckforJmp : in STD_LOGIC_VECTOR (3 downto 0);
         RegisterEnable : out STD_LOGIC_VECTOR (2 downto 0);
         LoadSelect : out STD_LOGIC;
         ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
         RegisterSelect : out STD_LOGIC_VECTOR (2 downto 0);
         Add_SubSelection : out STD_LOGIC;
         JumpFlag : out STD_LOGIC;
         JumpAddress : out STD_LOGIC_VECTOR (2 downto 0);
         RegisterSelect2 : out STD_LOGIC_VECTOR (2 downto 0)); 
     end component;
     
signal InstructionBus : STD_LOGIC_VECTOR (11 downto 0);
signal RegCheckforJmp :STD_LOGIC_VECTOR (3 downto 0);
signal RegisterEnable :STD_LOGIC_VECTOR (2 downto 0);
signal LoadSelect : STD_LOGIC;
signal ImmediateValue :STD_LOGIC_VECTOR (3 downto 0);
signal RegisterSelect :STD_LOGIC_VECTOR (2 downto 0);
signal Add_SubSelection :STD_LOGIC;
signal JumpFlag : STD_LOGIC;
signal JumpAddress :STD_LOGIC_VECTOR (2 downto 0);
signal RegisterSelect2 :STD_LOGIC_VECTOR (2 downto 0);

begin
     UUT:Instruction_decoder
     PORT MAP(
     
     InstructionBus=>InstructionBus,
     RegCheckforJmp=>RegCheckforJmp,
     RegisterEnable=>RegisterEnable,
     LoadSelect=>LoadSelect,
     ImmediateValue=>ImmediateValue,
     RegisterSelect=>RegisterSelect,
     Add_SubSelection=>Add_SubSelection,
     JumpFlag=>JumpFlag,
     JumpAddress=>JumpAddress,
     RegisterSelect2=>RegisterSelect2);
  
  
  process
  begin
      InstructionBus<="001111011111";
      wait for 200ns;
      InstructionBus<="101111011111";
      wait for 200ns;
      InstructionBus<="010111011111";
      wait for 200ns;
      InstructionBus<="111001011111";
      RegCheckforJmp<="0000";
      wait;
  
  end process;
 end Behavioral;
