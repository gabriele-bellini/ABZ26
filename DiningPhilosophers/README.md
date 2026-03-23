# Folder Content

## Models

- `Asmeta_models` – ASMETA Dining Philosophers model and its fuzzer implementations.  
- `NuSMV_models` – NuSMV `.smv` models automatically generated from the ASMETA model.  

## Executions

- `Asmeta_fuzzing_tracesTimeAndMemory` – fuzzer traces showing detected invariant violations; demonstrates model fuzzing scalability. It includes traces, execution time, and memory usage. 
- `NuSMV_OBDD_tracesTimeAndMemory` – results from unbounded (OBDD-based) NuSMV model checking, including traces, execution time, and memory usage.  
- `NuSMV_BMC_SAT_tracesTimeAndMemory` – results from bounded (SAT-based) NuSMV model checking, including traces, execution time, and memory usage.
