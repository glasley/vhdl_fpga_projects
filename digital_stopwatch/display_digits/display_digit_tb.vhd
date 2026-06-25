----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 03:25:15 PM
-- Design Name: 
-- Module Name: display_digit_tb - bench
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

entity display_digit_tb is
end display_digit_tb;

architecture bench of display_digit_tb is

component display_digit is
    port ( count: in std_logic_vector (3 downto 0);
           cathode_7SD,anode_7SD : out std_logic_vector (7 downto 0));
    end component;

signal count_tb : std_logic_vector (3 downto 0);
signal cathode_7SD_tb : std_logic_vector (7 downto 0);
signal anode_7SD_tb : std_logic_vector (7 downto 0);

begin

uut : display_digit
        port map (count => count_tb,
                  cathode_7SD => cathode_7SD_tb,
                  anode_7SD => anode_7SD_tb);
stimulus: process
 begin  
        Count_tb <= "0000"; wait for 100 ns;
        Count_tb <= "0001"; wait for 100 ns;
        Count_tb <= "0010"; wait for 100 ns;
        Count_tb <= "0011"; wait for 100 ns;
        Count_tb <= "0100"; wait for 100 ns;
        Count_tb <= "0101"; wait for 100 ns;
        Count_tb <= "0110"; wait for 100 ns;
        Count_tb <= "0111"; wait for 100 ns;
        Count_tb <= "1000"; wait for 100 ns;
        Count_tb <= "1001"; wait for 100 ns;
        Count_tb <= "1010"; wait for 100 ns;
        Count_tb <= "1011"; wait for 100 ns;
        Count_tb <= "1100"; wait for 100 ns;
        Count_tb <= "1101"; wait for 100 ns;
        Count_tb <= "1110"; wait for 100 ns;
        Count_tb <= "1111"; wait for 100 ns;
        wait;
    end process;
end bench;
