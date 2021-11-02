----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 02:50:53
-- Design Name: 
-- Module Name: 28bitTristateBuffer - Behavioral
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

entity TristateBuffer28 is
    Port ( In : in STD_LOGIC_VECTOR (27 downto 0);
           En : in STD_LOGIC;
           Out : out STD_LOGIC_VECTOR (27 downto 0));
end 28bitTristateBuffer;

architecture Behavioral of 28bitTristateBuffer is

begin


end Behavioral;
