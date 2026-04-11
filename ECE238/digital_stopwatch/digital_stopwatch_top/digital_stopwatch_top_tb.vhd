----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 04:32:35 PM
-- Design Name: 
-- Module Name: digital_stopwatch_top_tb - bench
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

entity digital_stopwatch_top_tb is
end digital_stopwatch_top_tb;

architecture bench of digital_stopwatch_top_tb is

component digital_stopwatch_top is
        Port (
            clock_system : in  STD_LOGIC;
            reset        : in  STD_LOGIC;
            cathode_7SD  : out STD_LOGIC_VECTOR (7 downto 0);
            anode_7SD    : out STD_LOGIC_VECTOR (7 downto 0));
end component;

    signal clock_system_tb : STD_LOGIC := '0';
    signal reset_tb        : STD_LOGIC := '0';
    signal cathode_7SD_tb  : STD_LOGIC_VECTOR (7 downto 0);
    signal anode_7SD_tb    : STD_LOGIC_VECTOR (7 downto 0);

    constant CLOCK_PERIOD : time := 10 ns;

begin
    uut : digital_stopwatch_top
        port map (
            clock_system => clock_system_tb,
            reset        => reset_tb,
            cathode_7SD  => cathode_7SD_tb,
            anode_7SD    => anode_7SD_tb);

clock_process : process
    begin
        clock_system_tb <= '0';wait for CLOCK_PERIOD / 2;
        clock_system_tb <= '1';wait for CLOCK_PERIOD / 2;
end process;

stimulus : process
    begin
        reset_tb <= '0';wait for 100 ns;
        reset_tb <= '1';wait for 100 ns;
        wait;
end process;
end bench;