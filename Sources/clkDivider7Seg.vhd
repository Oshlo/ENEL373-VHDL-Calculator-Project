----------------------------------------------------------------------------------
-- Company: Universtity of Canterbury
-- Engineer: Adam Finlayson
-- 
-- Create Date: 11.03.2021 01:33:03
-- Design Name: 
-- Module Name: clkDivider7Seg - Behavioral
-- Project Name: CalculatorProject
-- Target Devices: 
-- Tool Versions: 
-- Description: Divided a 100MHz clock down to 4, 10, 25 Hz for the 7 Segment display
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clkDivider7Seg is
    Port ( CLKin : in STD_LOGIC;
           CLKout : out STD_LOGIC);
end clkDivider7Seg;

architecture Behavioral of clkDivider7Seg is

    --constant CLKdiv : integer := 25000000; -- 2Hz
    --constant CLKdiv : integer := 10000000; -- 5Hz
    --constant CLKdiv : integer := 4000000; -- 12.5Hz
    --constant CLKdiv : integer := 1000000; -- 50Hz
    --constant CLKdiv : integer := 250000; -- 200Hz
    --constant CLKdiv : integer := 125000; -- 400Hz
    --constant CLKdiv : integer := 62500; -- 800 Hz
    constant CLKdiv : integer := 12500; --4000Hz
    
    
    signal CLKcount : integer := 1;
    signal CLKvalue : STD_LOGIC := '0';

begin
    CLK : process (CLKin)
    begin
        if rising_edge(CLKin) then -- Positive edge trigger of input clock
            CLKcount <= CLKcount + 1; -- Increase the Clock count
            if CLKcount = CLKdiv then -- Check if the clock count has reached the value corresponding to desired HZ
                CLKvalue <= NOT CLKvalue; -- toggles the value of the clock (1 to 0)
                CLKcount <= 1; -- Reset Clock counter
            end if;
        end if;
        CLKout <= CLKvalue; -- Assign the output Clock to the divided Clock value
    end process CLK;
end Behavioral;
