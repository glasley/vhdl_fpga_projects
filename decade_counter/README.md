# Decade Counter

A ten-state (0–9) counter driving a single-digit 7-segment display. (Originally "TenDigitDisplayCounter.")

## What it does

Counts repeatedly through the digits 0 through 9 and shows the current value on a 7-segment display, wrapping back to 0 after 9.

## How it works

- **`tenstatecounter.vhd`** - a sequential counter that advances through ten states (0–9) and rolls over.
- **`digitdisplay.vhd`** - decodes the current state to the 7-segment display.
- **`tenstatedisplay.vhd`** - ties the counter to the display.

This is a focused exercise in finite-state sequential design and modulo-N counting.  This project is different from the 4-bit binary counter in the stopwatch project because it wraps at ten rather than sixteen.

## Files

| File                         | Role                          |
| ---------------------------- | ----------------------------- |
| `tenstatecounter.vhd`        | Ten-state (0–9) counter       |
| `digitdisplay.vhd`           | State-to-7-segment decoder    |
| `tenstatedisplay.vhd`        | Counter + display integration |
| `tenstatedisplay_tb.vhd`     | Simulation testbench          |
| `tenstatedisplay_constr.xdc` | Pin constraints               |

## Build & target

- **Tools:** Xilinx Vivado `2020.2`, VHDL
- **Board:** Nexys A7-100T (Artix-7, `XC7A100T`)
