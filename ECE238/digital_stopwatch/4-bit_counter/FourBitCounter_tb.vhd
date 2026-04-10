----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 01:03:38 AM
-- Design Name: 
-- Module Name: FourBitCounter_tb - Behavioral
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

entity FourBitCounter_tb is
end FourBitCounter_tb;

architecture bench of FourBitCounter_tb is
    component FourBitCounter is
        Port ( Clock_system : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Count : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
signal Clock_System_tb, Reset_tb : STD_LOGIC;
signal Count_tb : STD_LOGIC_VECTOR (3 downto 0);
    
constant Clock_100MHz_Period : time := 10 ns;

begin
    uut: FourBitCounter port map (
                                  Clock_system => Clock_System_tb,
                                  Reset => Reset_tb,
                                  Count => Count_tb);

    Clk_process: process
    begin
        Clock_System_tb <= '0';wait for Clock_100MHz_Period / 2;
        Clock_System_tb <= '1';wait for Clock_100MHz_Period / 2;
    end process;

    stimulus: process
    begin
        Reset_tb <= '0';wait for 300 ns;
        Reset_tb <= '1';wait for 40 ns;
        Reset_tb <= '0';wait for 600 ns;
        wait;
    end process;

end bench;
