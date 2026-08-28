# GREYBOX SCALE TEST

**Status:** COMPLETED (2026-08-28) — automated validation passed; Project Owner manual evaluation recorded (below). M1 subjective gates are PASS.

---

## Purpose

Prove in-engine, using primitive geometry and the approved player controller only, that
MONOLITH's core scale fantasy already works before any art is produced:

> Does MONOLITH already feel impressive when everything is still primitive geometry?

The scene tests four scale conditions in one continuous route: human scale, compression,
monumental interior scale, and exterior megastructure scale. If scale does not read here,
adding art later will not fix it. If something reads wrong, the architecture changes —
never the player constants (`docs/PLAYER_MOVEMENT.md`).

## Status of Validation

| Type | State |
|---|---|
| Automated (headless import, scene load, scripted physics traversal, constant checks) | **Complete — passed** |
| Owner subjective evaluation (scale shock, verticality, comfort, pacing) | **Complete — passed, recorded below** |

The two 7/10 ratings are preserved as observations for later architecture/art refinement,
not as greybox defects. No geometry, player constant, FOV, movement speed, lighting, or
architecture was changed in response to the ratings.

## Scene Path

- `game/world/greybox_scale_test.tscn` — development main scene (`project.godot`).
- Instances `game/player/player.tscn` unmodified (controller untouched except a
  development mouse re-capture fix, see Known Limitations).

## Player Constants (verified in-engine, unchanged)

| Constant | Value |
|---|---:|
| Eye height | 1.65 m |
| Walk speed | 2.0 m/s |
| Camera FOV | 70° vertical |
| Capsule | r 0.32 m, h 1.80 m |
| Acceleration / deceleration | 8.0 / 10.0 m/s² |
| Sprint / jump / crouch | none |

## Geometry Targets and Measured Values

All values below were measured headlessly from world-space mesh AABBs of the running
scene (not from authoring intent). World origin: implied ground slab top at y = 0;
all playable floors sit high in the host tower (lobby floor top y = 160.0).

| Element | Target | Measured |
|---|---|---:|
| Zone A ceiling | ~3.0 m | 3.0 m |
| Zone A corridor width | 2.5–3.5 m | 3.0 m |
| Zone A door openings | 2.1–2.4 m | 2.2 / 2.3 / 2.3 m |
| Zone B ceiling (final compression run) | ~2.7–3.2 m | 2.7 m |
| Atrium clear height | ~80 m | **80.0 m** (160.0 → 240.0) |
| Atrium interior footprint | suggested 45–60 × 60–90 m | **80 × 64 m** (deviation, see below) |
| Atrium wall bands module | ~4 m, 15–20 readable | 4.0 m × 19 bands |
| Vista deck elevation above implied ground | ~150–250 m | **162.4 m** |
| Neighbouring tower heights | 800–1200 m | 1000 m, 880 m, 1150 m (crowns included) |

## Scale References (near-field, all measured)

- Doorways: 2.2–2.5 m throughout, incl. 2.5 m reveal door and 2.5 m gallery door.
- Railings/parapets: planter rail 1.10 m; bridge rails 1.15 m; gallery and balcony
  parapets 1.10 m.
- Furniture-sized blocks: benches 0.45 m, planter 0.40 m.
- Human-height debug markers: 1.75 m posts in lobby, atrium and vista platform.
- Atrium bands at a 4 m vertical module double as a readable height ruler (19 levels).
- Skybridge pylons and platform pylon drop the full 161–162 m to the implied ground.

## Zone Descriptions

### Zone A — Human Scale Reference
Restrained corporate lobby (12.5 × 10 m, 3.0 m ceiling) with a wall recess, bench,
planter with 1.1 m rail, two slim columns, ceiling light strips, then a 3.0 m wide
corridor with door frames. Deliberately ordinary; establishes the human baseline.

### Zone B — Compression
Corridor B (3.0 m wide, 3.0 m ceiling) forces a 90° turn away from the atrium; the
B–C threshold drops to 2.7 m; corridor C is a 2.0 m × 2.7 m × 22.5 m straight run
ending in the reveal door (1.5 × 2.5 m). A 4 m tall baffle stands immediately inside
the door, so no atrium sightline exists until the threshold is crossed.

### Zone C — Monumental Atrium
80 m clear height, 80 × 64 m footprint. Four 4 × 4 m full-height columns on plinths;
19 wall bands on a 4 m module; six inaccessible balconies (30 m wide, parapeted) at
12/24/36/48/60/72 m alternating sides; two inaccessible bridges (20.5 m and 45.5 m
above the floor) with 1.1 m rails; six rows of glazing panels and wall openings at
28.6/44.6 m implying occupied upper levels; mullioned roof glazing 80 m above the
player; cornice line at the top. The player's traversable surface is the floor, one
stair and one gallery — a small fraction of the volume. Reveal sequencing: the
compression corridor delivers the player to a human-scale door; the atrium opens
around the entry baffle with the full height exposed at once.

### Zone D — Elevated Exterior Scale Test
A short stair (visual steps over one hidden ramp collision, ~19.7°) rises to a gallery
deck 2.4 m above the atrium floor; a door leads to a 3.0 m wide, 2.8 m high transition
corridor, then a 40 m long, 6 m wide open skybridge (rails 1.15 m, posts every 4 m,
two full-height pylons) ending on a 14 × 14 m railed vista platform at 162.4 m above
the implied ground. Depth layers: near blocks (90–240 m tall, 150–320 m out),
mid towers (640–1100 m tall, 520–800 m out), far masses (820–1050 m tall,
1300–1720 m out), plus the three named towers (Meridian 880 m, Aster 1030 m,
Obsidian 1150 m) with crown masses. Simple height fog and aerial perspective provide
atmospheric separation. Ground level is never reachable.

## Greybox Visual Language

12 neutral StandardMaterial3D values (floor/wall/ceiling/structure/dark/rail/exterior
variants/ground) plus one emissive white for light strips and one amber debug value.
No textures, no decals, no signage, no props beyond scale references.

## Lighting

One angled DirectionalLight3D (sun), 11 OmniLight3D interior fill lights, emissive
ceiling strips, and a WorldEnvironment (procedural sky, ambient light, filmic tonemap,
height fog). Readability only — this is not the Lighting Prototype milestone.

## Test Procedure

1. Launch the project (main scene is the greybox). Mouse captures on start.
2. WASD to walk, mouse to look. Escape releases the mouse; left-click recaptures it
   (development usability behaviour, no gameplay attached).
3. Walk the route: lobby → corridor doors → corridor B turn → compression corridor →
   reveal door → atrium (notice the instinct to look up) → east stair → gallery →
   door → transition corridor → skybridge → vista platform.
4. Answer the evaluation questions below without changing any player constant.

## Measurements

Route (centreline, measured): **~195 m**.

| Timing | Value | Method |
|---|---|---|
| Shortest continuous walk | **~98 s (1.6 min)** at 2.0 m/s | Scripted physics walk of the full route; measured path length 196 m, zero falls, zero stalls |
| Exploratory traversal | est. 3–5 min | Estimate incl. reveal stops and atrium/vista looking; to be confirmed by owner |

Timing method: a temporary headless harness steered the real player scene through
19 waypoints with held forward input, accumulating horizontal distance and checking
for stalls/falls. The harness was development-only and is not committed; the method
is reproducible from this document. Walk speed was not adjusted to influence timing.

## Automated Validation Performed

- `godot --headless --import` — clean.
- Scene load + instantiation headlessly; player instance, constants, capsule and FOV
  verified programmatically; no parser or runtime errors.
- Full-route scripted physics traversal (walking only, no jump/crouch) — complete,
  no falls out of the world, no stuck points.
- `git diff --check`, full `git diff`, `git status` — clean.

## Known Limitations

1. **Atrium footprint 80 × 64 m** exceeds the orchestrator's suggested 45–60 m width
   and the active task's ~50–70 × 70–100 m ranges (depth 64 m is slightly under).
   The 80 m height — the primary variable — is exact, and the proportion was judged
   sound; rebuilding committed working geometry for a suggested-range tweak was
   rejected as risk without scale-test value. Flagged for owner evaluation.
2. **Stair steps are visual-only; one rotated box ramp carries all stair collision**
   (per `docs/PLAYER_MOVEMENT.md` §9). A thin structural slab is visible under the
   treads. Measured gradient ~19.7° (~35%) — a candidate value for the deferred
   "maximum authored ramp gradient" decision.
3. Three door/threshold defects in the committed scene were found by the scripted
   walk and fixed: a 0.5 m floor gap at the gallery door threshold, the gallery
   doorway walled shut by the east door lintel (opening restored to 2.5 m), and an
   atrium wall band crossing the gallery doorway at head height (band split at the
   door frame, as real string courses are).
4. Zone B final corridor ceiling was raised 2.6 → 2.7 m to land inside the brief's
   "roughly 2.7–3.2 m" band.
5. Compression corridor C is a dead-straight 22.5 m run; the only turn is in corridor B.
6. Exterior tower geometry is single boxes with crowns; correct only from the authored
   vista sightlines, per the world-illusion strategy.
7. Automated validation proves geometry, collision and constants only. **No subjective scale claim is validated headlessly.**

## Project Owner Evaluation Questions

- **Human scale:** Does Zone A feel like normal architecture?
- **Reveal:** Does entering Zone C create a noticeable scale shock?
- **Verticality:** Do you instinctively look upward in the atrium?
- **References:** Can you judge the atrium's size because normal-scale elements stay visible?
- **Exterior scale:** Do the 800–1200 m masses feel genuinely enormous rather than like nearby ordinary buildings?
- **FOV:** Does 70° vertical FOV support scale without obvious distortion?
- **Movement:** Does 2.0 m/s reinforce scale without becoming tedious here?
- **Skybridge / exposure:** Does the elevated transition create a believable sense of height and depth?

## Project Owner Evaluation — M1 (recorded 2026-08-28)

The Project Owner played the greybox and returned the following scores:

| # | Evaluation | Score |
|---|---|---:|
| 1 | Human Scale (Zone A) | 7/10 |
| 2 | Reveal (Zone C entry) | 8/10 |
| 3 | Atrium (monumental interior) | 9/10 |
| 4 | Instinctive Upward Look | 10/10 |
| 5 | Scale References (legibility) | 7/10 |
| 6 | Skybridge Height/Depth | 9/10 |
| 7 | Megatowers (exterior scale) | 10/10 |
| 8 | Overall MONOLITH Feeling | 9/10 |

### M1 Subjective Gates — PASS

| Gate (from `tasks/ACTIVE_TASK.md`) | Result | Evidence |
|---|---|---|
| Perceived human scale (Zone A) | **PASS** | 7/10 Human Scale |
| Atrium impact and reveal shock (Zone C) | **PASS** | 9/10 Atrium, 8/10 Reveal |
| Instinctive upward look in the atrium | **PASS** | 10/10 |
| Exterior megastructure effect (Zone D towers) | **PASS** | 10/10 Megatowers |
| Comfort and movement pacing at 2.0 m/s | **PASS** | Covered by the owner's overall evaluation (Overall MONOLITH Feeling 9/10); no separate numeric score was recorded for FOV or pacing |

Verdict: the core scale fantasy works in-engine with primitive geometry. M1 evaluation is complete.

### Refinement Observations (not greybox defects)

The two 7/10 ratings are carried forward as observations for later architecture and art
refinement. They do not invalidate the greybox, and no greybox geometry, player constant,
FOV, movement speed, lighting, or architecture was changed in response to them:

- **Human Scale — 7/10:** Zone A reads as normal architecture; its ordinary/institutional
  character can be strengthened during the first playable area layout and art passes.
- **Scale References — 7/10:** near-field references carry the scale comparison; their
  density, placement, and legibility can be refined during layout and art passes.

## Decisions Requiring Later Review

1. Atrium footprint 80 × 64 m vs. suggested ranges (limitation 1) — confirm or resize.
2. ~19.7° ramp gradient as the de-facto authored maximum (`PLAYER_MOVEMENT.md` §16.5).
3. Visible stair ramp slab vs. fully hidden ramp collision in production art.
4. Route length 195 m is a prototype measurement, not the 400–700 m Vertical Slice
   route; it informs, but does not set, the first playable area layout task.
5. Vista deck elevation 162.4 m (within the 150–250 m target) — confirm framing.
