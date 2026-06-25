----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2026 04:25:12 AM
-- Design Name: 
-- Module Name: Lab3_top - Behavioral
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

entity Lab3_top is
    Port ( A,B : in STD_LOGIC;
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_out : out STD_LOGIC;
           Cath_7SD,Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end Lab3_top;

architecture Behavioral of Lab3_top is

component Gates
    port ( A : in std_logic;
           B : in std_logic;
           G_out : out std_logic_vector (7 downto 0));
    end component;

component multiplexer
    port ( selector : in std_logic_vector (2 downto 0);
           Mux_in : in std_logic_vector (7 downto 0);
           Mux_out : out std_logic);    
    end component;
    
component displaydecoder
    port ( DISP_in : in std_logic;
           cath_7SD : out std_logic_vector (7 downto 0);
           anode_7SD : out std_logic_vector (7 downto 0));
    end component;

signal G_out : std_logic_vector (7 downto 0);
signal mux_out_internal : std_logic;


begin
           
U1: Gates
    port map ( A => A,
               B => B,
               G_out => G_out);

U2: multiplexer
    port map ( selector => Selector,
               Mux_in => G_out,
               Mux_out => mux_out_internal);

U3: DisplayDecoder
port map( DISP_in => mux_out_internal,
          Cath_7SD => Cath_7SD,
          Anode_7SD => Anode_7SD);        
               
Mux_out <= mux_out_internal;

end Behavioral;
