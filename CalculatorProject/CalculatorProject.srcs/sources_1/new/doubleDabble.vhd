----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 03:15:25
-- Design Name: 
-- Module Name: doubleDabble - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity doubleDabble is
    Port ( BinaryIn : in STD_LOGIC_VECTOR (23 downto 0);
           BCDout : out STD_LOGIC_VECTOR (31 downto 0));
end doubleDabble;

architecture Behavioral of doubleDabble is

    Signal NegBCD : STD_LOGIC_VECTOR (3 downto 0);

begin
    process(BinaryIn)
    variable ScrapeSpace : STD_LOGIC_VECTOR (55 downto 0);
    begin
    
        ScrapeSpace := "00000000000000000000000000000000" & BinaryIn;
    
        for i in 0 to 23 loop
            if ScrapeSpace(27 downto 24) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00000000000000000000000000000011000000000000000000000000";
            end if;
            if ScrapeSpace(31 downto 28) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00000000000000000000000000110000000000000000000000000000";
            end if;
            if ScrapeSpace(35 downto 32) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00000000000000000000001100000000000000000000000000000000";
            end if;
            if ScrapeSpace(39 downto 36) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00000000000000000011000000000000000000000000000000000000";
            end if;
            if ScrapeSpace(43 downto 40) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00000000000000110000000000000000000000000000000000000000";
            end if;
            if ScrapeSpace(47 downto 44) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00000000001100000000000000000000000000000000000000000000";
            end if;
            if ScrapeSpace(51 downto 48) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00000011000000000000000000000000000000000000000000000000";
            end if;
            if ScrapeSpace(55 downto 52) >= "0101" then
                ScrapeSpace := ScrapeSpace + "00110000000000000000000000000000000000000000000000000000";
            end if;
            
            ScrapeSpace := ScrapeSpace(54 downto 0) & "0";
            
        end loop;

        BCDout <= ScrapeSpace (55 downto 24);
        
    end process;
    
end Behavioral;
