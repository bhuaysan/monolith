# ACTIVE TASK — Build Greybox Scale Test

**Type:** Implementation. Scale/composition experiment only. Production art is forbidden. No subsequent task may start before Orchestrator review.

## Goal

Build one deliberately simple playable greybox scene, `game/world/greybox_scale_test.tscn`, that lets the Project Owner judge in-engine whether MONOLITH's core architectural scale fantasy works using the approved player constants:

1. human architectural scale
2. compression
3. monumental interior scale
4. vertical perception
5. exterior megastructure scale
6. contrast between those scales

The greybox answers one question:

> Does MONOLITH already feel impressive when everything is still primitive geometry?

If not, adding art later will not solve the core problem.

## Context

- Player Controller v0.1 is **approved** (`game/player/player.tscn`, `game/player/player_controller.gd`, commit `a436c2a`), implementing the approved constants in `docs/PLAYER_MOVEMENT.md`: eye height 1.65 m, walk speed 2.0 m/s, FOV 70° vertical.
- This is a **scale/composition experiment**, not the Vertical Slice and not the 400–700 m route.
- **Production art is forbidden.** Primitive meshes, primitive collision, simple materials, basic lighting, and environment settings for readability only. No textures, decals, signage art, decorative props, neon, or detailed materials.
- Player constants must not be changed. If something reads wrong, the architecture changes — not the player.

## Relevant Files

- `game/world/greybox_scale_test.tscn` — the greybox scene (instances `game/player/player.tscn`)
- `docs/VERTICAL_SLICE.md`, `docs/PLAYER_MOVEMENT.md`, `docs/WORLD_SCALE.md`, `docs/ART_DIRECTION.md`, `docs/ARCHITECTURE.md`, `docs/PERFORMANCE_BUDGET.md`
- `tasks/BACKLOG.md`

## Requirements

### Spatial sequence (four connected zones)

- **Zone A — Human Scale:** restrained corporate interior. Ceiling ≈ 3.0 m, corridor width ≈ 2.5–3.5 m, door/opening heights 2.2–2.5 m, short sightlines. Human-scale references (door frames, railings, wall recess, bench blocks, ceiling light troughs, columns). Ordinary and controlled — must not look impressive.
- **Zone B — Compression Transition:** narrow low-ceiling passage with a turn and no early sightline into the atrium. The reveal must be delayed until the threshold.
- **Zone C — Monumental Atrium:** interior height **80 m** (within the approved 60–100 m range), footprint ~50–70 m wide × 70–100 m long. Multiple inaccessible upper floors/balconies, structural columns, elevated bridges, wall recesses, distant openings, and human-scale doors/railings near the player. Repeated vertical references (floor bands on a ~4 m module) giving at least ~15–20 readable vertical subdivisions. Deliberate reveal on entry; first instinct should be to look upward.
- **Zone D — Exterior / Megastructure Vista:** elevated observation passage/skybridge-like deck, player ~150–250 m above an implied (unplayable) ground level. At least 3 major neighbouring tower masses at ~800–1200 m, multiple distance layers, large structural silhouettes. Atmosphere/fog used for depth. The exterior must imply far more architecture than is playable.

### Constraints

- Route length ≈ 150–250 m; vista reachable in ~3–6 minutes including observation.
- No jump, crouch, or precision traversal anywhere; stairs (if visual) use simple ramp collision underneath.
- Every traversable surface has reliable simple collision.
- No gameplay systems, interaction, audio, NPCs, elevators, moving objects, UI, LOD systems, third-party assets, plugins, or M2/Architecture Kit work.
- Player scale/speed/FOV unchanged.

## Acceptance Criteria

- `game/world/greybox_scale_test.tscn` exists, imports, loads, and runs headlessly with no parser or runtime errors.
- The scene instances the approved player scene unmodified; no movement constant changed; no new gameplay Input Map action added.
- The four zones are connected and traversable with primitive geometry only.
- Atrium interior height ≈ 80 m; vista elevation ≈ 150–250 m above implied ground; at least 3 towers in the 800–1200 m range.
- Human-scale reference geometry is visible near the player in the atrium and at the vista.
- Scene is the development main scene so the Project Owner can play it directly.
- **Completion requires Project Owner manual evaluation** of the subjective scale questions below. Headless validation alone does not complete this task.

## Validation Requirements

- `git status`, full `git diff`, `git diff --check`.
- Headless Godot import, short headless smoke run of the scene, programmatic verification (player instance, constants, Input Map, zone dimensions, tower heights, route length).
- Manual play test by the Project Owner with the route notes provided in the implementation report.

## Gate

**No subsequent task may start before Orchestrator review of this task's results.** The next backlog items ("Define performance benchmark methodology", "Define first playable area layout") remain blocked until then.
