----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2026 02:21:27 PM
-- Design Name: 
-- Module Name: keyboard_input_uart - Behavioral
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

entity keyboard_input_uart is
    Port ( USB_CLK, USB_DATA : in STD_LOGIC;
           LowerHalf,HigherHalf : out std_logic_vector (3 downto 0));
end keyboard_input_uart;
architecture Behavioral of keyboard_input_uart is
signal bitCount       : integer range 0 to 100 := 0;
signal scancodeReady  : STD_LOGIC := '0';
signal scancode       : STD_LOGIC_VECTOR(7 downto 0);
signal breakReceived  : STD_LOGIC := '0';
begin

keyboard_scan_ready_enable : process(USB_CLK) is
begin
    if falling_edge(USB_CLK) then
        if bitCount = 0 AND USB_DATA = '0' then    
            scancodeReady <= '0';
            bitCount <= bitCount + 1;
        elsif bitCount > 0 and bitCount < 9 then
            scancode <= USB_DATA & scancode(7 downto 1);  
            bitCount <= bitCount + 1;
        elsif bitCount = 9 then                    
            bitCount <= bitCount + 1;
        elsif bitCount = 10 then                   
            scancodeReady <= '1';
            bitCount <= 0;
        end if;
    end if;
end process keyboard_scan_ready_enable;

scan_keyboard : process(scancodeReady, scancode) is
begin
    if rising_edge(scancodeReady) then
        if breakReceived = '1' then
            breakReceived <= '0';
        elsif breakReceived = '0' then
            if scancode = "11110000" then
                breakReceived <= '1';
            end if;
        end if;
        LowerHalf  <= scancode(3 downto 0);
        HigherHalf <= scancode(7 downto 4);
    end if;
end process scan_keyboard;
end Behavioral;
