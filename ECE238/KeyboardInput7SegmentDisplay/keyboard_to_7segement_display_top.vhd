----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2026 02:45:02 PM
-- Design Name: 
-- Module Name: keyboard_to_7segement_display_top - Behavioral
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
entity TOP is
    Port ( System_Clk  : in  STD_LOGIC;
           USB_CLK     : in  STD_LOGIC;
           USB_DATA    : in  STD_LOGIC;
           Cathode_7SD : out STD_LOGIC_VECTOR(7 downto 0);
           Anode_7SD   : out STD_LOGIC_VECTOR(7 downto 0));
end TOP;

architecture Structural of TOP is

component keyboard_input_uart is
    Port ( USB_CLK    : in  STD_LOGIC;
           USB_DATA   : in  STD_LOGIC;
           LowerHalf  : out STD_LOGIC_VECTOR(3 downto 0);
           HigherHalf : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component twoDigit_Disp is
    Port ( System_Clk  : in  STD_LOGIC;
           FirstDigit  : in  STD_LOGIC_VECTOR(3 downto 0);
           SecondDigit : in  STD_LOGIC_VECTOR(3 downto 0);
           Cathode_7SD : out STD_LOGIC_VECTOR(7 downto 0);
           Anode_7SD   : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal LowerHalf_sig  : STD_LOGIC_VECTOR(3 downto 0);
signal HigherHalf_sig : STD_LOGIC_VECTOR(3 downto 0);

begin
kbController : keyboard_input_uart
    Port map ( USB_CLK    => USB_CLK,
               USB_DATA   => USB_DATA,
               LowerHalf  => LowerHalf_sig,
               HigherHalf => HigherHalf_sig);

twoDigitDisp : twoDigit_Disp
    Port map ( System_Clk  => System_Clk,
               FirstDigit  => HigherHalf_sig,
               SecondDigit => LowerHalf_sig,
               Cathode_7SD => Cathode_7SD,
               Anode_7SD   => Anode_7SD);
end Structural;