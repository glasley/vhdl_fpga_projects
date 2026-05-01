----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2026 11:35:03 PM
-- Design Name: 
-- Module Name: frequency_divider - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity Frequency_Divider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_2ms    : out STD_LOGIC);
end Frequency_Divider;

architecture Behavioral of Frequency_Divider is
    signal count     : INTEGER := 0;
    signal clock_int : STD_LOGIC := '0'; 
begin
    process(Clock_System)
    begin
        if rising_edge(Clock_System) then
            if count = 99999 then
                clock_int <= not clock_int;
                count     <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    Clock_2ms <= clock_int;
end Behavioral;
