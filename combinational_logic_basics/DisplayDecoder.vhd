----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2026 03:15:38 AM
-- Design Name: 
-- Module Name: DisplayDecoder - Behavioral
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

entity DisplayDecoder is
    Port ( DISP_in : in STD_LOGIC;
           Cath_7SD : out STD_LOGIC_VECTOR (7 downto 0);
           Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end DisplayDecoder;

architecture Behavioral of DisplayDecoder is

begin

process (DISP_in)

begin
    if DISP_in = '1' then
        Cath_7SD <= "10010001";
    else
        Cath_7SD <= "11100011";
    end if;
end process;

Anode_7SD <= "11111110";

end Behavioral;
