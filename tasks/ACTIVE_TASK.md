# ACTIVE TASK — Define Player Movement Specification

**Type:** Documentation / design only. No implementation.

## Goal

Fix the movement and camera constants for Vertical Slice v0.1 so that all later greybox and architectural work is authored against a single, known player.

The specification lives in `docs/PLAYER_MOVEMENT.md`.

This task closes deferred decision 1 of `docs/VERTICAL_SLICE.md` §15 and supplies the values §9.6 and §9.7 of that document declare deferred.

## Context

`docs/VERTICAL_SLICE.md` is now **APPROVED** as the baseline target for v0.1 design and implementation.

That document deliberately did not select player eye height or walking speed, but requires both to be fixed and then held stable, because architectural proportion (eye height) and perceived spatial size (speed) are authored against them. No greybox geometry may be authored until they are fixed.

**No player controller implementation is authorized by this task.** The controller is a separate, later task.

## Relevant Files

- `docs/PLAYER_MOVEMENT.md` — the deliverable
- `docs/VERTICAL_SLICE.md`
- `docs/WORLD_SCALE.md`
- `docs/ARCHITECTURE.md`
- `docs/CODING_RULES.md`
- `docs/ROADMAP.md`
- `tasks/BACKLOG.md`
- `AGENTS.md`

## Movement Philosophy

> Movement should disappear beneath the architectural experience.

MONOLITH is not a movement shooter, platformer, immersive sim, or traversal game. The controller must feel grounded, predictable, physically plausible, responsive without being twitchy, stable for sustained observation, and deliberately slower than a conventional FPS controller.

## Authoritative v0.1 Baseline

These values are Orchestrator-approved and must appear in the specification unchanged.

### Player scale

| Value | Setting | Category |
|---|---:|---|
| Reference human height | ~1.75 m (from `docs/WORLD_SCALE.md`) | Inherited |
| Camera / eye height | **1.65 m** above the standing floor | Authored scale constant |
| Standing body height | ~1.80 m | Implementation target |
| Capsule radius | ~0.32 m | Implementation target |

The 1.65 m eye height must not change casually once greybox authoring begins. Any change requires explicit Orchestrator approval, because it changes perceived architectural proportion. Collision values may take small technical adjustment if Godot behaviour requires it, provided the eye height is unchanged.

### Locomotion

| Value | Setting |
|---|---:|
| Walk speed | **2.0 m/s** |
| Ground acceleration | 8.0 m/s² |
| Ground deceleration | 10.0 m/s² |
| Sprint | None |
| Jump | None |
| Crouch | None |
| Lean / mantle / vault / climb | None |

Movement is camera-yaw-relative. Diagonal input must be normalized. No momentum system, stamina, or movement state machine.

Walk speed is validated against the 10–15 minute duration target, the ≥ 6 minute direct-route minimum, and the ~400–700 m route target. **Do not raise movement speed to compensate for a short route.** Reconsider layout distance or slice scope explicitly instead.

### Gravity and grounding

Use Godot's project/default gravity source. No airborne gameplay, no fall challenges. The controller must be stable on flat floors, realistic ramps, authored stairs, and the transitions between them.

No custom complex stair-climbing algorithm is required. For v0.1, stair visuals may use simplified hidden ramp collision where that produces more stable first-person traversal.

### Camera

| Value | Setting |
|---|---:|
| FOV | **70° vertical** (Godot `Camera3D` uses vertical FOV — state this explicitly) |
| Pitch clamp | −89° to +89° |
| Yaw | Unrestricted |
| Mouse look | Direct, no acceleration; sensitivity exported/tunable |

No head bob, camera roll, breathing sway, landing shake, speed-based FOV change, or camera inertia. Mouse sensitivity is not an architectural scale constant.

### Input

W/S/A/D move, mouse looks, Escape releases mouse capture. Later implementation must use Godot Input Map actions (`move_forward`, `move_backward`, `move_left`, `move_right`), **not created in this task**. Gamepad support deferred.

## Requirements

`docs/PLAYER_MOVEMENT.md` must contain at minimum:

1. Status
2. Purpose
3. Movement Philosophy
4. Authority / Relationship to Vertical Slice
5. Player Scale
6. Locomotion
7. Movement Parameters
8. Gravity and Grounding
9. Stair / Ramp Strategy
10. Camera
11. Input
12. Collision and Level-Authoring Implications
13. Explicit Non-Goals
14. Implementation Constraints
15. Greybox Validation Criteria
16. Deferred Decisions

It must use specification language rather than marketing prose, and must not contradict `AGENTS.md`, `docs/VERTICAL_SLICE.md`, or `docs/WORLD_SCALE.md`.

### Explicit non-goals to exclude

sprint, jump, crouch, prone, mantle, vault, climbing, wall-running, sliding, dashing, leaning, stamina, parkour, movement upgrades, movement abilities, camera shake systems, head bob, movement-based FOV effects, third-person mode, complex footstep systems, and complex stair-solving unless measured evidence later requires it. No speculative architecture for any of them.

### Implementation constraints to document (not implement)

A future controller lives under `game/player/` and stays minimal: `CharacterBody3D` root, standing `CollisionShape3D`, camera/pitch pivot, `Camera3D`, one focused controller script. No autoload, no global event bus, no generic ability system, no state machine unless behaviour requires one, no plugin or third-party controller. Typed GDScript with exported properties for designer tuning.

### Level-authoring implications to document

Floors authored against 1.65 m eye height; doors and railings must read correctly at that height; corridor width must comfortably accommodate the capsule; no route segment may require an excluded mechanic; stairs and ramps traversable at walking speed; vista framing evaluated at the canonical height and FOV; route timing evaluated at 2.0 m/s.

> The level adapts to the approved player scale — not the other way around.

## Constraints

- Documentation only.
- Do not implement the player controller.
- Do not create Godot scenes, scripts, or Input Map actions.
- Do not begin the greybox.
- Do not add assets, plugins, or dependencies.
- Do not modify anything under `game/`, or `project.godot`.
- Do not change renderer or project settings.
- Do not invent additional major milestones or features.
- Do not advance this file to the next task; that happens only after Orchestrator review.

## Acceptance Criteria

- `docs/PLAYER_MOVEMENT.md` exists and contains all sixteen required sections.
- All authoritative baseline values above appear exactly: 1.65 m eye height, ~1.80 m body height, ~0.32 m radius, 2.0 m/s walk, 8.0 m/s² acceleration, 10.0 m/s² deceleration, 70° vertical FOV, −89°/+89° pitch.
- The document states explicitly that 70° is **vertical**, not horizontal.
- The authored camera-height constant is clearly distinguished from collision-shape implementation targets.
- Sprint, jump, crouch, and all other excluded mechanics are explicitly excluded with reasons.
- The document forbids compensating for route length by raising movement speed.
- Level-authoring implications of the constants are stated explicitly.
- Ten or more objective greybox validation criteria are defined, with a rule requiring single-variable failure reporting.
- Implementation philosophy is described without any implementation being performed.
- Deferred decisions are separated from decided values.
- The document does not contradict `AGENTS.md`, `docs/VERTICAL_SLICE.md`, or `docs/WORLD_SCALE.md`.
- Nothing under `game/` and no project configuration has changed.

## Validation Requirements

Report:

- all changed and created files
- confirmation of no contradiction with `AGENTS.md`, `docs/VERTICAL_SLICE.md`, `docs/WORLD_SCALE.md`, `docs/ARCHITECTURE.md`, `docs/CODING_RULES.md`
- `git status`, `git diff`, and `git diff --check` inspection
- confirmation that no game files or project configuration were modified
- any documentation conflicts found, reported rather than silently resolved

## Gate

**The greybox scale test must not begin until this specification has been reviewed by the Orchestrator.** Greybox geometry authored against unapproved movement constants would have to be re-authored if the constants changed.
