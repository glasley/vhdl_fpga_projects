----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2026 05:43:28 PM
-- Design Name: 
-- Module Name: ripplecarryadder - Behavioral
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

entity ripplecarryadder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC);
end ripplecarryadder;

architecture Behavioral of ripplecarryadder is
component fulladder
    Port (A,B,c_in: in std_logic;
          sum, c_out: out std_logic);
end component;

signal C_1,C_2,C_3 : std_logic;

begin

fa1: fulladder port map ( A => A(0),
                          B => B(0),
                          C_in => Cin,
                          sum => sum(0),
                          c_out => C_1);
fa2: fulladder port map (A => A(1),
                          B => B(1),
                          C_in => C_1,
                          sum => sum(1),
                          c_out => C_2);
fa3: fulladder port map (A => A(2),
                          B => B(2),
                          C_in => C_2,
                          sum => sum(2),
                          c_out => C_3);
fa4: fulladder port map (A => A(3),
                          B => B(3),
                          C_in => C_3,
                          sum => sum(3),
                          c_out => Cout);

end Behavioral;
