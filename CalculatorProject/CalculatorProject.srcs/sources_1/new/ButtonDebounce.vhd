----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 01:42:02
-- Design Name: 
-- Module Name: ButtonDebounce - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ButtonDebounce is
    Port ( CLKin : in STD_LOGIC;
           ButtonIn : in STD_LOGIC;
           ButtonOut : out STD_LOGIC);
end ButtonDebounce;

architecture Behavioral of ButtonDebounce is

    constant Delay : integer := 5000;
    
    signal ButtonHold : STD_LOGIC;

begin
    process (CLKin, ButtonIn)
    variable count : integer := 0;
    begin
        if rising_edge(CLKin) then
            if ButtonIn = '1' and count = 0 then
                ButtonHold <= '1';
            end if;
            if ButtonHold = '1' then
                count := count + 1;
                if count >= delay then
                    count := 0;
                    ButtonHold <= '0';
                end if;
            end if;
        end if;
    ButtonOut <= ButtonHold;
    end process;
end Behavioral;
