----------------------------------------------------------------------------------
-- Company: University of Canterbury
-- Engineer: Adam Finlayson
-- 
-- Create Date: 09.03.2021 20:02:23
-- Design Name: 
-- Module Name: bcdToSeg7 - Behavioral
-- Project Name: CalculatorProject
-- Target Devices: 
-- Tool Versions: 
-- Description: A 4-to-7 Decoder to drive the 7 Segment Display from a BCD Input
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


entity bcdToSeg7 is
    port ( BCD         : in  STD_LOGIC_VECTOR (3 downto 0); -- Take a 4 bit BCD input
           Segment7    : out STD_LOGIC_VECTOR (0 to 6)); -- Output a 7 bit logic vector corresponding to 7 Seg LEDs
end bcdToSeg7;

architecture Behavioral of bcdToSeg7 is
  
begin
    process (BCD) -- was AnodeSelect
    begin
        case BCD is -- was bcdTemp
            when "0000" => Segment7 <= "0000001"; -- Binary 0 (0000) to Decimal 0
            when "0001" => Segment7 <= "1001111"; -- Binary 1 (0001) to Decimal 1
            when "0010" => Segment7 <= "0010010"; -- Binary 2 (0010) to Decimal 2
            when "0011" => Segment7 <= "0000110"; -- Binary 3 (0011) to Decimal 3
            when "0100" => Segment7 <= "1001100"; -- Binary 4 (0100) to Decimal 4
            when "0101" => Segment7 <= "0100100"; -- Binary 5 (0101) to Decimal 5
            when "0110" => Segment7 <= "1100000"; -- Binary 6 (0110) to Decimal 6
            when "0111" => Segment7 <= "0001111"; -- Binary 7 (0111) to Decimal 7
            when "1000" => Segment7 <= "0000000"; -- Binary 8 (1000) to Decimal 8
            when "1001" => Segment7 <= "0001100"; -- Binary 9 (1001) to Decimal 9
            when "1010" => Segment7 <= "1111110"; -- Negative Symbol
            when "1011" => Segment7 <= "0001000"; -- A for Add
            when "1100" => Segment7 <= "0100100"; -- S for Subtract
            when "1101" => Segment7 <= "1110000"; -- t for Times
            when "1110" => Segment7 <= "1000010"; -- d for Divide
            when others => Segment7 <= "1111111"; -- Ensures that the 7 segment display is off when above 9
        end case;
    end process;
end Behavioral;
