----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2021 04:14:01
-- Design Name: 
-- Module Name: bit12binToBCD - Structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bit12binToBCD is
    Port ( BusIn : in STD_LOGIC_VECTOR (27 downto 0);
           State : in STD_LOGIC_VECTOR (3 downto 0);
           BCDout : out STD_LOGIC_VECTOR (31 downto 0));
end bit12binToBCD;

architecture Structural of bit12binToBCD is

    Signal BCDTemp : STD_LOGIC_VECTOR (31 downto 0);
    Signal BCDTemp1 : STD_LOGIC_VECTOR (31 downto 0);
    Signal NegBCD : STD_LOGIC_VECTOR (3 downto 0);
    Signal Data : STD_LOGIC_VECTOR (23 downto 0);
    Signal AbsData : STD_LOGIC_VECTOR (23 downto 0);
    Signal OpCode : STD_LOGIC_VECTOR (3 downto 0);
    
    component checkNeg
        Port ( DataIn : in STD_LOGIC_VECTOR (23 downto 0);
           NegativeBCD : out STD_LOGIC_VECTOR (3 downto 0);
           AbsData : out STD_LOGIC_VECTOR (23 downto 0));
    end component;

    component doubleDabble is
        Port ( BinaryIn : in STD_LOGIC_VECTOR (23 downto 0);
               BCDout : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component completeBCD is
    Port ( BCD32 : in STD_LOGIC_VECTOR (31 downto 0);
           NegBCD : in STD_LOGIC_VECTOR (3 downto 0);
           BCDfinal : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component OutputBCD is
        Port ( BCDin : in STD_LOGIC_VECTOR (31 downto 0);
               State : in STD_LOGIC_VECTOR (3 downto 0);
               OpCode : in STD_LOGIC_VECTOR (3 downto 0);
               BCDfinal : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

begin
    Data <= BusIn(23 downto 0);
    OpCode <= BusIn(27 downto 24);
    CHECK_IF_DATA_NEGATIVE : checkNeg port map (DataIn=>Data, NegativeBCD=>NegBCD, AbsData=>AbsData);
    PROCESS_BINARY_DATA : doubleDabble port map (BinaryIn=>AbsData, BCDout=>BCDTemp);
    FIT_NEGATIVE : completeBCD port map (BCD32=>BCDTemp, NegBCD=>NegBCD, BCDfinal=>BCDTemp1);
    SEND_BCD_FINAL : OutputBCD port map (BCDin=>BCDTemp1, State=>State, OpCode=>OpCode, BCDfinal=>BCDout);

end Structural;
