# Keyboard Scancode Display

A serial keyboard interface that receives scancodes using a PS/2-style protocol and shows the received byte as two hex digits on a 7-segment display.

## What it does

A key press on the keyboard is received one bit at a time over the serial clock/data lines, reassembled into a scancode byte, and displayed as two hexadecimal digits on the board's 7-segment display. Key-release events are detected and ignored so the display tracks presses cleanly.

## How it works

The design is a structural top module (`keyboard_to_7segement_display_top.vhd`) that wires together two independently simulated subsystems:

- **Scancode receiver (`keyboard_input_uart.vhd`)** - samples the serial data line on each falling edge of the keyboard clock. It detects the start bit, shifts the next 8 data bits (LSB first) into a scancode shift register, and counts through the framing to know when a full byte has arrived. It also watches for the `0xF0` break code so it can distinguish a key release from a key press. The completed byte is split into a high and low nibble for the display.
- **Two-digit display (`twoDigitDisplay.vhd`, `hex_disp.vhd`)** - takes the two nibbles and drives a time-multiplexed two-digit hex 7-segment display.
- **`frequency_divider.vhd`** - divides the board clock down to the rate used to multiplex the display digits.
- **ROM (`ROM.xci`, `ROM_COE.coe`)** - a Vivado ROM IP core with its initialization data, used for the hex-to-segment lookup.

## Files

| File                                                        | Role                                   |
| ----------------------------------------------------------- | -------------------------------------- |
| `keyboard_to_7segement_display_top.vhd`                     | Structural top module                  |
| `keyboard_input_uart.vhd`                                   | Serial scancode receiver               |
| `twoDigitDisplay.vhd`, `hex_disp.vhd`                       | Two-digit hex 7-segment display        |
| `frequency_divider.vhd`                                     | Clock divider for display multiplexing |
| `ROM.xci`, `ROM_COE.coe`                                    | ROM IP core + initialization data      |
| `Artix-7 Constraint/keyboard_input_7segment_display.constr` | Pin constraints                        |

## Build & target

- **Tools:** Xilinx Vivado `2020.2`, VHDL
- **Board:** Nexys A7-100T (Artix-7, `XC7A100T`)
