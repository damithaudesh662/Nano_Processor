----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 03:03:43 PM
-- Design Name: 
-- Module Name: Sim_Processor - Behavioral
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
entity TB_PROCESSOR is
-- Port ( );
end TB_PROCESSOR;

architecture Behavioral of TB_PROCESSOR is

COMPONENT PROCESSOR
Port ( 
      CLK : in STD_LOGIC;
      Reset : in STD_LOGIC:='0';
      Over_flow : out STD_LOGIC;
      R7_led : out STD_LOGIC_VECTOR (3 downto 0);
      R7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
      Zero_Flow : out STD_LOGIC;
      Anode:out std_logic_vector(3 downto 0):="0111");
 END COMPONENT;
 
 SIGNAL clk:std_logic:='0';
 signal Reset,Over_flow,Zero_Flow:std_logic;
 signal R7_led:std_logic_vector(3 downto 0);
 signal R7_7Seg:std_logic_vector(6 downto 0);
 signal Anode:std_logic_vector(3 downto 0);
 
 begin
 
 UUT:PROCESSOR
      PORT MAP(
      CLK=>clk,
      Reset=>Reset,
      Over_flow=>Over_flow,
      R7_led=>R7_led,
      R7_7Seg=>R7_7Seg,
      Zero_Flow=>Zero_Flow,
      Anode=>Anode);
  
 process 
      begin
      Clk <= not(Clk);
      wait for 2ns;
  
 end process;
 process
      begin
      Reset<='1';
      wait for 100ns;
      Reset<='0';
      wait ;
 end process;
 end Behavioral;

