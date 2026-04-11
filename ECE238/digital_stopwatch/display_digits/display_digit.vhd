----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 03:02:08 PM
-- Design Name: 
-- Module Name: display_digit - Behavioral
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

entity display_digit is
    Port ( Count : in STD_LOGIC_VECTOR (3 downto 0);
           Cathode_7SD,Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end display_digit;

architecture Behavioral of display_digit is
    
begin
    Anode_7SD <= "11111110";
    process(Count)
    begin
        case Count is
            when "0000" => Cathode_7SD <= "00000011";
            when "0001" => Cathode_7SD <= "10011111";
            when "0010" => Cathode_7SD <= "00100101";
            when "0011" => Cathode_7SD <= "00001101";
            when "0100" => Cathode_7SD <= "10011001"; 
            when "0101" => Cathode_7SD <= "01001001";
            when "0110" => Cathode_7SD <= "01000001";
            when "0111" => Cathode_7SD <= "00011111";
            when "1000" => Cathode_7SD <= "00000001";
            when "1001" => Cathode_7SD <= "00001001";
            when "1010" => Cathode_7SD <= "00010001";
            when "1011" => Cathode_7SD <= "11000001";
            when "1100" => Cathode_7SD <= "01100011";
            when "1101" => Cathode_7SD <= "10000101";
            when "1110" => Cathode_7SD <= "01100001";
            when "1111" => Cathode_7SD <= "01110001";

            when others => Cathode_7SD <= "11111111";

        end case;
    end process;

end Behavioral;