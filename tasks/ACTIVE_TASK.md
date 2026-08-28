# ACTIVE TASK — Implement Player Controller v0.1

**Type:** Implementation. Controller only. The greybox must not begin.

## Goal

Implement the smallest reliable first-person controller required to perform the upcoming Greybox Scale Test, exactly as specified in `docs/PLAYER_MOVEMENT.md`.

The objective is **not** to build a reusable FPS framework. It is one small scene and one short script.

## Context

`docs/PLAYER_MOVEMENT.md` is **Orchestrator-approved** (Status: APPROVED — implementation and greybox baseline for Vertical Slice v0.1). Its constants are binding and are not tuned by this task.

The Orchestrator explicitly approved inserting this implementation task ahead of "Build greybox scale test", because the greybox validation criteria in `PLAYER_MOVEMENT.md` §15 cannot be evaluated without a working player.

**Only the minimal controller is authorized.** The Greybox Scale Test is the next task and must not begin here.

## Relevant Files

- `docs/PLAYER_MOVEMENT.md` — the approved specification; authority for every constant
- `game/player/player.tscn` — player scene
- `game/player/player_controller.gd` — controller script
- `game/debug/player_movement_sandbox.tscn` — development-only verification scene
- `project.godot` — Input Map actions only
- `docs/VERTICAL_SLICE.md`, `docs/ARCHITECTURE.md`, `docs/CODING_RULES.md`, `AGENTS.md`

## Requirements

### Scene composition

`CharacterBody3D` root whose origin is the player's floor position, containing one `CollisionShape3D` with a `CapsuleShape3D`, a pitch pivot `Node3D`, and a `Camera3D`. No other components.

- capsule full height ≈ 1.80 m (Godot `CapsuleShape3D.height` includes the hemispheres)
- capsule radius ≈ 0.32 m
- camera eye height exactly 1.65 m above the standing floor
- `Camera3D` vertical FOV exactly 70°

### Locomotion

Walk speed 2.0 m/s, acceleration 8.0 m/s², deceleration 10.0 m/s². No sprint, jump, crouch, lean, mantle, vault, or climb. Movement is camera-yaw-relative; pitch must not affect movement direction; diagonal input normalized; forward, backward and strafe share one speed. Horizontal acceleration operates on the velocity vector, not per axis. No movement state machine and no preparation for future abilities.

### Physics and grounding

Grounded `CharacterBody3D` movement via `move_and_slide()`, using `get_gravity()` rather than a duplicate gravity constant. No jump logic, air-control gameplay, fall damage, death, or custom step solver. Any non-default `CharacterBody3D` physics property must be reported with a reason.

### Mouse look

Unrestricted yaw on the body, pitch on the pivot only, clamped to approximately ±89°. No roll, head bob, sway, smoothing, mouse acceleration, or FOV animation. Mouse sensitivity is an exported designer-tunable property and is not a scale constant. Mouse is captured on entering the running scene; Escape releases capture for development. No pause menu, settings menu, or UI.

### Input Map

`project.godot` gains exactly four actions: `move_forward` (W), `move_backward` (S), `move_left` (A), `move_right` (D). No sprint, jump, crouch, interaction, or gamepad actions. Keys must not be hardcoded in the controller.

### Exported parameters

Walk speed `2.0`, acceleration `8.0`, deceleration `10.0`, eye height `1.65`, FOV `70.0`, plus mouse sensitivity. Exporting an authored constant does not make it freely tunable; defaults must not change in this task.

### Code quality

Typed GDScript, snake_case, focused functions, explicit typed `@onready` references, no fragile NodePaths. Movement in `_physics_process()`, mouse events in an input callback, no unnecessary `_process()`. No autoloads, event buses, character frameworks, ability systems, state machines, plugins, or external dependencies.

### Development sandbox

`game/debug/player_movement_sandbox.tscn` exists only to verify the controller. Primitive floor, wall, one ordinary ramp, one development light, and an instance of `game/player/player.tscn`. It must not become the Greybox Scale Test: no vertical slice beats, atrium, skybridge, tower geometry, vistas, environment art, lighting experiments, or production materials. It is not configured as the permanent main scene.

## Constraints

- Do not alter any constant in `docs/PLAYER_MOVEMENT.md`.
- Do not perform the Greybox Scale Test, design the four spatial beats, tune route length, or change Vertical Slice scope numbers.
- Do not implement anything from `docs/PLAYER_MOVEMENT.md` §13 Explicit Non-Goals.
- Do not stage `.godot/` cache files.

## Acceptance Criteria

- `docs/PLAYER_MOVEMENT.md` status reads `APPROVED — implementation and greybox baseline for Vertical Slice v0.1.` with no constant changed.
- `game/player/player.tscn` root is a `CharacterBody3D` with the capsule, pivot, and camera described above.
- Capsule full height ≈ 1.80 m and radius ≈ 0.32 m; any deviation is reported.
- Authored camera offset from the body origin is exactly 1.65 m; `Camera3D.fov` is exactly 70.
- Exported defaults are 2.0 / 8.0 / 10.0 / 1.65 / 70.0 plus a reported mouse-sensitivity default.
- Movement is yaw-relative, pitch-independent, and diagonal movement is not faster than forward movement.
- Gravity comes from `get_gravity()`; grounding is stable on flat floor and ramp with no loss of ground contact.
- Pitch clamps at approximately ±89°; yaw is unrestricted; no roll, bob, sway, or smoothing exists.
- Mouse is captured on scene entry and released by Escape; no UI was created.
- Exactly four movement actions exist in `project.godot`; no sprint, jump, or crouch action exists.
- The controller contains no state machine, autoload, event bus, or speculative hook for a §13 non-goal.
- `game/debug/player_movement_sandbox.tscn` loads, instances the player, and contains only primitive verification geometry.
- The project imports headlessly and the sandbox starts with no parser or runtime script errors.
- `git diff --check` is clean and no unrelated file changed.

## Validation Requirements

- `git status`, full `git diff`, and `git diff --check` inspection.
- Headless Godot project import and a short headless startup smoke test of the sandbox scene.
- Programmatic structural verification of root type, capsule dimensions, camera offset, FOV, exported defaults, and the Input Map action set.
- Headless simulation of acceleration, steady speed, deceleration, diagonal speed, wall collision, and ramp ascent/descent ground contact.
- Truthful reporting that subjective mouse feel cannot be validated headlessly and requires an interactive test by the Project Owner.

## Gate

**The Greybox Scale Test must not begin as part of this task.** It is the next backlog item and requires its own authorization.
