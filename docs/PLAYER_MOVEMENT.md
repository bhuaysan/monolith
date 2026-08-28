# PLAYER MOVEMENT SPECIFICATION — v0.1

**Status:** APPROVED — implementation and greybox baseline for Vertical Slice v0.1.

---

## 1. Status

This document fixes the movement and camera constants for MONOLITH Vertical Slice v0.1.

It closes deferred decision 1 of `docs/VERTICAL_SLICE.md` §15 ("Player movement parameters") and supplies the values §9.6 and §9.7 of that document declare deferred.

It is a specification, not an implementation plan. No scenes, scripts, input maps, or project settings are created or changed by this task.

Values in this document fall into two authority categories:

| Category | Authority |
|---|---|
| **Authored scale constant** | Binding. Architecture is authored against it. Changing it invalidates authored spatial proportion and requires explicit Orchestrator approval. |
| **Implementation target** | Binding as intent. Small technical adjustment is permitted during implementation if engine behaviour requires it, provided no authored scale constant changes and the deviation is reported. |

---

## 2. Purpose

Later greybox and architectural work must be authored against a known player. Without fixed movement constants, every subsequent layout task would implicitly invent its own player scale, and measured results from the greybox scale test would not be comparable.

This document exists so that:

1. Greybox geometry can be authored against a fixed eye height.
2. Route length can be evaluated against a fixed walking speed.
3. Vista framing can be evaluated against a fixed field of view.
4. Later agents cannot resolve a layout problem by silently altering player scale or speed.

The level adapts to the approved player. The player does not adapt to the level.

---

## 3. Movement Philosophy

> Movement should disappear beneath the architectural experience.

MONOLITH is not a movement shooter, a platformer, an immersive sim, or a traversal game. Movement is transport and observation, not content.

The controller must feel:

- grounded
- predictable
- physically plausible
- responsive without feeling twitchy
- stable enough for sustained architectural observation
- deliberately slower than a conventional FPS controller

The controller must not feel:

- floaty, sliding, or momentum-driven
- athletic or acrobatic
- instantaneous or digital in its velocity changes
- expressive in a way that invites the player to test its limits

If the player is thinking about the controller, the controller is wrong.

---

## 4. Authority / Relationship to Vertical Slice

`docs/VERTICAL_SLICE.md` (Status: APPROVED) is the parent specification. This document is subordinate to it and must not contradict it.

Specific relationships:

- `VERTICAL_SLICE.md` §9.6 requires a fixed, realistic camera height, stable once chosen. This document selects **1.65 m** (§5).
- `VERTICAL_SLICE.md` §9.7 requires walking speed to be chosen deliberately against the §3 duration budget and §6 route length. This document selects **2.0 m/s** (§6) and defines how the greybox validates it (§15).
- `VERTICAL_SLICE.md` §11 requires "walking, looking, gravity, collision, stairs/ramps" and asserts no sprint/crouch/jump requirement. This document resolves that: none exist in v0.1 (§6, §13).
- `VERTICAL_SLICE.md` §4 Beat 2 prohibits an elevator requirement and expects walkable stair/ramp/escalator geometry. §8 and §9 of this document define what the controller guarantees for that geometry.
- `VERTICAL_SLICE.md` §4 Beat 3 states no fall hazard and no fall state is designed. This document designs no airborne gameplay (§8).

`docs/WORLD_SCALE.md` supplies the ~1.75 m reference human. This document is consistent with it (§5).

Where this document assigns a number to something `VERTICAL_SLICE.md` left deferred, this document is authoritative for that number.

---

## 5. Player Scale

### 5.1 Reference human height

`~1.75 m`, inherited from `docs/WORLD_SCALE.md`. Restated for convenience; that document remains authoritative for the reference.

### 5.2 Camera / eye height — authored scale constant

**1.65 m above the standing floor surface.**

This is the canonical authored eye height for Vertical Slice v0.1. It is the height at which all architectural proportion, door and railing reads, ceiling compression, and vista framing are evaluated.

It is an **authored scale constant**. Once greybox architectural dimensions begin to be authored against it, it must not change casually. Any later proposed change requires explicit Orchestrator approval, because changing eye height changes perceived architectural proportion across every space already authored.

The eye height is a fixed offset from the floor. It is not driven by animation, state, or procedural motion (§10.5).

### 5.3 Standing collision body — implementation targets

| Property | Design target |
|---|---:|
| Total standing body height | ~1.80 m |
| Capsule radius | ~0.32 m |

These are **implementation targets**, not authored scale constants. They may receive small technical adjustment if Godot collision behaviour requires it — for example to stabilize traversal of authored stairs or thresholds — provided that:

- the 1.65 m authored eye height is unchanged, and
- the adjustment is reported.

The distinction is deliberate: the camera height is what the architecture is drawn against; the capsule is what the physics engine is given to work with. Corridor and doorway clearances are authored against the capsule radius (§12), but spatial proportion is authored against the eye height.

---

## 6. Locomotion

### 6.1 Walk speed — v0.1 canonical value

**2.0 m/s.** This is the single locomotion speed in v0.1.

Rationale:

- Deliberate enough to preserve monumental scale. Fast traversal shrinks large spaces perceptually.
- Significantly slower than a conventional FPS run speed.
- Fast enough that a 10–15 minute slice does not become tedious.
- Gives the greybox a meaningful, measurable relationship between route distance and traversal duration.

Against `VERTICAL_SLICE.md` §6 (~400–700 m route) and §3 (direct traversal ≥ 6 minutes), 2.0 m/s yields a nominal direct walking time of roughly 3.3–5.8 minutes before any stopping, looking, stair or turn cost. The greybox must measure the real figure (§15).

**Speed is not the adjustment variable.** If measured greybox traversal proves incompatible with the duration target, the correct responses are to reconsider layout distance, route shape, or the Vertical Slice scope targets explicitly — not to silently compensate by raising movement speed toward FPS norms. Do not automatically increase movement speed because a route measured short.

### 6.2 Sprint

**Not present in v0.1.**

Reasons: unnecessary for a 10–15 minute experience; undermines authored traversal timing; changes perceived environmental scale; adds a movement state that serves no part of the core fantasy.

### 6.3 Jump

**No player-controlled jump in v0.1.**

The authored route must not require jumping at any point.

Reasons: no platforming is intended; removes accidental traversal exploits; keeps the movement state set minimal; prevents level geometry from being evaluated by the player as traversal gameplay.

### 6.4 Crouch

**Not present in v0.1.** The route must not contain any space that requires crouching to pass.

### 6.5 Lean, mantle, vault, climb

**None.** These are not designed, not anticipated, and no structure should be prepared for them.

---

## 7. Movement Parameters

All values are implementation targets unless marked as an authored scale constant.

| Parameter | Value | Category |
|---|---:|---|
| Camera / eye height | 1.65 m | Authored scale constant |
| Walk speed | 2.0 m/s | Authored scale constant (route timing depends on it) |
| Ground acceleration | 8.0 m/s² | Implementation target |
| Ground deceleration | 10.0 m/s² | Implementation target |
| Standing body height | ~1.80 m | Implementation target |
| Capsule radius | ~0.32 m | Implementation target |
| Camera FOV (vertical) | 70° | Authored scale constant |
| Pitch clamp | −89° to +89° | Implementation target |
| Yaw | Unrestricted | — |

### 7.1 Ground acceleration — 8.0 m/s²

Reaches the 2.0 m/s walking speed in roughly a quarter second. This is fast enough to feel responsive, while avoiding an instantaneous digital velocity change that would read as unphysical.

### 7.2 Ground deceleration — 10.0 m/s²

Releasing movement input stops the player quickly and predictably, so precise positioning at a vista or a framed sightline is easy. Deceleration exceeds acceleration deliberately: the player should stop with more authority than they start with, and must never feel they are sliding.

### 7.3 Movement input

- Movement direction is **camera-yaw-relative**. Camera pitch does not contribute to movement direction; the player does not move along the look vector.
- Diagonal input must be **normalized** so that diagonal movement is not faster than forward movement.
- Speed is uniform in all directions in v0.1. There is no reduced backward or strafe speed.

### 7.4 Explicitly not required

No acceleration bonus, no momentum or inertia model, no stamina, no movement state machine, no speed modifiers, no surface-dependent friction model.

---

## 8. Gravity and Grounding

The controller requires gravity and reliable grounded movement.

- Use Godot's project/default gravity source. Do **not** introduce a separate unexplained gravity constant unless implementation proves a custom value necessary; if it does, the deviation and its reason must be reported.
- No airborne gameplay is designed. There is no air control model to tune, because the player is not expected to leave the ground.
- There are no intentional fall challenges, fall damage, fall states, or death states in v0.1, consistent with `VERTICAL_SLICE.md` §4 Beat 3 and §13.
- Gravity exists to keep the player reliably on the floor and to handle small drops, thresholds, and stair descent — not as a gameplay system.

The controller must remain stable on:

- flat floors
- realistic ramps
- authored stairs
- transitions between those surfaces

Stability means: no jitter, no unintended launch off slope transitions, no loss of ground contact while walking down stairs, and no snagging on authored thresholds.

---

## 9. Stair / Ramp Strategy

**Do not specify or build a custom complex stair-climbing algorithm as a v0.1 requirement.**

For v0.1:

- Stair *visuals* may be authored with **simplified hidden ramp collision** where that produces more stable first-person traversal. Visual steps, collision ramp.
- This is the preferred first approach. It is cheaper, more stable, and adequate for a route with no traversal challenge.
- A sophisticated step solver may only be introduced later if measured evidence from the greybox shows the simple approach fails, and then only via a dedicated task.

Ramp gradients must be walkable at 2.0 m/s without the player fighting the controller. Where the greybox needs a specific maximum authored gradient, it is set by the greybox scale test, not assumed here.

---

## 10. Camera

### 10.1 Field of view — 70° vertical

**Canonical composition FOV: 70° vertical.**

Godot's `Camera3D` uses **vertical** FOV. This value is vertical and must be entered as such. Do not silently substitute a horizontal FOV value; the two are not interchangeable and confusing them changes every framing judgement made in the greybox.

70° vertical is the baseline against which greybox spatial composition and vista framing are evaluated. It provides sufficient upward view for monumental vertical architecture without the wide-angle distortion that would misrepresent proportion.

There is no settings system in v0.1, so FOV is not player-adjustable. Future accessibility or options work may reconsider adjustable FOV; **architectural evaluation must always use the canonical 70° vertical baseline** regardless.

FOV is an authored scale constant. Changing it changes composition, and therefore requires the same approval as changing eye height.

### 10.2 Pitch

Target clamp: **−89° to +89°**, i.e. very nearly straight down to very nearly straight up.

Use whichever sign convention matches the eventual Godot implementation. The binding requirement is that the player can comfortably look **almost straight upward**, because monumental vertical architecture is the core of the experience and an ordinary ±80° clamp would truncate the primary intended view.

Yaw is unrestricted.

### 10.3 Mouse look

- Keyboard and mouse is the v0.1 reference input method.
- Mouse look must be direct and predictable: rotation proportional to raw mouse delta.
- Mouse sensitivity must be designer-tunable and exported in the eventual implementation.
- Mouse sensitivity is **not** an architectural scale constant. It has no effect on authored proportion and may be changed freely without approval. Do not treat it as one.
- **No mouse acceleration.** No smoothing, no filtering, no response curve.

### 10.4 Camera motion — none

For the v0.1 baseline the camera is rigid relative to the body:

- no head bob
- no camera roll
- no procedural breathing sway
- no landing shake or impact shake
- no speed-based FOV change
- no camera inertia or cinematic lag

The camera is primarily an architectural observation instrument. Camera motion competes with scale perception and creates unnecessary comfort issues in a slice whose whole purpose is sustained looking.

Micro-motion may be reconsidered **only after** the static baseline has been playtested, and only via a dedicated task.

### 10.5 Camera mounting

Camera height is a fixed offset from the body, not an animated or state-driven value. There is no crouch height, no landing dip, and no eye-height variation of any kind in v0.1.

---

## 11. Input

Reference controls for development:

| Input | Action |
|---|---|
| W | Move forward |
| S | Move backward |
| A | Move left |
| D | Move right |
| Mouse | Look |
| Escape | Release mouse capture / development escape behaviour |

Implementation requirements (for the later controller task, not this one):

- Input must use **Godot Input Map action names**, not hardcoded key checks.
- Suggested semantic action names: `move_forward`, `move_backward`, `move_left`, `move_right`.
- These actions are **not** to be created in this task. No change to `project.godot` is authorized here.

Gamepad support is not required by this specification and may be deferred.

---

## 12. Collision and Level-Authoring Implications

These are the consequences of the constants above for all later architectural work. They are binding on greybox and layout tasks.

1. **Floor and ceiling dimensions are authored against 1.65 m eye height.** Beat 1's 2.6–4.5 m ceiling range reads as compression only relative to that eye height.
2. **Doors and railings must read correctly at 1.65 m.** A 2.4–3 m door and a ~1.1 m railing are judged from that camera position, not from an orthographic view or an editor perspective.
3. **Corridor width and doorway clearance must comfortably accommodate the ~0.32 m capsule radius** — comfortably, meaning the player does not scrape walls or catch on frames while walking a normal line.
4. **No route segment may require sprint, jump, crouch, mantle, vault, climb, or precision platforming.** A route that requires any of these is a layout defect, not a movement gap.
5. **Stairs and ramps must be traversable at 2.0 m/s** without the player slowing, stalling, or fighting the controller.
6. **Final vista framing is evaluated at 1.65 m eye height and 70° vertical FOV.** A composition that only works at a different height or FOV does not work.
7. **Route timing is evaluated at 2.0 m/s** against `VERTICAL_SLICE.md` §3.
8. **Human-scale anchors** required by `VERTICAL_SLICE.md` §9.3 are anchors *because* they are read from 1.65 m. Placement must account for the camera height, not just for plan position.

These constants exist partly to stop later agents from changing character scale or speed to make a level layout convenient.

> The level adapts to the approved player scale — not the other way around.

---

## 13. Explicit Non-Goals

v0.1 movement does **not** include, and no task may add without explicit Orchestrator approval:

- sprint
- jump
- crouch
- prone
- mantle
- vault
- climbing
- wall-running
- sliding
- dashing
- leaning
- stamina
- parkour
- movement upgrades or unlocks
- movement abilities
- camera shake systems
- head bob
- movement-based FOV effects
- third-person mode or camera switching
- complex footstep systems
- complex stair-solving, unless measured evidence later requires it

**No speculative architecture may be created for any of the above.** Not a hook, not an unused exported property, not a state enum with unused members, not a comment reserving a slot. A future task that adds one of these will design it then.

---

## 14. Implementation Constraints

The following describes the intended later implementation. **It is not authorization to implement.** A separate task must authorize the controller.

**Location:** `game/player/`, per `docs/ARCHITECTURE.md`.

**Likely composition, at a high level:**

- `CharacterBody3D` root
- one standing `CollisionShape3D` (capsule)
- a camera/pitch pivot node
- `Camera3D`
- one focused controller script

**Constraints:**

- No autoload.
- No global event bus.
- No generic ability or modifier system.
- No state machine unless later behaviour actually requires one. With one locomotion state, it does not.
- No plugin, third-party controller, or external dependency.
- Do not turn this into a framework. It is one script and a small scene.
- Typed GDScript, snake_case functions and variables, per `docs/CODING_RULES.md`.
- Designer-tunable values (walk speed, acceleration, deceleration, eye height, mouse sensitivity, FOV) exposed as exported properties.
- Exported values are for tuning convenience. Exporting the eye height, walk speed, or FOV does not make them freely changeable — they remain governed by §5, §6, and §10.
- The controller processes movement in `_physics_process` and look input in `_input`; no unjustified `_process` work, per `docs/CODING_RULES.md`.

---

## 15. Greybox Validation Criteria

The greybox scale test must objectively verify the following. Each is a check against the constants in this document.

1. **1.65 m eye height** makes human-scale doors, railings, ceilings, and furniture references read naturally.
2. **70° vertical FOV** provides sufficient upward view for monumental architecture without making spaces read as visually distorted.
3. **2.0 m/s walking** feels deliberate but not frustrating over the full route.
4. **Beat 1** reads as human-scale at the canonical camera height.
5. **Beat 2's 60–100 m atrium** reads as dramatically larger than Beat 1 without any alteration to player scale.
6. **A direct-route traversal meets the `VERTICAL_SLICE.md` §3 timing target** (≥ 6 minutes direct) through *layout*, not through artificial speed changes.
7. **Stairs and ramps** on the authored route are crossed reliably at walking speed without jump and without controller instability.
8. **The skybridge (Beat 3)** feels long and high because of geometry, glazing rhythm, and parallax — not because the player is slow.
9. **Final vista composition (Beat 4)** works at 1.65 m eye height and 70° vertical FOV, including the three required depth layers.
10. **No excluded movement mechanic** from §13 is needed to complete the route.

**Failure reporting rule:** if any check fails, report *which single constant or layout assumption* is responsible. Do not tune several variables simultaneously, and do not resolve a layout failure by changing a movement constant. A proposed change to an authored scale constant goes to the Orchestrator.

---

## 16. Deferred Decisions

Intentionally unresolved. Each requires a dedicated task; no implementation agent may close one unilaterally.

1. **Gamepad support.** Not required for v0.1. Deferred, not rejected.
2. **Adjustable FOV and mouse-sensitivity UI.** Depends on a settings system, which `VERTICAL_SLICE.md` §12 defers.
3. **Footstep audio.** Movement produces no audio in this specification. Whether the slice has footsteps at all, and how they relate to per-space reverb (`VERTICAL_SLICE.md` §8), is a later audio task.
4. **Camera micro-motion.** Reconsiderable only after the static baseline is playtested, per §10.4.
5. **Maximum authored ramp gradient and stair rise/run.** To be fixed by the greybox scale test with measured values, per §9.
6. **Whether a step solver is needed.** Depends on greybox evidence, per §9.
7. **Interaction input.** Whether the slice needs any interaction at all remains open in `VERTICAL_SLICE.md` §15.5. If it is later required, its input action is designed then, not reserved now.
8. **Mouse-capture and pause behaviour beyond development Escape.** Depends on `VERTICAL_SLICE.md` §15.3 (session start) and §15.2 (slice termination).
