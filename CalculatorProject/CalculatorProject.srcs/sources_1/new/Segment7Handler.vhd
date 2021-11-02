----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2021 04:33:43
-- Design Name: 
-- Module Name: Segment7Handler - Structural
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

entity Segment7Handler is
    Port ( CLK : in STD_LOGIC;
           SegmentSelect : inout STD_LOGIC_VECTOR (7 downto 0);
           BCD32 : in STD_LOGIC_VECTOR (31 downto 0);
           SegmentSections : out STD_LOGIC_VECTOR (0 to 6)
           );
end Segment7Handler;

architecture Structural of Segment7Handler is

    Signal SegCLK : STD_LOGIC;
    Signal BCD4 : STD_LOGIC_VECTOR (3 downto 0);

    component clkDivider7Seg is
        Port ( CLKin  : in  STD_LOGIC;
               CLKout : out STD_LOGIC);
    end component;
    
    component shiftRegister3Segs
        Port ( CLK       : in  STD_LOGIC;
               SegSelect : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component bcdSelect
        Port ( SegSelect : in  STD_LOGIC_VECTOR (7 downto 0);
               BCDin     : in  STD_LOGIC_VECTOR (31 downto 0);
               BCDout    : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component bcdToSeg7
        port ( BCD         : in  STD_LOGIC_VECTOR (3 downto 0); -- Take a 4 bit BCD input
               Segment7    : out STD_LOGIC_VECTOR (0 to 6)); -- Output a 7 bit logic vector corresponding to 7 Seg LEDs
    end component;

begin
    SET_SEGMENT_FREQUENCY : clkDivider7Seg port map (CLKin=>CLK, CLKout=>SegCLK);
    SHIFT_SEGMENT_DISPLAYED : shiftRegister3Segs port map (CLK=>SegCLK, SegSelect=>SegmentSelect);
    SELECT_4_BIT_FROM_32_BIT : bcdSelect port map (SegSelect=>SegmentSelect, BCDin=>BCD32, BCDout=>BCD4);
    DISPLAY_4_BIT : bcdToSeg7 port map (BCD=>BCD4, Segment7=>SegmentSections);
end Structural;
