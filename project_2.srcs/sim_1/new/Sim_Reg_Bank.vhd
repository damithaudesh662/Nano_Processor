----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 02:59:28 PM
-- Design Name: 
-- Module Name: Sim_Reg_Bank - Behavioral
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
entity register_bank_sim is
-- Port ( );
end register_bank_sim;
architecture Behavioral of register_bank_sim is
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

    
    signal reset,clk:std_logic:='0';
    signal q0,q1,q2,q3,q4,q5,q6,q7,d:std_logic_vector(3 downto 0);
    signal RegisterEnable:std_logic_vector(2 downto 0);
begin
UUT :Register_bank
port map(
     RegisterEnable=>RegisterEnable,
     Q0=>q0,
     Q1=>q1,
     Q2=>q2,
     Q3=>q3,
     Q4=>q4,
     Q5=>q5,
     Q6=>q6,
     Q7=>q7,
     D=>d,
     reset=>reset,
     Clk=>clk
);
process 
begin
    Clk <= not(Clk);
wait for 20ns;
end process;

 --210662R :- 0011 0011 0110 1110 0110

process
begin

reset <= '1';
wait for 100ns;

reset <= '0';
wait for 100ns;

RegisterEnable<="010";
d<="1110";
 
wait for 100ns;
RegisterEnable<="001";
d<="1110";
 
wait for 100ns;
RegisterEnable<="010";
d<="1101";
 
wait for 100ns;
RegisterEnable<="011";
d<="1110";

wait for 100ns;
d<="0011";
wait for 100ns;
RegisterEnable<="111";
d<="1110";

wait for 100ns;
reset<='1';
wait;
end process;
end Behavioral;
