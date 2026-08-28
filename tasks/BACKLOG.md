# BACKLOG

**Status:** DRAFT

Intended order. Do not start a backlog item while it is not the active task.

The Orchestrator explicitly approved inserting the player controller implementation ahead of the greybox scale test, because the greybox validation criteria in `docs/PLAYER_MOVEMENT.md` §15 cannot be evaluated without a working player.

## Active Task

- **Define first playable area layout** — active task. **Deliverable complete (2026-08-28):** `docs/FIRST_PLAYABLE_AREA_LAYOUT.md` written (Status: DRAFT — pending Orchestrator review). Documentation/design work is complete; **no implementation of the layout has started**. This task remains active and pending Orchestrator review; do not begin production greybox or any other task — the Orchestrator will decide the implementation sequence after reviewing the layout.

## Pending

*(none — the next backlog item is the active task above)*

## Completed

- ~~Define Performance Benchmark Methodology~~ — completed and **approved by the Orchestrator** (2026-08-28). Methodology defined in `docs/PERFORMANCE_BENCHMARK.md` (Status: APPROVED): diagnostic (Mode A) vs representative (Mode B) benchmark modes, test-environment and rendering-configuration records with runtime renderer verification, Godot 4.7 `Performance` metrics (frame time primary, FPS presentation-only), session-cold vs warm passes (session-cold explicitly not first-user cache-cold), six fixed greybox viewpoints + deterministic route, statistical reporting (mean/median/worst/p95/p99 frame time), CPU/GPU diagnosis workflow, BASELINE/COMPARABLE/NON-COMPARABLE regression rules, benchmark-result template, escalation rule. `docs/PERFORMANCE_BUDGET.md` linked (methodology = HOW, budget = WHAT); all exact budgets remain DEFERRED until target hardware and the M3 representative benchmark scene exist. Orchestrator review corrections applied: `--gpu-profile` available for release execution (instrumented release runs remain diagnostic); fresh-launch runs labelled `SESSION-COLD` with a cache-cold/first-user simulation note. `project.godot` renderer-line canonicalization recorded as an unresolved hygiene observation (§17).

- ~~Build Greybox Scale Test~~ — implemented in `game/world/greybox_scale_test.tscn` (automated validation passed; scripted full-route physics walk, zero falls/stalls) and **evaluated by the Project Owner**: Human Scale 7/10, Reveal 8/10, Atrium 9/10, Instinctive Upward Look 10/10, Scale References 7/10, Skybridge Height/Depth 9/10, Megatowers 10/10, Overall MONOLITH Feeling 9/10. All M1 subjective gates **PASS**; results and refinement observations recorded in `docs/GREYBOX_SCALE_TEST.md`. The two 7/10 ratings are observations for later architecture/art refinement, not greybox defects; no geometry, player constant, FOV, movement speed, lighting, or architecture was changed in response.
- ~~Define Vertical Slice v0.1~~ — specified in `docs/VERTICAL_SLICE.md`, Orchestrator-approved as the v0.1 baseline.
- ~~Define player movement specification~~ — specified in `docs/PLAYER_MOVEMENT.md`, Orchestrator-approved as the implementation and greybox baseline.
- ~~Implement Player Controller v0.1~~ — implemented in `game/player/player.tscn` and `game/player/player_controller.gd` against the approved specification; validated (automated + manual) and approved by the Orchestrator.
