----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 09:31:00
-- Design Name: 
-- Module Name: ALU28 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU28 is
    Port ( InputA : in STD_LOGIC_VECTOR (27 downto 0);
           InputB : in STD_LOGIC_VECTOR (27 downto 0);
           Output : out STD_LOGIC_VECTOR (27 downto 0);
           ResetError : in STD_LOGIC;
           Error : out STD_LOGIC);
end ALU28;

architecture Behavioral of ALU28 is

    Signal DataA : STD_LOGIC_VECTOR (23 downto 0);
    Signal DataB : STD_LOGIC_VECTOR (23 downto 0);
    Signal OpCode : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    process (InputB)
    begin
        DataA <= InputA (23 downto 0);
        DataB <= InputB (23 downto 0);
        OpCode <= InputB (27 downto 24);
        
        if ResetError = '1' then
            Error <= '0';
        end if;
        
        if OpCode = "0001" then
            Output <= OpCode & (STD_LOGIC_VECTOR(signed(DataA) + signed(DataB)));
        elsif OpCode = "0010" then
            Output <= OpCode & (STD_LOGIC_VECTOR(signed(DataA) - signed(DataB)));
        elsif OpCode = "0100" then
            Output <= OpCode & (STD_LOGIC_VECTOR(signed(DataA(11 downto 0)) * signed(DataB(11 downto 0))));
        elsif OpCode = "1000" then
            if DataB = "000000000000000000000000" then
                Error <= '1';
            end if;
            Output <= OpCode & (STD_LOGIC_VECTOR(signed(DataA) / signed(DataB)));
        elsif OpCode <= "1111" then
            Output <= OpCode & (STD_LOGIC_VECTOR(signed(DataA) REM signed(DataB)));
        end if;
    
    end process;


end Behavioral;
