----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2026 01:58:37 AM
-- Design Name: 
-- Module Name: multiplexer_tb - bench
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer_tb is
--  Port ( );
end multiplexer_tb;

architecture bench of multiplexer_tb is

component multiplexer
    Port ( selector: in std_logic_vector (2 downto 0);
           Mux_in: in std_logic_vector (7 downto 0);
           Mux_out: out std_logic);
end component;

signal selector_tb : std_logic_vector (2 downto 0);
signal Mux_in_tb : std_logic_vector (7 downto 0);
signal Mux_out_tb : std_logic ;

begin

uut: multiplexer port map (selector => selector_tb,
                           Mux_in => Mux_in_tb,
                           Mux_out => Mux_out_tb);

stimulus: process
    begin
        selector_tb <= "000"; Mux_in_tb <= "00000001"; wait for 100 ns;
        selector_tb <= "001"; Mux_in_tb <= "00000010"; wait for 100 ns;
        selector_tb <= "010"; Mux_in_tb <= "00000100"; wait for 100 ns;
        selector_tb <= "011"; Mux_in_tb <= "00001000"; wait for 100 ns;
        selector_tb <= "100"; Mux_in_tb <= "00010000"; wait for 100 ns;
        selector_tb <= "101"; Mux_in_tb <= "00100000"; wait for 100 ns;
        selector_tb <= "110"; Mux_in_tb <= "01000000"; wait for 100 ns;
        selector_tb <= "111"; Mux_in_tb <= "10000000"; wait for 100 ns;
      wait;
   end process;
end bench;
