# Ripple Carry Adder

A structural ripple-carry adder built from full-adder logic, with testbench and pin constraints.

## What it does

Adds two multi-bit inputs and produces their sum and carry-out, with each bit's carry rippling into the next stage.

## How it works

The adder (`ripplecarryadder.vhd`) is composed structurally: full-adder logic is chained so that the carry-out of each bit feeds the carry-in of the next. The accompanying testbench (`ripplecarryadder_tb.vhd`) uses input combinations to verify the sum and carry behavior in simulation. The constraint file (`ripplecarryadder_constr.xdc`) maps it to board I/O for physical verification. 

This project demonstrates the structural composition of arithmetic logic from a repeated primitive.

## Files

| File                          | Role                          |
| ----------------------------- | ----------------------------- |
| `ripplecarryadder.vhd`        | Structural ripple-carry adder |
| `ripplecarryadder_tb.vhd`     | Simulation testbench          |
| `ripplecarryadder_constr.xdc` | Pin constraints               |

## Build & target

- **Tools:** Xilinx Vivado `2020.2`, VHDL
- **Board:** Nexys A7-100T (Artix-7, `XC7A100T`)
