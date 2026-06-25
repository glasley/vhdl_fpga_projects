# VHDL / FPGA Projects

A collection of digital-design projects written in VHDL and built in Xilinx Vivado, targeting Artix-7 FPGAs (Digilent Basys 3 and Nexys 4 DDR). Each project includes its design sources, simulation testbenches, and the pin-constraint file used to map it to hardware.

These are a few of the coursework projects from ECE238 (Computer Logic Design) at the University of New Mexico, curated and documented as a portfolio while I transition from a biology / lab-research background toward embedded firmware and digital systems.

## Projects

| Project                                                      | Summary                                                                                                           |
| ------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| [`keyboard_scancode_display`](./keyboard_scancode_display)   | Serial keyboard scancode receiver (PS/2-style) driving a two-digit hex 7-segment display.                         |
| [`digital_stopwatch`](./digital_stopwatch)                   | Hierarchical real-time counter built bottom-up from a D flip-flop to a full stopwatch.                            |
| [`combinational_logic_basics`](./combinational_logic_basics) | Foundational combinational blocks including: gates, multiplexer, display decoder, all integrated in a top module. |
| [`ripple_carry_adder`](./ripple_carry_adder)                 | Structural ripple-carry adder composed from full-adder logic.                                                     |
| [`decade_counter`](./decade_counter)                         | Ten-state (0–9) counter driving a single-digit display.                                                           |

## File naming

| Suffix                      | Meaning                                            |
| --------------------------- | -------------------------------------------------- |
| `*.vhd`                     | Design source                                      |
| `*_tb.vhd`                  | Simulation testbench                               |
| `*_constr.xdc` / `*.constr` | Pin constraints mapped to the target Artix-7 board |
| `*.xci`                     | Vivado IP core configuration                       |
| `*.coe`                     | Memory (ROM/RAM) initialization data               |

## Tools & hardware

- **Tools:** Xilinx Vivado, VHDL
- **Boards:** Digilent Basys 3 (Artix-7, `xc7a35t`), Nexys A7-100T (Artix-7, `XC7A100T`)
