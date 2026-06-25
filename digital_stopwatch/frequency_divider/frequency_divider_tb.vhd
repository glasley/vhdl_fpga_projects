----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2026 11:59:41 PM
-- Design Name: 
-- Module Name: frequency_divider_tb - Behavioral
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

entity Frequency_Divider_TB is
end Frequency_Divider_TB;

architecture bench of Frequency_Divider_TB is
    component Frequency_Divider is
        Port ( Clock_System : in STD_LOGIC;
               Clock_1Hz : out STD_LOGIC);
    end component;

signal Clock_System_tb, Clock_1Hz_tb : STD_LOGIC;
    
constant Clock_Period : time := 10 ns;

begin
    uut: Frequency_Divider port map (
        Clock_System => Clock_System_tb,
        Clock_1Hz => Clock_1Hz_tb);

Clk_process: process
    begin
        Clock_System_tb <= '0'; wait for Clock_Period/2;
        Clock_System_tb <= '1'; wait for Clock_Period/2;
    end process;

end bench;
