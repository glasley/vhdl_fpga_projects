----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2026 03:28:32 PM
-- Design Name: 
-- Module Name: digitdisplay - Behavioral
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

entity DigitDisplay is
    Port (
        bcd         : in  STD_LOGIC_VECTOR(3 downto 0);
        Cathode_7SD : out STD_LOGIC_VECTOR(7 downto 0);
        Anode_7SD   : out STD_LOGIC_VECTOR(7 downto 0)
    );
end DigitDisplay;

architecture Behavioral of DigitDisplay is
begin
    process(bcd)
    begin
        case bcd is
            when "0000" => Cathode_7SD <= "11000000";
            when "0001" => Cathode_7SD <= "11111001";
            when "0010" => Cathode_7SD <= "10100100"; 
            when "0011" => Cathode_7SD <= "10110000";
            when "0100" => Cathode_7SD <= "10011001";
            when "0101" => Cathode_7SD <= "10010010";
            when "0110" => Cathode_7SD <= "10000010";
            when "0111" => Cathode_7SD <= "11111000";
            when "1000" => Cathode_7SD <= "10000000";
            when "1001" => Cathode_7SD <= "10010000";
            when others => Cathode_7SD <= "11111111";
        end case;
    end process;
    Anode_7SD <= "11111110";

end Behavioral;

