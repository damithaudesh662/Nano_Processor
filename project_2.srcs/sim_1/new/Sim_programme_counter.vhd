----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 07/21/2022 05:01:20 PM
-- Design Name: 
-- Module Name: PC_sim - Behavioral
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
entity PC_sim is
-- Port ( );
end PC_sim;
architecture Behavioral of PC_sim is
component Program_Counter
     Port ( 
     Clk : in STD_LOGIC;
     Res : in STD_LOGIC;
     S_in : in STD_LOGIC_VECTOR (2 downto 0);
     Msel : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Clk:std_logic:='0';
signal Res:std_logic:='0';
signal S_in,Msel:std_logic_vector(2 downto 0);

begin
uut:Program_Counter
     PORT MAP(
     Clk=>Clk,
     Res=>Res,
     S_in=>S_in,
     Msel=>Msel);
 --210662R :- 110 011 011 011 100 110
process
      begin
      wait for 5ns;
      Clk<=not Clk;
      end process;
  
      process
      begin
      S_in<="110";
      
      wait for 50ns;
      S_in<="011";
      
      wait for 100ns;
      Res<='1';
      
      wait for 50ns;
      Res<='0';
      S_in<="111";
      
      wait for 100ns;
      Res<='1';
      
      wait for 50ns;
      Res<='0';
      S_in<="110";
      
      wait;
end process;
  
end Behavioral;