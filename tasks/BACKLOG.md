# BACKLOG

**Status:** DRAFT

Intended order. Do not start a backlog item while it is not the active task.

The Orchestrator explicitly approved inserting the player controller implementation ahead of the greybox scale test, because the greybox validation criteria in `docs/PLAYER_MOVEMENT.md` §15 cannot be evaluated without a working player.

## Active Task

- **Define Performance Benchmark Methodology** — delivered (`docs/PERFORMANCE_BENCHMARK.md`; `docs/PERFORMANCE_BUDGET.md` linked to it), **pending Orchestrator review**. Metrics (Godot 4.7 `Performance` monitors), measurement procedure (diagnostic vs representative modes, environment/graphics-config records, cold/warm passes), reference workloads (six fixed greybox viewpoints + deterministic route), target-hardware question (DEFERRED with proposed default), budget structure (all exact numbers DEFERRED until hardware + M3 benchmark scene), regression practice, escalation rule. "Define first playable area layout" remains gated until Orchestrator review passes.

## Pending

1. Define first playable area layout

## Completed

- ~~Build Greybox Scale Test~~ — implemented in `game/world/greybox_scale_test.tscn` (automated validation passed; scripted full-route physics walk, zero falls/stalls) and **evaluated by the Project Owner**: Human Scale 7/10, Reveal 8/10, Atrium 9/10, Instinctive Upward Look 10/10, Scale References 7/10, Skybridge Height/Depth 9/10, Megatowers 10/10, Overall MONOLITH Feeling 9/10. All M1 subjective gates **PASS**; results and refinement observations recorded in `docs/GREYBOX_SCALE_TEST.md`. The two 7/10 ratings are observations for later architecture/art refinement, not greybox defects; no geometry, player constant, FOV, movement speed, lighting, or architecture was changed in response.
- ~~Define Vertical Slice v0.1~~ — specified in `docs/VERTICAL_SLICE.md`, Orchestrator-approved as the v0.1 baseline.
- ~~Define player movement specification~~ — specified in `docs/PLAYER_MOVEMENT.md`, Orchestrator-approved as the implementation and greybox baseline.
- ~~Implement Player Controller v0.1~~ — implemented in `game/player/player.tscn` and `game/player/player_controller.gd` against the approved specification; validated (automated + manual) and approved by the Orchestrator.
