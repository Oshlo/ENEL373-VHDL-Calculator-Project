----------------------------------------------------------------------------------
-- Company: University of Canterbury
-- Engineer: Adam Finlayson
-- 
-- Create Date: 10.03.2021 23:34:46
-- Design Name: 
-- Module Name: fourBitCounter - Behavioral
-- Project Name: CalculatorProject
-- Target Devices: 
-- Tool Versions: 
-- Description: Counts the number of rising edges on a clock and returns the value in 4 bit BCD
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fourBitCounter is
    Port ( CLK : in STD_LOGIC;
           BCD : out STD_LOGIC_VECTOR (3 downto 0));
end fourBitCounter;

architecture Behavioral of fourBitCounter is

    signal BCDtemporary : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
    CLKtoBCD : process (CLK)
    begin
        if rising_edge(CLK) then -- Check for rising egde of input clock
            if BCDtemporary = "1001" then -- Check if BCDtemporary has reached a value greater than 9
                BCDtemporary <= "0000"; -- Reset BCDtemporary
            else
                BCDtemporary <= BCDtemporary + 1; --Increase BCDtemporary 
            end if;
        end if;
        BCD <= BCDtemporary;
    end process CLKtoBCD;
end Behavioral;
