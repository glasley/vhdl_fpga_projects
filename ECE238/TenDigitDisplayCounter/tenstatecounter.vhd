----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2026 03:23:10 PM
-- Design Name: 
-- Module Name: tenstatecounter - Behavioral
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
entity tenstatecounter is
    Port ( Clock_System,Reset,Direction : in STD_LOGIC;
           BCD : out STD_LOGIC_VECTOR (3 downto 0));
end tenstatecounter;
architecture Behavioral of tenstatecounter is

    type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
    signal presentState, nextState : state_type;
begin
    process(Clock_System, Reset)
    begin
        if Reset = '1' then
            presentState <= s0;
        elsif rising_edge(Clock_System) then
            presentState <= nextState;
        end if;
    end process;

    process(presentState, Direction)
    begin
        case presentState is
            when s0 =>
                BCD <= "0000";
                if Direction = '1' then nextState <= s1;
                else nextState <= s9;
                end if;
            when s1 => BCD <= "0001"; nextState <= s2;
            when s2 => BCD <= "0010"; nextState <= s3;
            when s3 => BCD <= "0011"; nextState <= s4;
            when s4 => BCD <= "0100"; nextState <= s0;
            when s5 => BCD <= "0101"; nextState <= s9;
            when s6 => BCD <= "0110"; nextState <= s5;
            when s7 => BCD <= "0111"; nextState <= s6;
            when s8 => BCD <= "1000"; nextState <= s7;
            when s9 =>
                BCD <= "1001";
                if Direction = '0' then nextState <= s8;
                else nextState <= s0;
                end if;
        end case;
    end process;
end Behavioral;
