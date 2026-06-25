# Digital Stopwatch

A real-time counter displayed on a 7-segment display, built bottom-up from a single flip-flop to a complete stopwatch.

## What it does

Once running, the design counts in real time and shows the current count on the board's 7-segment display, driven by a 1 Hz tick derived from the board clock. A reset returns the count to zero.

## How it works

The project was an exercise in hierarchical, bottom-up structural design where each level is built and verified before being used in the next:

1. **D flip-flop (`D_flip_flop_reset.vhd`)** - a reset-capable flip-flop, the basic storage primitive.
2. **4-bit counter (`4bit_counter.vhd`)** - built from the flip-flops, and containing the frequency divider that produces the 1 Hz counting tick.
3. **Frequency divider (`frequency_divider.vhd`)** - divides the high-frequency board clock down to the 1 Hz rate the counter advances on.
4. **Display (`display_digit.vhd`)** - decodes the count value to the 7-segment display.
5. **Top (`digital_stopwatch_top.vhd`)** - a structural module that instantiates the counter and the display and wires them together.

The point of the project is the architecture: a larger system assembled from small, individually testbenched components, with clock division handled explicitly.

## Files

| Folder / file                                     | Role                                             |
| ------------------------------------------------- | ------------------------------------------------ |
| `4-bit_counter/D_flip_flop_reset.vhd`             | Reset-capable D flip-flop                        |
| `4-bit_counter/4bit_counter.vhd`                  | 4-bit counter                                    |
| `frequency_divider/frequency_divider.vhd`         | Clock divider (1 Hz tick)                        |
| `display_digits/display_digit.vhd`                | Count-to-7-segment decoder                       |
| `digital_stopwatch_top/digital_stopwatch_top.vhd` | Structural top module                            |
| `*_tb.vhd`, `*_constr.xdc` (per folder)           | Testbench and pin constraints for each component |

## Build & target

- **Tools:** Xilinx Vivado `<version>`, VHDL
- **Board:** Nexys A7-100T (Artix-7, `XC7A100T`)
