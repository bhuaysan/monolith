# BACKLOG

**Status:** DRAFT

Intended order. Do not start a backlog item while it is not the active task.

The Orchestrator explicitly approved inserting the player controller implementation ahead of the greybox scale test, because the greybox validation criteria in `docs/PLAYER_MOVEMENT.md` §15 cannot be evaluated without a working player.

## Active Task

- **Define Performance Benchmark Methodology** — now `tasks/ACTIVE_TASK.md`. Documentation/design only: metrics, measurement procedure, reference workloads, target-hardware question, budget structure, regression practice, escalation rule. Final numeric budgets stay deferred where prerequisites (target hardware, M3 benchmark scene) are unresolved.

## Pending

1. Define first playable area layout

## Completed

- ~~Build Greybox Scale Test~~ — implemented in `game/world/greybox_scale_test.tscn` (automated validation passed; scripted full-route physics walk, zero falls/stalls) and **evaluated by the Project Owner**: Human Scale 7/10, Reveal 8/10, Atrium 9/10, Instinctive Upward Look 10/10, Scale References 7/10, Skybridge Height/Depth 9/10, Megatowers 10/10, Overall MONOLITH Feeling 9/10. All M1 subjective gates **PASS**; results and refinement observations recorded in `docs/GREYBOX_SCALE_TEST.md`. The two 7/10 ratings are observations for later architecture/art refinement, not greybox defects; no geometry, player constant, FOV, movement speed, lighting, or architecture was changed in response.
- ~~Define Vertical Slice v0.1~~ — specified in `docs/VERTICAL_SLICE.md`, Orchestrator-approved as the v0.1 baseline.
- ~~Define player movement specification~~ — specified in `docs/PLAYER_MOVEMENT.md`, Orchestrator-approved as the implementation and greybox baseline.
- ~~Implement Player Controller v0.1~~ — implemented in `game/player/player.tscn` and `game/player/player_controller.gd` against the approved specification; validated (automated + manual) and approved by the Orchestrator.
