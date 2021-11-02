----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 04:18:44
-- Design Name: 
-- Module Name: checkNeg - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity checkNeg is
    Port ( DataIn : in STD_LOGIC_VECTOR (23 downto 0);
           NegativeBCD : out STD_LOGIC_VECTOR (3 downto 0);
           AbsData : out STD_LOGIC_VECTOR (23 downto 0));
end checkNeg;

architecture Behavioral of checkNeg is

begin
    process (DataIn)
    begin
        if DataIn(11 downto 11) = "1" then
            AbsData <= (not DataIn) + 1;
            NegativeBCD <= "1010";
        else
            AbsData <= DataIn;
            NegativeBCD <= "1111";
        end if;
    end process;
end Behavioral;
