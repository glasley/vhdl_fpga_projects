----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 12:39:34 AM
-- Design Name: 
-- Module Name: 4bit_counter - Behavioral
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

entity FourBitCounter is
    Port ( Clock_system : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (3 downto 0));
end FourBitCounter;

architecture behavioral of FourBitCounter is
    signal temp: STD_LOGIC_VECTOR (3 downto 0);
    signal notTemp: STD_LOGIC_VECTOR (3 downto 0);
    signal Clk_1Hz: STD_LOGIC := '0';

    component Frequency_Divider is
        Port ( Clock_System : in STD_LOGIC;
               Clock_1Hz : out STD_LOGIC);
    end component;

    component D_flip_flop_reset is
        Port ( D, CLK, CLR : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

begin
    notTemp <= not(temp);

    FD: Frequency_Divider port map (Clock_System => Clock_system, Clock_1Hz => Clk_1Hz);

    ff0: D_flip_flop_reset port map (D => notTemp(0), CLK => Clk_1Hz, CLR => Reset, Q => temp(0));
    ff1: D_flip_flop_reset port map (D => notTemp(1), CLK => temp(0), CLR => Reset, Q => temp(1));
    ff2: D_flip_flop_reset port map (D => notTemp(2), CLK => temp(1), CLR => Reset, Q => temp(2));
    ff3: D_flip_flop_reset port map (D => notTemp(3), CLK => temp(2), CLR => Reset, Q => temp(3));

    Count <= temp;

end behavioral;
