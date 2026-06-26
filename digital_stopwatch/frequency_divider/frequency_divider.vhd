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
           Clock_1Hz : out STD_LOGIC);
end Frequency_Divider;

architecture Behavioral of Frequency_Divider is

    signal count : INTEGER := 1;
    signal sClock_1Hz : STD_LOGIC := '0'; 

begin
    process(Clock_System)
    begin
        if Clock_System'event and Clock_System = '1' then
        count <= count + 1;
            if count = 50000000 then 
                Clock_1Hz <= not sClock_1Hz;
                sClock_1Hz <= not sClock_1Hz;
                count <= 1;
                
            end if;           
        end if;
    end process;
    
end Behavioral;
