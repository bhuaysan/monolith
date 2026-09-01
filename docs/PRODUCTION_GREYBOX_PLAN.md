# PRODUCTION GREYBOX IMPLEMENTATION PLAN

**Status:** APPROVED — implementation in progress (Orchestrator approval 2026-08-29).

**Related documents:**

- `docs/FIRST_PLAYABLE_AREA_LAYOUT.md` — **APPROVED (2026-08-29)**; the binding spatial
  authority this plan implements
- `docs/VERTICAL_SLICE.md` — parent specification and v0.1 scope bounds
- `docs/PLAYER_MOVEMENT.md` — fixed player constants and stair-collision strategy
- `docs/GREYBOX_SCALE_TEST.md` — completed M1 evidence and M1 validation method
- `docs/PERFORMANCE_BENCHMARK.md` — benchmark viewpoint types that must remain representable
- `AGENTS.md` — operating contract (authority model, validation honesty, review gates)

---

## 0. Implementation State (authoritative progress record)

| Phase | State | Commit |
|---|---|---|
| 0 — Composition Skeleton | APPROVED | `9acbe2b` |
| 1 — Corporate Access | APPROVED | `b2c9e80` |
| 2 — Monumental Atrium | APPROVED | `156809e` |
| 3 — Elevated Transition | IMPLEMENTED — pending Project Owner review | `71dce7b` |
| 4 — Final Vista | LOCKED — not authorized | — |
| 5 — Full Route Integration | LOCKED — not authorized | — |

- Implementation **never auto-advances**: a phase's state changes only by explicit
  Orchestrator / Project Owner decision, and each phase begins only after the previous
  phase's stop/review gate (§4–§9 "Gate") is lifted.
- **Phase 4 is not authorized** until Phase 3 passes its Project Owner review gate. The
  Phase 3 implementation report exists, but the required human playthrough has not yet
  passed. Phases 4 and 5 remain LOCKED.
- Phase 3 moved one Phase-0 boundary under explicit Orchestrator approval; see §3.1 for
  the amendment and the frozen downstream seam it created.

---

## 1. Purpose and Authority

This plan converts the approved First Playable Area Layout into an executable
implementation plan for the **production greybox**: the complete ~692 m four-beat route
built from primitive geometry, playable end to end, with every benchmark location
representable.

It is a **process plan, not a spatial design**. All spatial decisions — route structure,
distances, elevations, areas, reveal sequencing, atrium scale, skybridge orientation, vista
framing — are already decided in the approved layout document. Where this plan restates
figures, they are inherited from that document and must not be altered by implementation
agents.

**Core decomposition rule (binding):**

> The ~692 m slice is never built in one agent task.

Implementation is decomposed into **six phases (0–5)**. Each phase is a separate,
independently reviewable agent task with its own deliverables, acceptance criteria,
validation requirements, and commit. Each phase **stops for Orchestrator review before the
next phase begins**. No phase may start until the previous phase's gate is lifted, and no
phase may begin until the Orchestrator approves this plan.

---

## 2. Global Rules (apply to every phase)

These rules hold across all phases. A phase that violates them does not pass its gate.

1. **Player unchanged.** The approved player scene (`game/player/player.tscn`,
   `game/player/player_controller.gd`) is reused as-is. No change to any player constant
   (1.65 m eye height, 2.0 m/s walk, 70° vertical FOV, no sprint/jump/crouch). Each phase
   verifies these constants are untouched.
2. **Primitive geometry only.** `MeshInstance3D` / `StaticBody3D` / `CollisionShape3D`
   with simple flat dev materials for readability. No production materials, textures, or
   meshes.
3. **No new systems.** No gameplay scripts merely to construct static geometry, no
   autoloads, no event buses, no procedural level generation, no architecture-kit
   abstractions, no plugins, no new gameplay or traversal mechanics.
4. **No continuous processing.** No nodes with `_process()`/`_physics_process()` beyond
   what the existing player already runs.
5. **Stairs.** Where steps are used, visual steps over hidden ramp collision
   (`docs/PLAYER_MOVEMENT.md` §9), authored gradients **≤ ~17°**. Player movement is never
   modified to make stairs work.
6. **Historical scene untouched.** `game/world/greybox_scale_test.tscn` remains the
   historical M1 validation scene. It is never overwritten, repurposed, or deleted.
7. **Layout budgets are targets, not hard constants.** Route lengths, areas, and
   elevations are measured in-engine and reported. Where a measurement conflicts with the
   layout, the conflict is reported to the Orchestrator — never silently resolved. The
   Phase 5 timing gate (§9) is the only measurement with a hard stop-and-escalate rule.
8. **Scope discipline.** No phase implements backlog ideas, art production, lighting
   design, audio, interaction, UI, or benchmark tooling. Polished depth > feature breadth
   applies to greyboxing too: a phase is done when its beat is structurally complete and
   measurable, not decorated.

---

## 3. Scene Architecture

Recommended structure:

```text
game/world/first_playable/
    first_playable.tscn      # composition root
    beat_1_access.tscn       # Beat 1 — Corporate Access
    beat_2_atrium.tscn       # Beat 2 — Monumental Atrium
    beat_3_skybridge.tscn    # Beat 3 — Elevated Transition
    beat_4_vista.tscn        # Beat 4 — Final Vista
```

Rules:

- **Composition over monolith.** One beat per scene; no single gigantic `.tscn`. Each
  beat scene is instanced exactly once inside `first_playable.tscn`.
- **Boundary contract.** Phase 0 defines and documents each beat-to-beat boundary
  (matching portal frames / floor seams) as explicit scene-local transforms. These
  transforms are **frozen** after Phase 0; later phases must not move a boundary without
  Orchestrator approval, because every downstream beat aligns to it.
- **Player placement.** The player is instanced **once**, in `first_playable.tscn`, at
  the Beat 1 spawn position. Beat scenes contain no player.
- **Shared environment.** One `WorldEnvironment` plus a minimal development lighting
  strategy (single `DirectionalLight3D`, modest ambient) live in the composition root —
  simple enough to see geometry and read silhouettes, explicitly marked as development
  lighting, not designed lighting. Beat scenes must not carry their own
  environment/lighting systems.
- **Beat independence.** Each beat scene must load and stand alone (its own collision,
  geometry, and any locally needed visual structure), so a beat can be reviewed in
  isolation.

### 3.1 Boundary-contract amendment — Phase 3 (Orchestrator-approved)

The rule above stands. Phase 3 is the one recorded exception, moved under explicit
Orchestrator approval: the Phase-0 Beat3→Beat4 endpoint represented placeholder-scale
Beat-3 geometry and could not accommodate the approved ~185 m production route.

**Frozen Beat2 → Beat3 seam — unchanged:**

```text
Beat2 Exit global / Beat3 Entry global
origin: (-32.5, 166, -92)
basis rows: (0,0,1) (0,1,0) (-1,0,0)
```

This seam remains unchanged and frozen.

**Historical Phase-0 Beat3 → Beat4 seam — superseded:**

```text
origin: (-72.5, 166, -62)
```

This was technically aligned at Phase 0, but it represented the placeholder-scale
Beat-3 route. It is superseded by the production seam below and must not be reused.

**Phase-3-authorized production seam:**

```text
Beat3 Exit local
origin: (-31, 0, -153)
basis rows: (0,0,1) (0,1,0) (-1,0,0)

Beat3 Exit global / Beat4 Entry global
origin: (-185.5, 166, -61)
basis rows: (-1,0,0) (0,1,0) (0,0,-1)

Beat4 instance transform (first_playable.tscn)
Transform3D(-1, 0, 0, 0, 1, 0, 0, 0, -1, -185.5, 166, -61)
```

Explicitly:

- Beat4's basis/orientation was **unchanged**, and `beat_4_vista.tscn` itself was
  **not modified**. Only the Beat4 composition-instance origin moved rigidly in
  `first_playable.tscn`.
- The new Beat3 Exit == Beat4 Entry seam is the **frozen downstream baseline** for
  Phase 4 and later work. Future agents must not move it without new Orchestrator
  approval.
- This amendment changes no approved layout dimensions and no route; the ~185 m Beat-3
  budget and all §8 figures stand.

---

## 4. Phase 0 — Composition Skeleton

**Goal:** prove scene composition, transforms, origins, player spawn, and beat-to-beat
alignment **before** any detailed geometry exists.

### Deliverables

- `game/world/first_playable/first_playable.tscn` — composition root
- Four independently instanced beat scenes, each a minimal placeholder volume (simple
  enclosing geometry + collision + the boundary frames):
  - `beat_1_access.tscn`
  - `beat_2_atrium.tscn`
  - `beat_3_skybridge.tscn`
  - `beat_4_vista.tscn`
- The approved player instance at the Beat 1 spawn
- Simple shared `WorldEnvironment` / development lighting strategy in the root
- The documented **boundary transform contract** (each portal frame's position, size, and
  orientation, recorded in the scene structure and in the task report)

### Requirements

- Functional scene hierarchy only — placeholder blockout volumes, no production art.
- Beat boundaries overlap-seam: adjacent portal frames must share exact position/size so
  there is no gap or visible seam a player could fall into or see through.
- Spawn position inside Beat 1, grounded, facing the route direction.

### Acceptance

- All five scenes load headlessly and instantiate without parser/runtime errors.
- The root composition loads with the player present and grounded at spawn.
- Player constants unchanged (verified against `docs/PLAYER_MOVEMENT.md`).
- No overlap or gap at beat boundaries; the player can walk from Beat 1's exit frame
  through Beats 2–4's entry frames in placeholder geometry.
- No new gameplay systems, no autoloads, no plugins.

### Validation

- Godot headless import + scene load/instantiate of all five scenes.
- Parser/runtime error check (clean output).
- Player constant verification.
- Walk-through of the placeholder chain (manual or scripted straight-line check across
  each boundary).
- `git diff --check`; diff and status review.

### Commit

`feat: scaffold first playable greybox`

### Gate

Stop for Orchestrator review before Phase 1.

---

## 5. Phase 1 — Beat 1: Corporate Access

**Goal:** implement only Beat 1 to the approved layout. Beat 1 establishes the human-scale
baseline; everything monumental later depends on it reading correctly first.

### Targets (from the approved layout, §6 / §14)

- Route ~147 m centerline; floor area ~635 m²; floor at **152 m**.
- Subspaces 1a–1e: arrival vestibule → access lobby → dog-leg corridor → transfer
  corridor → compression run.
- Ends in the **1.6 × 2.5 m reveal opening** (or an equivalent approved human-scale
  threshold) with the baffle mechanism behind it.

### Requirements

- **No atrium visibility** anywhere in Beat 1 — no sightline through the reveal opening
  until it is crossed (the M1 mechanism: the ~4 m structural baffle just inside).
- **No exterior or tower visibility.** No exterior glazing; no megatower silhouettes.
- Implement the approved **Human Scale 7/10 refinements** as geometry/positions, not
  decoration:
  - doors/openings **2.2–2.5 m** at a regular rhythm (roughly every 8–12 m of corridor);
  - ceiling bays with a legible ~3 m service-grid rhythm;
  - a reception-sized block at **1.05–1.10 m** working height in the lobby (1b);
  - seating/reference blocks (bench-height ~0.45 m) in the lobby and corridor widening;
  - structural bays at a **5–6 m** rhythm readable along the corridors;
  - signage **positions** at ~1.5–1.7 m centre at each turn decision point (blank plates —
    layout positions only, no content).
- Ceilings 2.8–3.5 m per subspace; compression run at 2.2 m width / 2.6 m ceiling.

### Acceptance

- Measured route centerline near **~147 m** (reported, not assumed).
- Continuous collision along the whole beat; no gaps, no stuck geometry.
- Human-scale references are visible and legible at walking pace.
- The player cannot see Beat 2 or any exterior from anywhere in Beat 1, including through
  the reveal opening.
- The Project Owner can play this beat independently (spawn → reveal door).

### Validation

- Standard phase validation (§10): headless import, scene load, error check, player
  constants, collision/traversal check of the full beat, `git diff --check`, diff/status
  review.
- Route centerline measurement via M1-style scripted physics walk of Beat 1.

### Commit

`feat: greybox corporate access`

### Gate

**Stop/review gate.** Orchestrator review (and Project Owner play-through of the beat)
before Phase 2.

---

## 6. Phase 2 — Beat 2: Monumental Atrium

**Goal:** implement only Beat 2 after Phase 1 approval. This is the slice's monumental
core and the first reveal; it must reproduce the M1-proven experience at the approved
scale.

### Targets (from the approved layout, §7 / §14)

- Route ~255 m; traversable area ~1,150 m²; footprint **80 × 64 m**; clear height
  **80 m**; floor 152 m.
- Subspaces 2a–2g: reveal apron → east promenade → column causeway (over the railed
  ~6 m light well) → pier passage (compression pulse) → north stair (+14 m) → egress
  gallery (166 m) → compressed egress portal (northwest corner).

### Requirements

- **Full-height reveal:** crossing the reveal door exposes the full 80 m clear height at
  once (§7.4 of the layout); nothing hangs low over the entry axis.
- Preserve the M1 scale language (§7.2): wall bands on the 4 m module, six inaccessible
  balconies at 12/24/36/48/60/72 m, two inaccessible bridges (~20 m, ~45 m), four
  full-height columns on plinths, upper glazing/openings, mullioned roof glazing.
- Strong nearby human-scale references per §7.5 — at the reveal position, a human-scale
  object within ~5–10 m (planter + 1.10 m rail, bench, 2.4 m service door).
- Two meaningfully different viewing elevations: floor route at 152 m; egress gallery at
  166 m looking back south across the volume.
- Inaccessible architecture (balconies, bridges, upper galleries) is authored visible but
  **never reachable** — closed collision, no traversable path onto it.
- **Stairs:** visual steps over hidden ramp collision; total rise 14 m across two ~7 m
  flights with a mid landing; authored gradient **≤ ~17°**. Do **not** change player
  movement.

### Acceptance

- The full 80 m reveal reads from the entry threshold (owner check).
- The complete 2a–2g traversal works at 2.0 m/s walking only — no jump, no stall, no
  fall.
- Measured route and elevation profile approximately match the approved spec (reported).
- Inaccessible architecture is verified inaccessible (attempted traversal fails safely).
- Project Owner review before continuing.

### Validation

- Standard phase validation (§10) plus scripted physics traversal of the full beat
  (2a–2g) with zero falls/stalls, per the M1 validation approach.
- Gradient verification of the north stair ramp (≤ ~17°).

### Commit

`feat: greybox monumental atrium`

### Gate

Stop/review gate before Phase 3.

---

## 7. Phase 3 — Beat 3: Elevated Transition

**Goal:** implement only Beat 3 after Phase 2 approval. Converts interior monumentality
into exterior scale — and, critically, **withholds the final vista**.

### Targets (from the approved layout, §8 / §14)

- Route ~185 m; area ~1,070 m²; deck at **166 m**.
- Subspaces 3a–3d: ~15 m bridge approach → **130 m × ~6 m skybridge** → ~18 m structural
  transfer node (90° bend south) → ~22 m receiving gallery.

### Requirements

**Exterior illusion (greybox-appropriate, no production art):**

- Near structural frames / mullions at the ~4 m rhythm for continuous parallax
  (M1-proven); two or three full-height pylons.
- Visible depth below: host tower flank falling away, lower complex roofs, the lower
  crossing bridge ~60 m below, cloud/haze truncation.
- Near/mid/far architectural layers; **partial non-hero** distant silhouettes only.
- Surrounding complex geometry sufficient to sell height — the bridge must not feel like
  an empty featureless tunnel.

**Critical composition rule (binding):**

> THE FINAL HERO TOWER COMPOSITION MUST REMAIN WITHHELD.

- The bridge's dominant view runs **west**; the north side is closed by the destination
  flank with full-height ~4 m structural frames for the entire span (§8.3 of the layout).
- The transfer node's 90° southward bend and the receiving gallery must support the later
  **~90° composition reorientation** before Beat 4's reveal.
- Looking back east (host tower flank, atrium exterior) is allowed; the hero composition
  is not.

### Acceptance

- The height/depth effect survives greybox geometry (owner check at bridge mid-span).
- The bridge does not feel like an empty featureless tunnel.
- The final hero composition is **not visible** from any point of Beat 3 (verified from
  the full bridge traverse and both transfer-node angles).
- No fall/traversal mechanics required; the player cannot leave the bridge or node.
- Project Owner review before continuing.

### Validation

- Standard phase validation (§10) plus scripted physics traversal of 3a–3d.
- Visibility check of the hero bearing from multiple bridge positions (recorded).

### Commit

`feat: greybox elevated transition`

### Gate

Stop/review gate before Phase 4.

---

## 8. Phase 4 — Beat 4: Final Vista

**Goal:** implement only Beat 4 after Phase 3 approval. The climax and endpoint — the
strongest composition in the entire slice.

### Targets (from the approved layout, §9 / §14)

- Route ~105 m; area ~860 m²; floors 166 m → **172 m** overlook via a broad ~+6 m stair
  (≈17°, hidden ramp collision).
- Subspaces 4a–4d: receiving corridor (darkens/compresses) → terminal concourse → framed
  threshold (~6 m slit-like opening) → observation chamber.

### Requirements

- **Withholding:** Beat 4 conceals the hero view until the framed threshold — receiving
  corridor darkens, concourse holds the player with its back to the hero direction, the
  framed threshold is the last chokepoint (§9.2).
- **Exterior (primitive masses/crowns are sufficient — do not invent production tower
  art):**
  - the strongest composition in the slice: **3+ depth layers** (near ~100–300 m,
    mid ~500–900 m, far ~1,300–2,000 m);
  - multiple **800–1200 m megastructure masses** north/northwest;
  - large vertical continuation above and below the player;
  - atmospheric depth and a cloud/haze layer below;
  - architecture continuing past the frame edges.
- **Human-scale foreground anchors in the same frame:** 1.10 m overlook rail, seating
  blocks (~0.45 m), floor bands, a 2.4 m side door.
- Endpoint behaviour: the player **cannot progress beyond the overlook rail**; formal
  session termination remains deferred (`VERTICAL_SLICE.md` §15.2) — no end-screen or
  trigger work.

### Acceptance

- Beat 4 withholds the full vista until its intended threshold.
- The final reveal reads **stronger than Beat 3** (escalation rule, §12 of the layout).
- The player cannot progress beyond the endpoint.
- Project Owner review.

### Validation

- Standard phase validation (§10) plus scripted physics traversal of 4a–4d including the
  +6 m stair (zero falls/stalls).
- Visibility check: no hero vista visible from 4a/4b/4c before the threshold.

### Commit

`feat: greybox final vista`

### Gate

Stop/review gate before Phase 5.

---

## 9. Phase 5 — Full Route Integration and Measurement

**Goal:** only after Beats 1–4 individually pass — connect and validate the complete
route, and produce the measurements the layout requires.

### Tasks

1. Connect the complete route; verify seam-free beat boundaries in the playable build.
2. Verify **no unintended shortcuts** (collision audit along the route edges; every beat
   reachable only through its designed sequence).
3. Verify the **visual withholding rules** end to end (Beat 1: no atrium/exterior;
   Beat 2: no hero towers; Beat 3: no hero composition; Beat 4: no vista before the
   threshold).
4. Verify the six **benchmark viewpoint equivalents** of the layout §17 are present and
   representable (Access lobby, Reveal apron, Column causeway, Reveal apron upward,
   Skybridge mid-span, Observation chamber).
5. Measure the actual traversable centerline/path of the full route.
6. Perform **scripted/automated physics traversal using the real player** (the M1
   validation method): spawn → overlook rail, walking only.
7. Record the **direct traversal duration**.
8. Record the **optional-route duration separately** (O1 + O2 pockets).
9. Confirm floor-area and elevation budgets where measurable; report all measurements
   against the layout budgets (§14 of the layout).

### Critical timing gate

The approved layout records an unresolved arithmetic tension: **~692 m at 2.0 m/s ≈
5:46** pure centerline, below the `VERTICAL_SLICE.md` §3 requirement of **≥ 6:00 direct
traversal**. The complete in-engine route **must** be measured — the M1 precedent
(centerline ≈ 0.5% short of the real measured path) makes this a measurement, not an
assumption.

**If the measured direct traversal is still < 6:00: STOP AND ESCALATE TO THE
ORCHESTRATOR.**

Do **not**, without explicit Orchestrator approval:

- change the walk speed or any player constant,
- add arbitrary corridor length,
- exceed the ~700 m route scope,
- modify `docs/VERTICAL_SLICE.md`.

### Acceptance

- Complete continuous route from spawn to overlook.
- Scripted traversal completes with **zero falls/stalls**.
- All six benchmark locations representable.
- Exact measured direct traversal **reported** (not estimated), plus separate
  optional-route duration.
- Floor-area/elevation budgets confirmed or deviations reported.
- Project Owner plays the **complete greybox**; subjective evaluation recorded before any
  art production begins.

### Validation

- Standard phase validation (§10) plus full-route scripted physics traversal with
  recorded duration, shortcut audit, and withholding-rule checks.

### Commit

`test: validate first playable route`

### Gate

Stop for Orchestrator review and Project Owner evaluation of the complete greybox. No art
production begins from a greybox result alone.

---

## 10. Validation Strategy

**Every phase specifies its own validation and commit gate.** Minimum for every phase:

- Godot headless import (`--headless --import`) — clean.
- Scene load / instantiate of the phase's scenes and the composition root — clean.
- Parser/runtime error check — clean output.
- Player constant verification (scene/script unchanged; constants match
  `docs/PLAYER_MOVEMENT.md`).
- Collision/traversal check where applicable (route phases: scripted physics traversal
  per the M1 validation approach, with recorded result).
- `git diff --check`.
- Full diff and `git status` review.

No phase claims validation it did not perform (per `AGENTS.md`).

**Out of scope:** a permanent performance benchmark harness is **not** part of the
greybox task. Benchmark methodology stays defined by `docs/PERFORMANCE_BENCHMARK.md`;
representative benchmark scenes are a later milestone (M3). The greybox only keeps the
six named locations representable.

---

## 11. Commit Strategy

One commit per approved phase, each made only after its validation passes:

| Phase | Commit |
|---|---|
| 0 | `feat: scaffold first playable greybox` |
| 1 | `feat: greybox corporate access` |
| 2 | `feat: greybox monumental atrium` |
| 3 | `feat: greybox elevated transition` |
| 4 | `feat: greybox final vista` |
| 5 | `test: validate first playable route` |

Each phase **stops for Orchestrator review before the next phase begins**. No phase
batches work from a later phase.

---

## 12. Escalation Rules

Implementation agents must **stop and escalate** rather than silently decide when:

- measured direct traversal is < 6:00 (Phase 5 gate — hard stop);
- a measured value conflicts with an approved layout budget (report the conflict; never
  silently resolve);
- a boundary transform must move after Phase 0;
- a phase appears to require any of the changes listed in `AGENTS.md` § Architecture
  Approval (autoloads, plugins, subsystem replacement, project-wide architecture);
- a reveal/withholding rule cannot be satisfied with the approved geometry (composition
  decision → Orchestrator, not agent discretion).

---

## 13. Explicit Non-Goals

The production greybox does **not** include:

- production architecture meshes, materials, or textures
- designed lighting (development lighting only)
- audio implementation
- interaction, doors that open, elevators
- NPCs, narrative, lore, or branding
- UI, objectives, or gameplay systems
- a permanent performance benchmark harness
- streaming, LOD, or occlusion tooling
- any refactor of the player, the M1 scene, or project settings beyond what instancing
  the greybox scenes requires
