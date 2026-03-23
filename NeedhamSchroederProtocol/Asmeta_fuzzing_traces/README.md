# Fuzzer Runs: Simple and Extended Scenarios

This directory contains four fuzzer runs, along with files that log execution time and memory usage. 

The configuration comprising three users and a single protocol execution represents the minimal setup. The remaining runs demonstrate the scalability of the model fuzzing approach, incorporating increased numbers of users, messages, nonces, and protocol initiations.

In all configurations, the fuzzer consistently detects the known Lowe vulnerability, including in significantly more complex scenarios.

All reported traces and execution times correspond to median values computed over 11 executions.


| Problem siza | \# Steps | Time | Memory |
| -------- | -------- | -------- | -------- |
| 3 users, 2  nonce, 5  mesages, 1 session, 32 step per run  | 436  | 9.6 s  | 654 MB   |
| 4 users, 10 nonce, 16 mesages, 2 sessions, 32 step per run   | 483   | 3.0 min  | 805 MB   |
| 5 users, 30 nonce, 50 mesages, 4 sessions, 100 step per run   |  274  |  30.3 min  | 746 MB   |
| 5 users, 36 nonce, 60 mesages, 4 sessions, 100 step per run   |  486  |   1.1 h  | 774 MB   |