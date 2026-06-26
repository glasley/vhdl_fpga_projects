----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2026 04:52:52 AM
-- Design Name: 
-- Module Name: Lab3_top_tb - bench
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

entity Lab3_top_tb is
--  Port ( );
end Lab3_top_tb;

architecture bench of Lab3_top_tb is

component Lab3_top
    Port ( A,B : in STD_LOGIC;
               Selector : in STD_LOGIC_VECTOR (2 downto 0);
               Mux_out : out STD_LOGIC;
               Cath_7SD,Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A_tb,B_tb : std_logic;
signal Mux_out_tb : std_logic;
signal selector_tb : std_logic_vector (2 downto 0);
signal Cath_7SD_tb,Anode_7SD_tb : std_logic_vector  (7 downto 0);


begin

uut: Lab3_top port map ( A => A_tb,
                         B => B_tb,
                         Mux_out => Mux_out_tb,
                         selector => selector_tb,
                         Cath_7SD => Cath_7SD_tb,
                         Anode_7SD => Anode_7SD_tb);

stimulus: process
    begin
        Selector_tb <= "000"; A_tb <= '0'; B_tb <= '0'; wait for 100 ns;
        Selector_tb <= "000"; A_tb <= '1'; B_tb <= '0'; wait for 100 ns;
        Selector_tb <= "001"; A_tb <= '0'; B_tb <= '0'; wait for 100 ns;
        Selector_tb <= "001"; A_tb <= '1'; B_tb <= '0'; wait for 100 ns;
        Selector_tb <= "010"; A_tb <= '1'; B_tb <= '1'; wait for 100 ns;
        Selector_tb <= "010"; A_tb <= '1'; B_tb <= '0'; wait for 100 ns;
        Selector_tb <= "011"; A_tb <= '0'; B_tb <= '1'; wait for 100 ns;
        Selector_tb <= "100"; A_tb <= '1'; B_tb <= '1'; wait for 100 ns;
        Selector_tb <= "101"; A_tb <= '0'; B_tb <= '0'; wait for 100 ns;
        Selector_tb <= "110"; A_tb <= '1'; B_tb <= '0'; wait for 100 ns;
    wait;
end process;
end bench;
