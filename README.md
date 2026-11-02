# Microprocessors & Computer Architecture Coursework (Semester 4)

Comprehensive collection of ARMv7 assembly programming, RISC-V signal processing architectures, Keil uVision simulator traces, and instruction set architecture (ISA) exercises from the Microprocessors and Computer Architecture curriculum (UE24CS242A) at PES University.

---

## 📌 Course Progression Overview

```
MPCA Coursework
├── Level 1: Core Labs (ARMv7 Assembly in Keil uVision)
│   ├── Week 01–04: Foundations, Register Files & Data Transfer (LDR/STR/MOV)
│   ├── Week 05: Addressing Modes (Pre/Post-Indexing & Auto-Indexing)
│   ├── Week 06: Full Descending Stack Operations (STMFD/LDMFD & PUSH/POP)
│   └── Week 07: Subroutine Linkage & AAPCS Calling Conventions (BL/BX LR)
├── Level 2: Orange Project (RISC-V Signal Stability & Spike Analysis)
│   └── RISC-V RV32I Assembly (RARS Simulator & Performance Traces)
└── Level 3: Jackfruit Final Project (Smart Hardware Automation on Arduino Uno)
    └── (Dedicated Repository: smart-washroom-system-mpca)
```

---

## 📂 Repository Contents

### 🔹 [Level 1: Core Labs (ARMv7 Assembly)](./Level-1-Labs/)

* **[Week-01-to-04: ARM Foundations & Arithmetic Logic](./Level-1-Labs/Week-01-to-04-ARM-Foundations/)**:
  * Register file layout (`R0`–`R15`, `CPSR`), Barrel Shifter integration, and Condition Flags (`N`, `Z`, `C`, `V`).
  * `lab1-13-1-26.S`: Direct data transfer, immediate loads, and memory addressing.
  * `lab2-20-1-26.S`: Arithmetic (`ADD`, `SUB`, `ADC`, `SBC`) and logical bit manipulation (`AND`, `ORR`, `EOR`, `BIC`).
  * `lab3-27-1-26.S`: Conditional branching, loops, and comparisons (`B`, `BEQ`, `BNE`, `CMP`, `TST`).
  * Standalone Demos: `evensum.s` (even number summation), `ldmia.S` (Load Multiple Increment After), `LOAD.S`, `new.s`.
  * Deliverables: Submission report `PES1UG24CS493.pdf`, question docx, and 17 Keil uVision simulation output captures.

* **[Week-05: Addressing Modes & Memory Indexing](./Level-1-Labs/Week-05-ARM-Addressing-Modes/)**:
  * Empirical study of ARM addressing modes: Immediate, Register Indirect, Pre-indexed with writeback (`[Rn, #offset]!`), and Post-indexed (`[Rn], #offset`).
  * `lab4-3-2-26.S`: Array traversal and dynamic pointer stepping.
  * Deliverables: Submission report `PES1UG24CS493_WEEK5_I.pdf` and 5 Keil debugger memory dump screenshots.

* **[Week-06: Stack Architectures & Data Preservation](./Level-1-Labs/Week-06-ARM-Stack-Operations/)**:
  * Stack data structures: Full Descending (FD) stack model standard in ARM (`SP` decrements on push).
  * `lab5-10-2-26.S`: Multiple register store/load operations (`STMFD` / `LDMFD`) and register context switching.
  * Deliverables: Submission report `PES1UG24CS493.pdf` and 7 Keil stack memory view captures.

* **[Week-07: Subroutine Linkage & Calling Conventions](./Level-1-Labs/Week-07-ARM-Subroutines-and-Functions/)**:
  * Procedure Call Standard for the ARM Architecture (AAPCS).
  * Parameter passing via `R0`–`R3`, return values in `R0`, callee-saved registers (`R4`–`R11`).
  * `lab6-17-2-26.S`: Nested subroutine calls using `BL` (Branch with Link) and return via `BX LR` (`POP {PC}`).
  * Deliverables: Submission report `PES1UG24CS493.pdf` and 4 simulation execution captures.

---

### 🍊 [Level 2: Orange Project (RISC-V Signal Processing)](./Level-2-Orange/RISC-V-Signal-Processing/)

* **Source Files**: [`riscv1.asm`](./Level-2-Orange/RISC-V-Signal-Processing/riscv1.asm) and [`riscv2.asm`](./Level-2-Orange/RISC-V-Signal-Processing/riscv2.asm).
* **Architecture**: RISC-V RV32I base integer instruction set simulated in RARS.
* **Algorithm**:
  * Signal Stream Processing: Parses an $N$-element real-time signal stream.
  * Stability Verification: Identifies stable elements within bounds $[-5, 5]$.
  * Anomaly Identification: Computes net deviation, detects negative drop points, and marks the index of peak high-frequency spikes ($> 10$).
* **Deliverables**: Comprehensive submission report `PES1UG24CS493.pdf`, assignment specification PDFs, and RARS execution proof captures.

---

### 🍈 Level 3: Jackfruit Final Project (Smart Hardware Automation)
* 🔗 **Dedicated Repository**: [**`Tanmayi-n14/smart-washroom-system-mpca`**](https://github.com/Tanmayi-n14/smart-washroom-system-mpca)
* Embedded automation & safety system running on Arduino Uno: Ultrasonic occupancy detection, touchless IR tap, MQ gas leakage alarm, resistive water flood sensing, and I2C LCD priority display.

---

## 🛠️ Toolchains & Simulators

* **ARM Simulator**: Keil $\mu$Vision 5 (ARMv7-M / Cortex-M series).
* **RISC-V Simulator**: [RARS (RISC-V Assembler and Runtime Simulator)](https://github.com/TheThirdOne/rars) supporting the RV32I ISA.

---

## 👤 Author
* **Tanmayi Nagabhairava** ([@Tanmayi-n14](https://github.com/Tanmayi-n14)) — `PES1UG24CS493`
* Department of Computer Science & Engineering, PES University
