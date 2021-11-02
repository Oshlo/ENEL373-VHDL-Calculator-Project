----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 06:24:01
-- Design Name: 
-- Module Name: OperatorBCD - Behavioral
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

entity OperatorBCD is
    Port ( OpCode : in STD_LOGIC_VECTOR (3 downto 0);
           OpBCD : out STD_LOGIC_VECTOR (3 downto 0));
end OperatorBCD;

architecture Behavioral of OperatorBCD is

begin
    process (OpCode)
    begin
        case OpCode is
            when "0001" => OpBCD <= "1011";
            when "0010" => OpBCD <= "1100";
            when "0100" => OpBCD <= "1101";
            when "1000" => OpBCD <= "1110";
            when others => OpBCD <= "1111";
        end case;
    end process;
end Behavioral;
