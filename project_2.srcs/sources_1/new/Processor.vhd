----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 07/26/2022 06:52:16 PM
-- Design Name: 
-- Module Name: PROCESSOR - Behavioral
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
entity PROCESSOR is
 Port ( CLK : in STD_LOGIC;
 Reset : in STD_LOGIC;
 Over_flow : out STD_LOGIC;
 R7_led : out STD_LOGIC_VECTOR (3 downto 0);
 R7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
 Zero_Flow : out STD_LOGIC;
 Anode:out std_logic_vector(3 downto 0):="0111");
end PROCESSOR;
architecture Behavioral of PROCESSOR is
 component Instruction_Decoder 
 Port ( InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);
 RegCheckforJmp : in STD_LOGIC_VECTOR (3 downto 0);
 RegisterEnable : out STD_LOGIC_VECTOR (2 downto 0);
 LoadSelect : out STD_LOGIC;
 ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
 RegisterSelect : out STD_LOGIC_VECTOR (2 downto 0);
 Add_SubSelection : out STD_LOGIC;
 JumpFlag : out STD_LOGIC;
 RCAEN:OUT STD_LOGIC:='0';
 JumpAddress : out STD_LOGIC_VECTOR (2 downto 0);
 RegisterSelect2 : out STD_LOGIC_VECTOR (2 downto 0));
 end component;
 
 component Register_bank 
 Port ( RegisterEnable : in STD_LOGIC_VECTOR (2 downto 0);
 Clk : in STD_LOGIC;
 reset : in STD_LOGIC;
 Q0 : out STD_LOGIC_VECTOR (3 downto 0);
 Q1 : out STD_LOGIC_VECTOR (3 downto 0);
 Q2 : out STD_LOGIC_VECTOR (3 downto 0);
 Q3 : out STD_LOGIC_VECTOR (3 downto 0);
 Q4 : out STD_LOGIC_VECTOR (3 downto 0);
 Q5 : out STD_LOGIC_VECTOR (3 downto 0);
 Q6 : out STD_LOGIC_VECTOR (3 downto 0);
 Q7 : out STD_LOGIC_VECTOR (3 downto 0);
 D : in STD_LOGIC_VECTOR (3 downto 0));
 end component;
 
 component Program_ROM
 Port ( MemSel : in STD_LOGIC_VECTOR (2 downto 0);
 InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
 end component;
 
 component Program_Counter
 Port ( S_in : in STD_LOGIC_VECTOR (2 downto 0):="000";
 Msel : out STD_LOGIC_VECTOR (2 downto 0):="000";
 Clk : in STD_LOGIC;
 Res : in STD_LOGIC);
 end component;
 
 component RCA_4
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 B : in STD_LOGIC_VECTOR (3 downto 0);
 C_in : in STD_LOGIC;
 EN:IN STD_LOGIC:='0';
 S : out STD_LOGIC_VECTOR (3 downto 0);
C_out : out STD_LOGIC;
  Z:out std_logic);
  end component;
  
  component Adder_3_bit
  Port ( A : in STD_LOGIC_VECTOR (2 downto 0):="000";
  S : out STD_LOGIC_VECTOR (2 downto 0):="000";
  C_out : out STD_LOGIC);
  end component;
  
  component MUX_8_to_1
  Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
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
  
  component MUX_2_to_1_3bit
  Port ( J : in STD_LOGIC_VECTOR (2 downto 0):="000";
  A : in STD_LOGIC_VECTOR (2 downto 0):="000";
  JmpF : in STD_LOGIC;
  S_out : out STD_LOGIC_VECTOR (2 downto 0):="000");
  end component;
  
  component MUX_2_to_1_4bit
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
  I : in STD_LOGIC_VECTOR (3 downto 0);
  LoadSel : in STD_LOGIC;
  S_out : out STD_LOGIC_VECTOR (3 downto 0));
  end component;
  
  component LUT_16_7
  Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
  data : out STD_LOGIC_VECTOR (6 downto 0));
  end component;
  
  component Slow_Clk
  Port ( Clk_in : in STD_LOGIC;
  Clk_out : out STD_LOGIC);
  end component;
 signal InstructionBus : STD_LOGIC_VECTOR (11 downto 0);
 signal ImmediateValue,RCA_output,D_reg,MUX_8_to_1_output_0,MUX_8_to_1_output_1,R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (3 downto 
 0):="0000";
 signal RegisterEnable,RegisterSelect,JumpAddress,RegisterSelect2,MemorySelect,Adder_3_bit_output: STD_LOGIC_VECTOR (2 downto 
 0):="000";
 signal S_out_to_PC:STD_LOGIC_VECTOR (2 downto 0):="000";
 signal LoadSelect,Add_SubSelection,JumpFlag,Adder_3_bit_overflow,RCAEN:std_logic;
 signal Clk_slow:std_logic;
 
 begin
 
Slow_Clk_0:Slow_Clk
  port map(
  Clk_in=>CLK,
  Clk_out=>Clk_slow);
  
Instruction_Decoder_0:Instruction_Decoder
   port map(InstructionBus=>InstructionBus,
   RegCheckforJmp=>MUX_8_to_1_output_0,
   ImmediateValue=>ImmediateValue,
   RegisterEnable=>RegisterEnable,
   RegisterSelect=>RegisterSelect,
   RCAEN=>RCAEN,
   JumpAddress=>JumpAddress,
   RegisterSelect2=>RegisterSelect2,
   LoadSelect=>LoadSelect,
   Add_SubSelection=>Add_SubSelection,
   JumpFlag=>JumpFlag);
   
  MUX_2_to_1_4bit_0:MUX_2_to_1_4bit
   PORT MAP(
   A=>RCA_output,
   I=>ImmediateValue,
   LoadSel=>LoadSelect,
   S_out=>D_reg);
   
  RCA_4_0:RCA_4
   port map(
   A=>MUX_8_to_1_output_0,
   B=>MUX_8_to_1_output_1,
   C_in=>Add_SubSelection,
   EN=>RCAEN,
   S=>RCA_output,
   C_out=>Over_flow,
   Z=>Zero_Flow);
   
  MUX_8_to_1_0:MUX_8_to_1
   PORT MAP(
   R0=>R0,
   R1=>R1,
   R2=>R2,
   R3=>R3,
   R4=>R4,
   R5=>R5,
   R6=>R6,
   R7=>R7,
   RegSel=>RegisterSelect,
   Y=>MUX_8_to_1_output_0);
   
  MUX_8_to_1_1:MUX_8_to_1
   PORT MAP(
   R0=>R0,
   R1=>R1,
   R2=>R2,
   R3=>R3,
   R4=>R4,
   R5=>R5,
   R6=>R6,
   R7=>R7,
   RegSel=>RegisterSelect2,
   Y=>MUX_8_to_1_output_1);
   
  Adder_3bit:Adder_3_bit
   port map(
   A=>MemorySelect,
   S=>Adder_3_bit_output,
   C_out=>Adder_3_bit_overflow);
   
  MUX_2_to_1_3bit_0:MUX_2_to_1_3bit
  port map(
   A=>Adder_3_bit_output,
   J=>JumpAddress,
   JmpF=>JumpFlag,
   S_out=>S_out_to_PC); 
   
  Program_Counter_0:Program_Counter
   PORT MAP(
   S_in=>S_out_to_PC,
   Msel=>MemorySelect,
   Res=>Reset,
   Clk=>Clk_slow);
   
  Program_ROM_0:Program_ROM
   port map(
   MemSel=>MemorySelect,
   InstructionBus=>InstructionBus); 
   
  Register_bank_0:Register_bank
   port map(
   RegisterEnable=>RegisterEnable,
   Clk=>Clk_slow,
   reset=>Reset,
   Q0=>R0,
   Q1=>R1,
   Q2=>R2,
   Q3=>R3,
   Q4=>R4,
   Q5=>R5,
   Q6=>R6,
   Q7=>R7,
   D=>D_reg); 
   
  LUT_16_7_0:LUT_16_7
   PORT MAP(
   address=>R7,
   data=>R7_7Seg); 
   R7_led<=R7; 
   
   
  end Behavioral;
