----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 04:00:01 PM
-- Design Name: 
-- Module Name: digital_stopwatch_top - Behavioral
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

entity digital_stopwatch_top is
    Port ( clock_system : in STD_LOGIC;
           reset : in STD_LOGIC;
           cathode_7SD,anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end digital_stopwatch_top;

architecture Structural of digital_stopwatch_top is

-- components from previous designs --
component frequency_divider is 
    port ( clock_system : in std_logic;
           clock_1hz : out std_logic);
end component;

component fourbitcounter is
    port ( clock_system,reset : in std_logic;
           count : out std_logic_vector (3 downto 0));
end component;

component display_digit is
    port ( count : in std_logic_vector (3 downto 0);
           cathode_7SD : out std_logic_vector (7 downto 0);
           anode_7SD : out std_logic_vector (7 downto 0));
end component;

-- internal signals --
signal four_bit_count : std_logic_vector (3 downto 0);

begin 
               
-- 4bit counter (contains frequency divider) --
CNT : fourbitcounter
      port map ( clock_system => clock_system,
                 reset => reset,
                 count => four_bit_count);

-- 7-segment display --
DISP : display_digit
    port map ( count => four_bit_count,
          cathode_7SD => cathode_7SD,
          anode_7SD => anode_7SD);
end Structural;
