# ABZ26

Artifact for the ABZ 2026 submission. This repository includes code, benchmarks, and instructions to reproduce the results.

## Content

This repository contains two main folders:

- `NeedhamSchroederProtocol`: contains the Needham-Schroeder ASMETA model and its fuzzing executions.
- `DiningPhilosophers`: contains the Dining Philosophers ASMETA model, fuzzing executions, and comparison with ASMETA-SMV model checking using both bounded and unbounded NuSMV.

Subfolders of interest:

- `code`: contains the ASMETA models and fuzzer implementations.
- `fuzzingExecutionTraces`: contains complete traces of fuzzer executions, including traces with detected assertion violations and examples demonstrating fuzzer scalability.

## Folder structure

```text
.
├─DiningPhilosophers
│ ├── code
│ │   ├── philosophers6.asm
│ │   ├── philosophers_fuzzer.asm
│ │   └── philosophers_signatureAndRules.asm
│ ├── fuzzingExecutionTraces
│ │   ├── fuzzPhil9.log
│ │   ├── fuzzPhil14.log
│ │   └── fuzzPhil200.log
│ ├── NuSMV_BMC_SAT_tracesTimeAndMemory
│ │   ├── bmc_counterexample9.log
│ │   └── bmc_time9.log
│ ├── NuSMV_models
│ │   ├── philosophers14.smv
│ │   └── philosophers9.smv
│ └── NuSMV_OBDD_tracesTimeAndMemory
│     ├── counterexample14.log
│     ├── time14.log
├─NeedhamSchroederProtocol
  ├── code
  │   ├── NeedhamSchroederSpy_Fuzzer.asm
  │   └── NeedhamSchroederSpy_signatureAndRules.asm
  └── fuzzingExecutionTraces
      ├── execTrace_3users_1handshake_2Nonces5Messages_32stepPerRun.txt
      ├── execTrace_4users_2handshakes_10Nonces16Messages_32stepPerRun.txt
      ├── execTrace_5user_4handshakes_30Nonces50Messages_100stepPerRun.txt
      ├── execTrace_5user_4handshakes_36nonces60Messages_100stepPerRun.txt
      └── README.md
```

## How to run ASMETA

You can download the ASMETA Eclipse environment to run `.asm` files here: [ASMETA GitHub](https://github.com/asmeta/asmeta).

References, documentation, and tutorials for ASMETA are available at: [ASMETA User Documentation](https://asmeta.github.io/userdoc.html)
