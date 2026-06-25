----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2026 12:59:14 AM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
    Port ( Mux_in : in STD_LOGIC_VECTOR (7 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_out : out STD_LOGIC);
end multiplexer;

architecture Behavioral of multiplexer is

begin
    Mux_out <= Mux_in (0) when (selector = "000") else
               Mux_in (1) when (selector = "001") else
               Mux_in (2) when (selector = "010") else
               Mux_in (3) when (selector = "011") else
               Mux_in (4) when (selector = "100") else
               Mux_in (5) when (selector = "101") else
               Mux_in (6) when (selector = "110") else
               Mux_in (7);
              
end Behavioral;
