# PERFORMANCE BUDGET

**Status:** DRAFT

## Initial Position

- PC is the first target.
- Graphical quality is important.
- Performance must be measured throughout development.
- Optimization should be profiler-driven.

Exact GPU, CPU, memory, and frame-time budgets will be defined after the first benchmark scene and target hardware are selected.

## Relationship to the Benchmark Methodology

Measurement methodology is defined in `docs/PERFORMANCE_BENCHMARK.md`:

- **This document defines WHAT results are acceptable** (budgets and thresholds).
- **`docs/PERFORMANCE_BENCHMARK.md` defines HOW results are measured** (benchmark modes, environment and rendering-configuration records, metrics, statistical reporting, cold/warm discipline, comparability rules).

Rules binding the two documents:

1. Budget values may only be set against measurements produced by the benchmark methodology.
2. All exact GPU, CPU, memory, and frame-time budgets remain **DEFERRED** until target hardware and a representative benchmark scene (Roadmap M3) exist; the owning decisions and prerequisites are listed in `docs/PERFORMANCE_BENCHMARK.md` §15.
3. A budget verdict is based on Mode B (representative runtime) results; diagnostic (Mode A) results explain causes only.
4. Visual quality must not be silently reduced to meet a budget; failures follow the escalation rule in `docs/PERFORMANCE_BENCHMARK.md` §13.5.
