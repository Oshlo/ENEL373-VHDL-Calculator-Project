----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 06:33:32
-- Design Name: 
-- Module Name: OutputBCD - Behavioral
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

entity OutputBCD is
    Port ( BCDin : in STD_LOGIC_VECTOR (31 downto 0);
           State : in STD_LOGIC_VECTOR (3 downto 0);
           OpCode : in STD_LOGIC_VECTOR (3 downto 0);
           BCDfinal : out STD_LOGIC_VECTOR (31 downto 0));
end OutputBCD;

architecture Behavioral of OutputBCD is

begin
    process (BCDin, State)
    variable OpBCD : std_logic_vector(3 downto 0) := "1111";
    begin
    
        case OpCode is
            when "0001" => OpBCD := "1011";
            when "0010" => OpBCD := "1100";
            when "0100" => OpBCD := "1101";
            when "1000" => OpBCD := "1110";
            when others => OpBCD := "1111";
        end case;
        
        if state = "0001" or state = "0010" then
            BCDfinal <= opBCD & BCDin(27 downto 0);
        elsif state = "0100" then
            BCDfinal <= BCDin;
        elsif state = "1000" then
            BCDfinal <= "10101010101010101010101010101010";
        end if;
    end process;
end Behavioral;
