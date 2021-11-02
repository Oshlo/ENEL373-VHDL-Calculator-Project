----------------------------------------------------------------------------------
-- Company: University of Canterbury
-- Engineer: Adam Finlayson
-- 
-- Create Date: 11.03.2021 00:11:52
-- Design Name: 
-- Module Name: eightBitCounter - Behavioral
-- Project Name: CalculatorProject
-- Target Devices: 
-- Tool Versions: 
-- Description: Counts the number of rising edges on a clock and returns the value in 8 bit BCD
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity eightBitCounter is
    Port ( CLK : in  STD_LOGIC;
           BCD : out STD_LOGIC_VECTOR (7 downto 0));
end eightBitCounter;

architecture Behavioral of eightBitCounter is

    signal BCDtemp3to0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal BCDtemp7to4 : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
    CLKtoBCD : process (CLK)
    begin
        if rising_edge(CLK) then -- Check for rising egde of input clock
            if BCDtemp3to0 = "1001" then -- Check if BCDtemporary has reached a value greater than 9
                BCDtemp3to0 <= "0000"; -- Reset BCDtemporary
                if BCDtemp7to4 = "1001" then
                    BCDtemp7to4 <= "0000";
                else
                    BCDtemp7to4 <= BCDtemp7to4 + 1;
                end if;
            else
                BCDtemp3to0 <= BCDtemp3to0 + 1; --Increase BCDtemporary 
            end if;
        end if;
    end process CLKtoBCD;
    BCD <= BCDtemp7to4 & BCDtemp3to0;
end Behavioral;
