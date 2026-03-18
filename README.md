# Artifact for "Fuzzing Executable ASMETA Models"

This repository contains the artifact for the paper: "Fuzzing executable ASMETA models", to appear in the 12th International Conference on Rigorous State Based Methods ([ABZ 2026](https://abz-conf.org/site/2026/)).
The artifact includes code, benchmarks, and instructions to reproduce the results.

## Content

This repository contains two main folders:

- `NeedhamSchroederProtocol`: contains the Needham-Schroeder ASMETA model and its fuzzing executions.
- `DiningPhilosophers`: contains the Dining Philosophers ASMETA model, fuzzing executions, and comparison with ASMETA-SMV model checking using both bounded and unbounded NuSMV.

Subfolders of interest:

- `Asmeta_models`: contains the ASMETA models and fuzzer implementations.
- `Asmeta_fuzzing_traces`: contains complete traces of fuzzer executions, including traces with detected assertion violations and examples demonstrating fuzzer scalability.

## Folder structure

```text
.
├─DiningPhilosophers
│ ├── Asmeta_fuzzing_tracesTimeAndMemory
│ │   ├── fuzzInvarPhil14.log
│ │   ├── fuzzInvarPhil200.log.gz
│ │   ├── fuzzInvar_time14.log
│ │   ├── fuzzInvar_time200.log
│ ├── Asmeta_models
│ │   ├── philosophers6.asm
│ │   ├── philosophers_fuzzer.asm
│ │   └── philosophers_signatureAndRules.asm
│ ├── NuSMV_BMC_SAT_tracesTimeAndMemory
│ │   ├── bmc_counterexample10.log
│ │   ├── bmc_time10.log
│ ├── NuSMV_models
│ │   ├── philosophers10.smv
│ │   ├── philosophers14.smv
│ ├── NuSMV_OBDD_tracesTimeAndMemory
│ │   ├── counterexample14.log
│ │   ├── time14.log
│ └── README.md
├─NeedhamSchroederProtocol
  ├── Asmeta_models
  │   ├── NeedhamSchroederSpy_Fuzzer.asm
  │   └── NeedhamSchroederSpy_signatureAndRules.asm
  └── Asmeta_fuzzing_traces
      ├── execTrace_3users_1handshake_2Nonces5Messages_32stepPerRun.txt
      ├── execTrace_4users_2handshakes_10Nonces16Messages_32stepPerRun.txt
      ├── execTrace_5user_4handshakes_30Nonces50Messages_100stepPerRun.txt
      ├── execTrace_5user_4handshakes_36nonces60Messages_100stepPerRun.txt
      └── README.md

```

## How to run ASMETA

You can download the ASMETA Eclipse environment to run `.asm` files here: [ASMETA GitHub](https://github.com/asmeta/asmeta).

References, documentation, and tutorials for ASMETA are available at: [ASMETA User Documentation](https://asmeta.github.io/userdoc.html)
