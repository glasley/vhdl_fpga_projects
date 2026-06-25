----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2026 10:23:21 PM
-- Design Name: 
-- Module Name: gates_tb - bench
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

entity gates_tb is
--  Port ( );
end gates_tb;

architecture bench of gates_tb is

component gates is
Port ( A,B : in std_logic;
       G_out : out std_logic_vector (7 downto 0));
end component;

signal A_tb, B_tb: std_logic;
signal G_out_tb : std_logic_vector (7 downto 0);

begin

uut: gates port map (A => A_tb,
                     B => B_tb,
                     G_out => G_out_tb);

stimulus: process

begin
A_tb <= '0'; B_tb <= '0'; wait for 100 ns;
A_tb <= '1'; B_tb <= '0'; wait for 100 ns;
A_tb <= '0'; B_tb <= '1'; wait for 100 ns;
A_tb <= '1'; B_tb <= '1'; wait for 100 ns;

wait;
end process;

end bench;
