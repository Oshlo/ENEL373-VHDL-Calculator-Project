----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 09:19:12
-- Design Name: 
-- Module Name: Register28 - Behavioral
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

entity Register28 is
    Port ( CLK : in STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (27 downto 0);
           En : in STD_LOGIC;
           DataOut : out STD_LOGIC_VECTOR (27 downto 0));
end Register28;

architecture Behavioral of Register28 is

begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if En = '1' then
                DataOut <= DataIn;
            end if;
        end if;
    end process;

end Behavioral;
