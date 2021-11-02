----------------------------------------------------------------------------------
-- Company: University of Canterbury
-- Engineer: Adam Finlayson
-- 
-- Create Date: 16.03.2021 22:09:13
-- Design Name: 
-- Module Name: shiftRegister3Segs - Behavioral
-- Project Name: CalculatorProject
-- Target Devices: 
-- Tool Versions: 
-- Description: A shift register to select which 7 segement display should be turned on
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

entity shiftRegister3Segs is
    Port ( CLK       : in  STD_LOGIC;
           SegSelect : out STD_LOGIC_VECTOR (7 downto 0));
end shiftRegister3Segs;

architecture Behavioral of shiftRegister3Segs is

    signal SegSelectTemp : STD_LOGIC_VECTOR (7 downto 0) := "11111110"; -- Create a signal for the virtual Segment Select

begin
    process (CLK)
    begin
        if rising_edge(CLK) then -- If rising Clock edge detected 
            SegSelectTemp <= SegSelectTemp(6 downto 0) & SegSelectTemp(7 downto 7); --Shift the Segment select left by 1
        end if;
    end process;
    SegSelect <= SegSelectTemp; -- Assign output to virtual segment select
end Behavioral;
