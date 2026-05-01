----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2026 01:47:11 PM
-- Design Name: 
-- Module Name: hex_disp - Behavioral
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

entity hex_disp is
    port (clk : in std_logic;
          input : in std_logic_vector (3 downto 0);
          Cathode_7SD : out std_logic_vector (7 downto 0));
end hex_disp;

architecture Behavioral of hex_disp is
COMPONENT ROM
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    qspo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

signal aigSevSegCath: std_logic_vector (7 downto 0);

begin
SevSegValues : ROM
  PORT MAP (
    a => input,
    clk => clk,
    qspo => aigSevSegCath);
  
  Cathode_7SD  <= aigSevSegCath;
  
end Behavioral;
