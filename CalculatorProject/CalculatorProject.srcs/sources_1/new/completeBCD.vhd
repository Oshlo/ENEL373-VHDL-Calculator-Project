----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 04:18:44
-- Design Name: 
-- Module Name: completeBCD - Behavioral
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

entity completeBCD is
    Port ( BCD32 : in STD_LOGIC_VECTOR (31 downto 0);
           NegBCD : in STD_LOGIC_VECTOR (3 downto 0);
           BCDfinal : out STD_LOGIC_VECTOR (31 downto 0));
end completeBCD;

architecture Behavioral of completeBCD is



begin
    process(BCD32)
        variable BCDTemp : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    begin
        BCDTemp := BCD32;
        if BCDTemp(31 downto 28) = "0000" then
            BCDTemp(31 downto 28) := "1111";
            if BCDTemp(27 downto 24) = "0000" then
                BCDTemp(27 downto 24) := "1111";
                if BCDTemp(23 downto 20) = "0000" then
                    BCDTemp(23 downto 20) := "1111";
                    if BCDTemp(19 downto 16) = "0000" then
                        BCDTemp(19 downto 16) := "1111";
                        if BCDTemp(15 downto 12) = "0000" then
                            BCDTemp(15 downto 12) := "1111";
                            if BCDTemp(11 downto 8) = "0000" then
                                BCDTemp(11 downto 8) := "1111";
                                if BCDTemp(7 downto 4) = "0000" then
                                    BCDTemp(7 downto 4) := "1111";
                                    if BCDTemp(3 downto 0) = "0000" then
                                        BCDTemp(3 downto 0) := "0000";
                                    else
                                        BCDTemp(7 downto 4) := NegBCD;
                                    end if;
                                else
                                    BCDTemp(11 downto 8) := NegBCD;
                                end if;
                            else
                                BCDTemp(15 downto 12) := NegBCD;
                            end if;
                        else
                            BCDTemp(19 downto 16) := NegBCD;
                        end if;
                    else
                        BCDTemp(23 downto 20) := NegBCD;
                    end if;
                else
                    BCDTemp(27 downto 24) := NegBCD;
                end if;
            else
                BCDTemp(31 downto 28) := NegBCD;
            end if;
        end if;
        
        BCDfinal <= BCDTemp;
    end process;
end Behavioral;
