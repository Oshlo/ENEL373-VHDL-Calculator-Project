----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 04:57:46
-- Design Name: 
-- Module Name: DDshifter - Behavioral
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

entity DDshifter is
    Port ( SSin : in STD_LOGIC_VECTOR (15 downto 0);
           SSout : out STD_LOGIC_VECTOR (15 downto 0);
           Shiftee : in STD_LOGIC_VECTOR (11 downto 0);
           Shifted : out STD_LOGIC_VECTOR (11 downto 0));
end DDshifter;

architecture Behavioral of DDshifter is

begin
    process (SSin)
    begin
        SSout <= SSin(14 downto 0) & Shiftee(11 downto 11);
        Shifted <= Shiftee(10 downto 0) & "0";
    end process;
end Behavioral;
