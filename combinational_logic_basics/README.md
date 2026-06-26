# Combinational Logic Basics

Foundational combinational building blocks, each independently simulated and constrained, are then integrated in a top module. (Originally ECE238 Lab 3.)

## What it does

Implements and demonstrates the core combinational components of basic gates, a multiplexer, and a 7-segment display decoder tied together in a top-level design.  A constraints file maps to the board's switches, buttons, and display.

## How it works

Each block is written as its own entity with a matching testbench and constraint file, then composed:

- **`gates.vhd`** - computes 8 gate functions from inputs A and B.
- **`multiplexer.vhd`** - an 8-to-1 multiplexer where a 3-bit selector picks one of the 8 gate outputs.
- **`DisplayDecoder.vhd`** - a 1-bit decoder that lights one of two fixed 7-segment patterns based on the selected bit.
- **`Lab3_Top/Lab3_top.vhd`** - top module that integrates the blocks and connects them to board I/O.

The structure reflects the standard digital-design workflow: build a component, simulate it against a testbench, constrain it to physical pins, then reuse it inside a larger design.

## Files

| File                                         | Role                      |
| -------------------------------------------- | ------------------------- |
| `gates.vhd` (+ `_tb`, `_constr`)             | Basic logic gates         |
| `multiplexer.vhd` (+ `_tb`, `_constr`)       | Multiplexer               |
| `DisplayDecoder.vhd` (+ `_tb`, `_constr`)    | 1-bit two-pattern 7segment decoder |
| `Lab3_Top/Lab3_top.vhd` (+ `_tb`, `_constr`) | Top-level integration     |

## Build & target

- **Tools:** Xilinx Vivado `2020.2`, VHDL
- **Board:** Nexys A7-100T (Artix-7, `XC7A100T`)
