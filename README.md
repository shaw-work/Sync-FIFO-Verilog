# Synchronous FIFO in Verilog HDL

## Overview
This project implements an industry-style Synchronous FIFO (First In First Out) using Verilog HDL.

The FIFO uses a single clock for both read and write operations and supports reliable buffered data transfer between digital modules.

## Features
- 8-bit data width
- 16-depth memory
- Full flag generation
- Empty flag generation
- Read / Write pointer control
- Simultaneous read and write support
- Verified using Vivado simulation

## Tools Used
- Verilog HDL
- AMD Vivado

## Simulation Result
Waveform verifies FIFO order:

Write Data:
11, 22, 33

Read Data:
11, 22, 33

## Folder Structure
rtl/        -> FIFO RTL code  
tb/         -> Testbench  
waveform/   -> Simulation waveform screenshot

## Author
Shaw
