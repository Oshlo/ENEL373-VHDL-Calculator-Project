----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 02:52:16
-- Design Name: 
-- Module Name: TriBuffer28 - Behavioral
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

entity TriBuffer28 is
    Port ( In28 : in STD_LOGIC_VECTOR (27 downto 0);
           En : in STD_LOGIC;
           Out28 : out STD_LOGIC_VECTOR (27 downto 0));
end TriBuffer28;

architecture Behavioral of TriBuffer28 is

begin
    Out28 <= (others => 'Z') when En = '0' else In28;
end Behavioral;
