# Flip-Flop-Counter-Build # Smart 4-Bit Up/Down Counter using Verilog HDL

## CodeTech VLSI Internship
## Intern id:- CITS6509

### Project Overview
This project implements a **Flip-Flop-Counter-Build** using **Verilog HDL**. The design is based on D Flip-Flops and supports both incrementing and decrementing operations. The counter includes **clock enable**, **active-low reset**, and **terminal count detection** for efficient digital counting applications.

A Verilog testbench is provided to verify the functionality of the counter under different operating conditions.

---

## Features

- 4-bit synchronous Up/Down Counter
- D Flip-Flop based implementation
- Clock Enable (Count Enable) control
- Active-Low Reset (`rst_n`)
- Up and Down counting modes
- Terminal Count detection
- Comprehensive Verilog Testbench

---

## Repository Contents

| File | Description |
|------|-------------|
| `counter_design.v` | Verilog source code for the  Flip-Flop-Counter-Build |
| `tb_counter_design.v` | Testbench used to verify the counter functionality |

---

## Inputs

- **clk** – System clock
- **rst_n** – Active-low reset
- **count_en** – Counter enable signal
- **dir_up_down** – Counting direction (`1 = Up`, `0 = Down`)

## Outputs

- **count_out[3:0]** – Current counter value
- **terminal_count** – Indicates terminal count (1111 while counting up or 0000 while counting down)

---

## Working Principle

1. The counter is initialized using the active-low reset (`rst_n`).
2. When `count_en = 1`, the counter updates on every rising edge of the clock.
3. If `dir_up_down = 1`, the counter increments from **0000** to **1111**.
4. If `dir_up_down = 0`, the counter decrements from **1111** to **0000**.
5. The `terminal_count` output becomes active when the counter reaches its maximum or minimum value depending on the counting direction.

---

## Simulation

The testbench verifies:

- Reset operation
- Up-counting functionality
- Down-counting functionality
- Count Enable operation
- Terminal Count detection

---

## Tools Used

- Verilog HDL
- ModelSim / Vivado Simulator / Icarus Verilog (or any compatible Verilog simulator)

---

## Applications

- Digital timers
- Frequency dividers
- Event counters
- Sequence generators
- Embedded and FPGA-based digital systems

---
