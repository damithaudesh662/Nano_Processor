----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 06/01/2022 12:57:25 AM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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
entity RCA_4 is
Port ( 
    A : in STD_LOGIC_VECTOR (3 downto 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    C_in : in STD_LOGIC;
    EN:IN STD_LOGIC:='0';
    S : out STD_LOGIC_VECTOR (3 downto 0);
    C_out : out STD_LOGIC;
    Z:out std_logic:='0');
end RCA_4;
architecture Behavioral of RCA_4 is
component FA 
port( 
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    C_in : in STD_LOGIC;
    C_out : out STD_LOGIC;
    S : out STD_LOGIC);
end component;
signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic; 
signal BB0,BB1,BB2,BB3 :std_logic;
signal SZ:std_logic_vector(3 downto 0);

begin
    BB0 <= C_in xor B(0);
    BB1 <= C_in xor B(1);
    BB2 <= C_in xor B(2);
    BB3 <= C_in xor B(3);
  
    FA_0 : FA 
    port map(
        A => A(0),
        B => BB0,
        C_in => C_in,
        S => SZ(0),
        C_out => FA0_C);
  
    FA_1 : FA
    port map(
        A => A(1),
        B => BB1,
        C_in => FA0_C,
        S => SZ(1),
        C_out => FA1_C);
  
    FA_2 : FA
    port map(
        A => A(2),
        B => BB2,
        C_in => FA1_C,
        S => SZ(2),
        C_out => FA2_C);
  
    FA_3 : FA
    port map(
        A => A(3),
        B => BB3,
        C_in => FA2_C,
        S => SZ(3),
        C_out => FA3_C);
  
    C_out <= FA3_C;
    S<=SZ;
  
PROCESS(SZ)
    BEGIN
    if (SZ="0000" AND EN='1') THEN
        Z<='1';
    ELSE
        Z<='0';
    END IF;
END PROCESS;
end Behavioral;