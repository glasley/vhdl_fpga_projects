----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2026 03:35:25 PM
-- Design Name: 
-- Module Name: ripplecarryadder_tb - bench
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


entity ripplecarryadder_tb is
--  Port ( );
end ripplecarryadder_tb;

architecture bench of ripplecarryadder_tb is

component ripplecarryadder
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal A_tb : std_logic_vector (3 downto 0);
signal B_tb : std_logic_vector (3 downto 0);
signal sum_tb : std_logic_vector (3 downto 0);
signal Cin_tb,Cout_tb : std_logic;

begin

uut: ripplecarryadder
    port map (A => A_tb,
              B => B_tb,
              sum => sum_tb,
              Cin => Cin_tb,
              Cout => Cout_tb);

stimulus: process
begin
    A_tb <= "0001"; B_tb <= "0000"; Cin_tb <= '1'; wait for 100 ns;
    A_tb <= "0010"; B_tb <= "0010"; Cin_tb <= '0'; wait for 100 ns;
    A_tb <= "0100"; B_tb <= "0100"; Cin_tb <= '0'; wait for 100 ns;
    A_tb <= "1000"; B_tb <= "1000"; Cin_tb <= '0'; wait for 100 ns;
wait;
end process;
end bench;
