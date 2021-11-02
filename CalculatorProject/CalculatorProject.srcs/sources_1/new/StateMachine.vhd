----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 07:21:36
-- Design Name: 
-- Module Name: StateMachine - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity StateMachine is
    Port ( CLKin : in STD_LOGIC;
           button : in STD_LOGIC;
           SwitchWrite : out STD_LOGIC;
           ALUAccumulatorRead : out STD_LOGIC;
           ALUOutputRead : out STD_LOGIC;
           ALUOutputWrite : out STD_LOGIC;
           DivError : in STD_LOGIC;
           DivErrorReset : out STD_LOGIC;
           StateOut : out STD_LOGIC_VECTOR (3 downto 0));
end StateMachine;

architecture Behavioral of StateMachine is
    
    signal State : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    
begin
    process (CLKin)
    begin
        if rising_edge(CLKin) then
            if button = '1' then
                State <= State(2 downto 0) & State(3 downto 3);
            end if;
            
--            if State = "0001" then
--                --SwitchWrite <= '1';
--                StateOut <= "0001";
--            elsif State = "0010" then
--                --SwitchWrite <= '0';
--                StateOut <= "0010";
--            elsif State = "0100" then
--                StateOut <= "0001";
--            elsif State = "1000" then
--                StateOut <= "1000";
--            end if;
            
            if State = "0001" then
                SwitchWrite <= '1';
                ALUAccumulatorRead <= '1';
                StateOut <= "0001";
            elsif State = "0010" then
                ALUAccumulatorRead <= '0';
                ALUOutputRead <= '1';
                StateOut <= "0010";
            elsif State = "0100" then
                SwitchWrite <= '0';
                ALUOutputRead <= '0';
                ALUOutputWrite <= '1';
                StateOut <= "0100";
            elsif State = "1000" then
                ALUOutputWrite <= '0';
                StateOut <= "1000";
                DivErrorReset <= '1';
            end if;
            
            if DivError = '1' then
                State <= "1000";
            end if;
            
        end if;
    end process;
end Behavioral;
