# BACKLOG

**Status:** DRAFT

Intended order. Do not start a backlog item while it is not the active task.

1. Build greybox scale test
2. Define performance benchmark methodology
3. Define first playable area layout

The Orchestrator explicitly approved inserting the player controller implementation ahead of the greybox scale test, because the greybox validation criteria in `docs/PLAYER_MOVEMENT.md` §15 cannot be evaluated without a working player.

## Active Task

- **Implement Player Controller v0.1** — now `tasks/ACTIVE_TASK.md`, implemented in `game/player/player.tscn` and `game/player/player_controller.gd` against the approved `docs/PLAYER_MOVEMENT.md`. Minimal controller only; the greybox must not begin.

## Completed

- ~~Define Vertical Slice v0.1~~ — specified in `docs/VERTICAL_SLICE.md`, Orchestrator-approved as the v0.1 baseline.
- ~~Define player movement specification~~ — specified in `docs/PLAYER_MOVEMENT.md`, Orchestrator-approved as the implementation and greybox baseline.
