----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2026 03:42:58 PM
-- Design Name: 
-- Module Name: tenstatedisplay_tb - bench
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
entity TenStateDisplay_tb is
end TenStateDisplay_tb;
architecture bench of TenStateDisplay_tb is
    component TenStateDisplay
        Port (Clock_System : in  STD_LOGIC;
              Reset        : in  STD_LOGIC;
              Direction    : in  STD_LOGIC;
              Cathode_7SD  : out STD_LOGIC_VECTOR(7 downto 0);
              Anode_7SD    : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
        signal Clock_System : STD_LOGIC := '0';
        signal Reset        : STD_LOGIC := '0';
        signal Direction    : STD_LOGIC := '1';
        signal Cathode_7SD  : STD_LOGIC_VECTOR(7 downto 0);
        signal Anode_7SD    : STD_LOGIC_VECTOR(7 downto 0);

begin
    UUT : TenStateDisplay
        port map (Clock_System => Clock_System,
                  Reset        => Reset,
                  Direction    => Direction,
                  Cathode_7SD  => Cathode_7SD,
                  Anode_7SD    => Anode_7SD);
    Clock_System <= not Clock_System after 5 ns;
    process
    begin
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        Direction <= '1';
        wait for 100 ns;
        Direction <= '0';
        wait for 100 ns;
        wait;
    end process;

end bench;
