----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2026 03:30:44 PM
-- Design Name: 
-- Module Name: tenstatedisplay - Structural
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
entity TenStateDisplay is
    Port (
        Clock_System : in  STD_LOGIC;
        Reset        : in  STD_LOGIC;
        Direction    : in  STD_LOGIC;
        Cathode_7SD  : out STD_LOGIC_VECTOR(7 downto 0);
        Anode_7SD    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end TenStateDisplay;
architecture Structural of TenStateDisplay is

    signal slowClk : STD_LOGIC;
    signal BCD     : STD_LOGIC_VECTOR(3 downto 0);

begin

    frequency_divider: entity work.Frequency_Divider
        port map (Clock_System => Clock_System,
                  Reset        => Reset,
                  Clock_1Hz    => slowClk);

    counter: entity work.tenstatecounter
        port map (Clock_System     => slowClk,
                  Reset     => Reset,
                  Direction => Direction,
                  BCD       => BCD);

    display: entity work.DigitDisplay
        port map (bcd         => BCD,
                  Cathode_7SD => Cathode_7SD,
                  Anode_7SD   => Anode_7SD);
end Structural;

