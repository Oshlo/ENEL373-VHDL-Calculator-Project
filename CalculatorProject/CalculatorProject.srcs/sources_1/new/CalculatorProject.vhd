----------------------------------------------------------------------------------
-- Company: University of Canterbury
-- Engineer: Adam Finlayson
-- 
-- Create Date: 09.03.2021 19:54:56
-- Design Name: Calculator Project
-- Module Name: CalculatorProject - Structural
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

entity CalculatorProject is
    Port ( SW : in STD_LOGIC_VECTOR (15 downto 0); -- 16 Switches on the FPGA
           BTNC : in STD_LOGIC;
           CLK100MHZ : in STD_LOGIC;               -- 100MHz Clock
           AN : inout STD_LOGIC_VECTOR (7 downto 0); -- 7 Seg Anodes are 'Low' to turn on
           LED : out STD_LOGIC_VECTOR (0 downto 0);
           CA : out STD_LOGIC_VECTOR (0 to 6)      -- 7 bits corresponding to ABCDEFG in Seg7
           );
end CalculatorProject;

architecture Structural of CalculatorProject is
    
    -- Input Signals
    Signal CLK : STD_LOGIC;
    Signal CentreButton : STD_LOGIC;
    Signal SwitchOut : STD_LOGIC_VECTOR(27 downto 0);
    
    -- Bus Signal
    Signal CalcBus : STD_LOGIC_VECTOR(27 downto 0);
    
    -- State Machine Signals
    Signal SwitchWrite : STD_LOGIC;
    Signal ALUAccumulatorRead : STD_LOGIC;
    Signal ALUOutputRead : STD_LOGIC;
    Signal ALUOutputWrite : STD_LOGIC;
    Signal State : STD_LOGIC_VECTOR (3 downto 0);
    Signal DivError : STD_LOGIC;
    Signal DivErrorReset : STD_LOGIC;
    
    -- ALU Signals
    Signal ALUInputA : STD_LOGIC_VECTOR(27 downto 0);
    Signal ALUOutput : STD_LOGIC_VECTOR(27 downto 0);
    Signal ALURegisterLink : STD_LOGIC_VECTOR (27 downto 0);
    
    -- Output Signals
    Signal BCD32 : STD_LOGIC_VECTOR (31 downto 0);
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
    
    component clkDivider is
        Port ( CLKin  : in  STD_LOGIC; -- Takes a 100MHz Clock as an input
               CLKout : out STD_LOGIC); -- Returns the divided Clock
    end component;
    
    component Segment7Handler
        Port ( CLK : in STD_LOGIC;
               SegmentSelect : inout STD_LOGIC_VECTOR (7 downto 0);
               BCD32 : in STD_LOGIC_VECTOR (31 downto 0);
               SegmentSections : out STD_LOGIC_VECTOR (0 to 6)
               );
    end component;
    
    component bit12binToBCD
        Port ( BusIn : in STD_LOGIC_VECTOR (27 downto 0);
               State : in STD_LOGIC_VECTOR (3 downto 0);
               BCDout : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component StateMachine
        Port ( CLKin : in STD_LOGIC;
               button : in STD_LOGIC;
               SwitchWrite : out STD_LOGIC;
               ALUAccumulatorRead : out STD_LOGIC;
               ALUOutputRead : out STD_LOGIC;
               ALUOutputWrite : out STD_LOGIC;
               DivError : in STD_LOGIC;
               DivErrorReset : out STD_LOGIC;
               StateOut : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component ALU28 is
    Port ( InputA : in STD_LOGIC_VECTOR (27 downto 0);
           InputB : in STD_LOGIC_VECTOR (27 downto 0);
           Output : out STD_LOGIC_VECTOR (27 downto 0);
           ResetError : in STD_LOGIC;
           Error : out STD_LOGIC);
    end component;
    
    component ButtonDebounce
        Port ( CLKin : in STD_LOGIC;
           ButtonIn : in STD_LOGIC;
           ButtonOut : out STD_LOGIC);
    end component;
    
    component SwitchFormat is
        Port ( Switches : in STD_LOGIC_VECTOR (15 downto 0);
                SwitchesToBus : out STD_LOGIC_VECTOR (27 downto 0));
    end component;
   
    component TriBuffer28 is
        Port ( In28 : in STD_LOGIC_VECTOR (27 downto 0);
               En : in STD_LOGIC;
               Out28 : out STD_LOGIC_VECTOR (27 downto 0));
    end component;
    
    component Register28 is
        Port ( CLK : in STD_LOGIC;
               DataIn : in STD_LOGIC_VECTOR (27 downto 0);
               En : in STD_LOGIC;
              DataOut : out STD_LOGIC_VECTOR (27 downto 0));
    end component;
    
begin
    -- INPUT STUFF (DONE)
    CPU_CLOCK : clkDivider port map (CLKin=>CLK100MHZ, CLKout=>CLK);
    --BUTTON_DEBOUNCE : ButtonDebounce port map (CLKin=>CLK, ButtonIn=>BTNC, ButtonOut=>CentreButton);
    FORMAT_SWITCH_INPUT_FOR_BUS : SwitchFormat port map (Switches=>SW, SwitchesToBus=>SwitchOut);
    TRIBUFFER_FOR_SWITCHES : TriBuffer28 port map (In28=>SwitchOut, En=>SwitchWrite, Out28=>CalcBus);
    
    
    
    -- STATE MACHINE STUFF
    STATE_MACHINE : StateMachine port map (CLKin=>CLK, 
                                    button=>BTNC,
                                    SwitchWrite=>SwitchWrite,
                                    ALUAccumulatorRead=>ALUAccumulatorRead,
                                    ALUOutputRead=>ALUOutputRead,
                                    ALUOutputWrite=>ALUOutputWrite,
                                    DivError=>DivError,
                                    DivErrorReset=>DivErrorReset,
                                    StateOut=>State);
    
    -- ALU STUFF
    ALU_ACCUMULATOR : Register28 port map (CLK=>CLK, DataIn=>CalcBus, En=>ALUAccumulatorRead, DataOut=>ALUInputA);
    ALU             : ALU28 port map (InputA=>ALUInputA, InputB=>CalcBus, Output=>ALUOutput, ResetError=>DivErrorReset, Error=>DivError);
    ALU_OUTPUT_READ : Register28 port map (CLK=>CLK, DataIn=>ALUOutput, EN=>ALUOutputRead, DataOut=>ALURegisterLink);
    ALU_OUTPUT_WRITE : TriBuffer28 port map (In28=>ALURegisterLink, En=>ALUOutputWrite, Out28=>CalcBus);

    -- OUTPUT STUFF
    PROCESS_BUS_DATA : bit12binToBCD port map (BusIn=>CalcBus, State=>State, BCDout=>BCD32);
    SET_SEGMENT_FREQUENCY : clkDivider7Seg port map (CLKin=>CLK100MHZ, CLKout=>SegCLK);
    SHIFT_SEGMENT_DISPLAYED : shiftRegister3Segs port map (CLK=>SegCLK, SegSelect=>AN);
    SELECT_4_BIT_FROM_32_BIT : bcdSelect port map (SegSelect=>AN, BCDin=>BCD32, BCDout=>BCD4);
    DISPLAY_4_BIT : bcdToSeg7 port map (BCD=>BCD4, Segment7=>CA);
    
end Structural;
