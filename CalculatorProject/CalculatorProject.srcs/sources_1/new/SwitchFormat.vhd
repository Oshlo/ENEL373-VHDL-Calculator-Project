----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 02:42:00
-- Design Name: 
-- Module Name: SwitchFormat - Behavioral
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

entity SwitchFormat is
    Port ( Switches : in STD_LOGIC_VECTOR (15 downto 0);
           SwitchesToBus : out STD_LOGIC_VECTOR (27 downto 0));
end SwitchFormat;

architecture Behavioral of SwitchFormat is

begin
    process (Switches)
    begin
        if Switches(11 downto 11) = "0" then -- check if negative
            SwitchesToBus <= Switches(15 downto 12) & "000000000000" & Switches(11 downto 0);
        else
            SwitchesToBus <= Switches(15 downto 12) & "111111111111" & Switches(11 downto 0);
        end if;
    end process;

end Behavioral;
