# BACKLOG

**Status:** DRAFT

Intended order. Do not start a backlog item while it is not the active task.

The Orchestrator explicitly approved inserting the player controller implementation ahead of the greybox scale test, because the greybox validation criteria in `docs/PLAYER_MOVEMENT.md` §15 cannot be evaluated without a working player.

## Active Task

- **Build Greybox Scale Test** — now `tasks/ACTIVE_TASK.md`, implemented in `game/world/greybox_scale_test.tscn` against the approved player controller and `docs/PLAYER_MOVEMENT.md` constants. Scale/composition experiment only; production art forbidden; completion requires Project Owner manual evaluation; no subsequent task starts before Orchestrator review.

## Pending

1. Define performance benchmark methodology
2. Define first playable area layout

## Completed

- ~~Define Vertical Slice v0.1~~ — specified in `docs/VERTICAL_SLICE.md`, Orchestrator-approved as the v0.1 baseline.
- ~~Define player movement specification~~ — specified in `docs/PLAYER_MOVEMENT.md`, Orchestrator-approved as the implementation and greybox baseline.
- ~~Implement Player Controller v0.1~~ — implemented in `game/player/player.tscn` and `game/player/player_controller.gd` against the approved specification; validated (automated + manual) and approved by the Orchestrator.
