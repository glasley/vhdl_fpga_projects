----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2026 02:52:22 PM
-- Design Name: 
-- Module Name: twoDigitDisplay - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;
entity twoDigit_Disp is
    Port ( System_Clk  : in  STD_LOGIC;
           FirstDigit  : in  STD_LOGIC_VECTOR(3 downto 0);
           SecondDigit : in  STD_LOGIC_VECTOR(3 downto 0);
           Cathode_7SD : out STD_LOGIC_VECTOR(7 downto 0);
           Anode_7SD   : out STD_LOGIC_VECTOR(7 downto 0));
end twoDigit_Disp;
architecture Behavioral of twoDigit_Disp is
component Frequency_Divider is
    Port ( Clock_System : in  STD_LOGIC;
           Clock_2ms    : out STD_LOGIC);
end component;
component hex_disp is
    Port ( clk         : in  STD_LOGIC;
           input       : in  STD_LOGIC_VECTOR(3 downto 0);
           Cathode_7SD : out STD_LOGIC_VECTOR(7 downto 0));
end component;
signal Anode_Toggle  : STD_LOGIC;
signal Anode_signal  : STD_LOGIC_VECTOR(7 downto 0) := "11111110";
signal CurrDigit     : STD_LOGIC_VECTOR(3 downto 0);
signal Cathode_sig   : STD_LOGIC_VECTOR(7 downto 0);

begin
FreqDiv : Frequency_Divider
    Port map ( Clock_System => System_Clk,
               Clock_2ms    => Anode_Toggle);

process (Anode_Toggle) is
begin
    if rising_edge(Anode_Toggle) then
        if Anode_signal = "11111110" then
            CurrDigit    <= FirstDigit;
            Anode_signal <= "11111101";
        elsif Anode_signal = "11111101" then
            CurrDigit    <= SecondDigit;
            Anode_signal <= "11111110";
        end if;
    end if;
end process;

SevSegDisp : hex_disp
    Port map ( clk         => System_Clk,
               input       => CurrDigit,
               Cathode_7SD => Cathode_sig);

Anode_7SD   <= Anode_signal;
Cathode_7SD <= Cathode_sig;

end Behavioral;