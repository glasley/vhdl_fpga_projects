----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2026 03:49:18 AM
-- Design Name: 
-- Module Name: DisplayDecoder_tb - bench
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

entity DisplayDecoder_tb is
--  Port ( );
end DisplayDecoder_tb;

architecture bench of DisplayDecoder_tb is

component DisplayDecoder
    port ( DISP_in : in STD_LOGIC;
           Cath_7SD : out STD_LOGIC_VECTOR (7 downto 0);
           Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal DISP_in_tb : std_logic;
signal Cath_7SD_tb,Anode_7SD_tb : std_logic_vector (7 downto 0);

begin

uut: DisplayDecoder port map ( DISP_in => DISP_in_tb,
                               Cath_7SD => Cath_7SD_tb,
                               Anode_7SD => Anode_7SD_tb);
                               
stimulus: process
    begin
        DISP_in_tb <= '0'; wait for 100 ns;
        DISP_in_tb <= '1'; wait for 100 ns;
        wait;
    end process;
end bench;
