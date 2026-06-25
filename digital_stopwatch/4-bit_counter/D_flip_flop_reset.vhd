----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 12:47:13 AM
-- Design Name: 
-- Module Name: D_flip_flop_reset - Behavioral
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

entity D_flip_flop_reset is
    Port ( D, CLK, CLR : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_flip_flop_reset;

architecture Behavioral of D_flip_flop_reset is
begin
    state: process (CLK, CLR)
    begin
        if CLR = '1' then
            Q <= '0'; 
        elsif CLK'event and CLK = '0' then 
            Q <= D;
        end if;
    end process;
end Behavioral;
