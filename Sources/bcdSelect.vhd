----------------------------------------------------------------------------------
-- Company: University of Canterbury
-- Engineer: Adam Finlayson
-- 
-- Create Date: 16.03.2021 22:36:25
-- Design Name: 
-- Module Name: bcdSelect - Behavioral
-- Project Name: CalculatorProject
-- Target Devices: 
-- Tool Versions: 
-- Description: From a 12 bit BCD, Select the 4 bit BCD that corresponds with the Segment Select
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

entity bcdSelect is
    Port ( SegSelect : in  STD_LOGIC_VECTOR (7 downto 0);
           BCDin     : in  STD_LOGIC_VECTOR (31 downto 0);
           BCDout    : out STD_LOGIC_VECTOR (3 downto 0));
end bcdSelect;

architecture Behavioral of bcdSelect is

    Signal bcdFiller: STD_LOGIC_VECTOR (31 downto 0);

begin
    bcdFiller <= BCDin;
    process (SegSelect)
    begin
        case SegSelect is
            when "11111110" => BCDout <= bcdFiller(3 downto 0); -- If 1st Segment is on, output 1st BCD section
            when "11111101" => BCDout <= bcdFiller(7 downto 4); -- If 2nd Segment is on, output 2nd BCD section
            when "11111011" => BCDout <= bcdFIller(11 downto 8); -- If 3rd Segment is on, output 3rd BCD section
            when "11110111" => BCDout <= bcdFIller(15 downto 12); -- If 4th Segment is on, output 4th BCD section
            when "11101111" => BCDout <= bcdFIller(19 downto 16); -- If 5th Segment is on, output 5th BCD section
            when "11011111" => BCDout <= bcdFIller(23 downto 20); -- If 6th Segment is on, output 6th BCD section
            when "10111111" => BCDout <= bcdFIller(27 downto 24); -- If 7th Segment is on, output 7th BCD section
            when "01111111" => BCDout <= bcdFIller(31 downto 28); -- If 8th Segment is on, output 8th BCD section
            when others => BCDout <= "1111"; -- To expand to more Segments
        end case;
    end process;
end Behavioral;
