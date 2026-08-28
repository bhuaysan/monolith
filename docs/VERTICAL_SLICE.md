# VERTICAL SLICE v0.1

**Status:** DRAFT — definition approved for use as the target for subsequent design and implementation tasks.

This document defines the concrete target experience for MONOLITH Vertical Slice v0.1.

It is a specification, not an implementation plan. No gameplay, scenes, scripts, or assets are defined here as work to be done immediately. Later tasks (player movement specification, greybox scale test, performance benchmark methodology, first playable area layout) must all resolve against this document.

Where this document is more specific than `docs/VISION.md`, `docs/ART_DIRECTION.md`, or `docs/WORLD_SCALE.md`, it is a narrowing of those documents for v0.1 only, not a replacement.

## Authority of Values in This Document

Numbers in this document fall into three categories. They do not carry the same authority, and later tasks must not treat them as if they did.

| Category | Authority | Examples |
|---|---|---|
| **v0.1 design target** | Binding for this slice only. Concrete, bounded, and intended to constrain layout and scope. Not a project-wide constraint, and not inherited by any content beyond v0.1. | Target duration and per-beat budget (§3), beat dimensions (§4), playable scope bounds (§6) |
| **Inherited project value** | Owned by another document. Restated here for convenience only; the source document remains authoritative. | Tower height 800–1200 m and atrium range, from `docs/WORLD_SCALE.md` and `docs/VISION.md` |
| **Deferred value** | **Not selected by this document.** Named only to identify that the value exists, matters to scale, and must be fixed by a later task — then held stable. No number is chosen here. | Player eye height, walk speed and acceleration (§9, §15) |

v0.1 design targets are revisable by the greybox scale test if measurement shows they do not serve the experience; that revision is a change to this document, not a silent deviation from it.

---

## 1. Purpose

Vertical Slice v0.1 exists to prove, in a single coherent playable sequence, that MONOLITH can achieve:

1. Convincing monumental architectural scale.
2. A distinct Corporate Futurism art direction that does not depend on cyberpunk clichés.
3. High-end atmosphere in Godot 4 with the Forward+ renderer.
4. Compelling first-person exploration with minimal mechanics.
5. The illusion of a world vastly larger than the authored playable space.
6. Acceptable PC performance at high visual quality.
7. A production workflow in which AI implementation agents can iteratively build and polish a single experience.

The slice must remain small enough to polish aggressively. Scope is deliberately constrained so that quality per unit of content can be maximized.

The slice is a **demonstration of the core fantasy**, not a demonstration of systems.

---

## 2. Target Experience

Core fantasy:

> The player is a human inside architecture built at a scale that feels almost inhuman.

The slice takes place inside **one coherent corporate megastructure complex**. The player traverses a single authored route from a restrained, human-scaled arrival space to a monumental exterior vista.

Intended player emotional arc:

| Stage | Intended feeling |
|---|---|
| Arrival | Ordinary, controlled, mundane, slightly institutional |
| First reveal | Sudden disproportion; instinct to look upward |
| Elevated transition | Exposure, height awareness, awareness of a wider complex |
| Final vista | Insignificance, awe, curiosity about inaccessible space |

The final impression the slice must leave is:

> "The world is vastly larger than the place I was allowed to explore."

The environment is the primary content. There is no narrative delivery system, no objective marker system, and no dialogue in v0.1. Progression is communicated architecturally — through sightlines, light, and spatial framing.

---

## 3. Target Duration

**10–15 minutes** of first-person exploration for a player who moves at a normal exploratory pace and stops to look.

Indicative per-beat budget:

| Beat | Space | Target duration |
|---|---|---:|
| 1 | Arrival / access space | 1.5–2.5 min |
| 2 | Monumental atrium | 3–4 min |
| 3 | Elevated transition / skybridge | 2–3 min |
| 4 | Final vista | 3–4 min |

A player who walks the route directly without stopping should still take **no less than 6 minutes**. A player who explores every optional pocket should take **no more than 18 minutes**.

These figures are design targets used to bound layout size. They are not runtime-enforced.

---

## 4. Spatial Sequence

The slice is a linear four-beat progression. Each beat exists to set up the next.

### Beat 1 — Human Scale / Compression

**Space type:** Corporate access, arrival, or service-entry sequence. Interior. Enclosed.

**Purpose:** Establish the player's own size, and establish a baseline of visual restraint so that Beat 2 reads as disproportionate by comparison.

**Requirements:**
- Ceiling heights in the **2.6–4.5 m** range. Compressed relative to everything that follows.
- Continuous availability of recognizable human-scale references: doors (2.4–3 m), handrails, seating or furniture niches, wall signage, floor thresholds, ceiling service grids, door hardware at hand height.
- Restrained composition. Controlled palette. Low prop density.
- At least one deliberately compressed threshold (a corridor, vestibule, or portal) immediately preceding the Beat 2 reveal, used to constrict the field of view before it opens.

**Prohibitions:**
- This space must **not** be spectacular, monumental, or visually loud.
- No long sightline into Beat 2 until the reveal threshold itself.
- No vista, no exterior view of the megastructure, no distant tower silhouettes.

**Exit condition:** The player passes through the compression threshold into the atrium.

### Beat 2 — Monumental Atrium Reveal

**Space type:** Large enclosed interior atrium or internal void within the megastructure.

**Purpose:** The first architectural reveal. The player should instinctively look upward within the first few seconds of entry.

**Requirements:**
- Vertical interior extent of approximately **60–100 m**, consistent with the atrium range in `docs/WORLD_SCALE.md`.
- Multiple distinct architectural levels legible at distance, receding upward and/or across the void.
- Bridges, structural members, service runs, balconies, or occupied-looking zones that are clearly **inaccessible** to the player and that imply continued function above and beyond the playable floor.
- Human-scale reference elements in the near field, within a few metres of the player's route (railings, benches, doors, signage at reading height), placed specifically so that the eye can compare near-detail to far-mass.
- The architecture must dominate the frame. Props must not compete with it.
- The player's traversable surface within the atrium is a **small fraction** of the atrium's visible volume — a floor, gallery, or edge walkway, not the whole space.

**Prohibitions:**
- No player access to the upper levels of the atrium in v0.1.
- No elevator requirement. Vertical change within the atrium, if any, must be achievable by stair, ramp, or escalator geometry that the player simply walks.

**Exit condition:** The player reaches an elevated egress on the far side or upper edge of the atrium leading to Beat 3.

### Beat 3 — Elevated Transition / Skybridge

**Space type:** Elevated glazed corridor, skybridge, cantilevered passage, or equivalent exposed architectural link.

**Purpose:** Convert interior monumentality into exterior scale, and establish that the building the player has been inside is only one element of a larger complex.

**Requirements:**
- A sustained, mostly linear traverse with the exterior visible along its length.
- Controlled exposure: the player is high above ground with visible depth beneath, but always on a safe, enclosed or railed surface. No fall hazard is required and no fall state is designed for v0.1.
- Strong parallax between near structure (mullions, deck structure, glazing frames, handrails), mid-distance complex architecture, and far atmospheric layers.
- Visible evidence of the wider complex: adjacent volumes, other bridges, facade rhythm, structural mass belonging to buildings the player will never enter.
- Ground level may be obscured by atmosphere, cloud layer, or lower structure. **Ground-level city access is not required and is not designed for.**

**Prohibitions:**
- No branching route that leaves the bridge.
- No traversal mechanic beyond walking and looking.

**Exit condition:** The player enters the terminal space of Beat 4.

### Beat 4 — Final Vista

**Space type:** Observation space, corporate concourse, overlook, or terrace-behind-glass. Interior or sheltered.

**Purpose:** The climax and endpoint. The largest implied scale in the slice.

**Requirements:**
- A dominant, deliberately framed view. The space's architecture must compose the view rather than merely contain it.
- Neighbouring towers reading at approximately **800–1200 m** tall, consistent with `docs/VISION.md` and `docs/WORLD_SCALE.md`.
- Enormous implied vertical distance below and above the player's position.
- At least **three legible depth layers** beyond the glazing (near complex structure, mid-distance towers, far atmospheric city mass).
- Atmospheric perspective and, where appropriate, a cloud layer used to imply depth the geometry does not literally contain.
- Architecture that visibly continues past the edges of the view and past the player's reach.
- Human-scale interior elements present in the same frame as the vista, so that the comparison is made inside a single camera view.

**Prohibitions:**
- No further playable space beyond this point in v0.1.
- No interactive endpoint, terminal, cutscene, or credits sequence is required.

**Endpoint definition:** The slice is complete when the player is standing in the final vista space with the composed view available. How the session formally terminates (immediate return to menu, quiet hold, fade) is a **deferred decision** — see §14.

---

## 5. Core Exploration Loop

The v0.1 loop is:

> **Explore → observe → move toward a visual destination → experience a spatial reveal → continue deeper into the structure.**

Design consequences:

- Every beat must present the player with a **visible destination** before they are asked to travel toward it. Navigation is driven by sightline and light, not by UI.
- Each beat must end in a reveal that recontextualizes the previous space's scale.
- Reward for exploration is **visual and spatial**, never mechanical. There are no collectibles, no unlocks, no scoring.
- The player should never be uncertain about where forward is for more than a few seconds. Wayfinding is architectural: light level, signage, floor material change, and framed openings.

---

## 6. Playable Scope

The traversable footprint is deliberately small, and much smaller than the visible world.

**Bounds — v0.1 design targets.** These bound the layout of this slice. They are not project-wide constraints and do not apply to content beyond v0.1. The greybox scale test may propose revising them with measured justification.

| Constraint | v0.1 target |
|---|---|
| Primary authored route | Exactly one |
| Route walking distance (start to final vista) | ~400–700 m |
| Total traversable floor area | ≤ ~4,000 m² |
| Playable vertical range (lowest to highest walkable surface) | ≤ ~120 m |
| Optional side exploration | ≤ ~25% additional floor area, all dead-ends returning to the main route |
| Distinct playable spaces | Four beats plus connective circulation |

**Principles:**

- One primary authored route. Optional exploration exists to reward curiosity with a view or a detail, never with progression.
- Visible space must greatly exceed playable space in every beat.
- Inaccessible architecture is a **deliberate design tool**, not an omission. Bridges, upper galleries, adjacent volumes, and neighbouring towers are authored to be looked at and never entered.
- No open world. No hub. No backtracking requirement. No branching progression.

**Not required for v0.1:** elevators, NPCs, vehicles, dialogue, combat, inventory, quests, or any complex simulation. A moving elevator may be reconsidered later only if the experience proves to require it; it is explicitly **not** a requirement of this slice.

---

## 7. Visual Goals

The slice preserves the Corporate Futurism direction established in `docs/ART_DIRECTION.md`.

**Prefer:**
- Architectural mass and structural rhythm as the primary visual content.
- Large, controlled, uninterrupted surfaces.
- Selective, motivated lighting.
- Restrained signage, used for wayfinding and believability rather than decoration.
- High material quality on a small material set: dark glass, architectural concrete, anodized metal, ceramic composite, controlled wood or textile accents.
- Atmospheric depth and clear separation of depth layers.
- Strong, readable silhouettes at long range.
- Deliberate contrast between human-scale detail and megastructure-scale form.

**Avoid — the slice's identity must not depend on any of these:**
- Excessive neon.
- Dense holographic advertising.
- Visual clutter and dense prop noise.
- Street-level cyberpunk market imagery.
- Universal grime and decay.
- RGB or saturated colour as the primary aesthetic.

**Form hierarchy** (per `docs/ART_DIRECTION.md`): primary forms communicate scale before secondary forms, which communicate before tertiary surface detail. In greybox, only the primary hierarchy is evaluated.

**Lighting intent per beat:**

| Beat | Lighting character |
|---|---|
| 1 | Even, neutral, institutional; low contrast; corporate white with restrained warmth |
| 2 | High contrast; strong daylight or top-light shaft down the void; deep shadow mass |
| 3 | Exterior-dominated; cool ambient; high dynamic range across the glazing |
| 4 | Interior kept relatively dark so the exterior vista dominates the exposure |

---

## 8. Audio Goals

Audio exists to reinforce scale. It must not merely fill silence.

**Required audio character per beat:**

| Beat | Acoustic character | Content |
|---|---|---|
| 1 | Dry, short reverberation; close, contained | Ventilation hum, faint structural noise, restrained corporate public-space tone |
| 2 | Long reverberation; large decay time; audible distance | Distant HVAC, far machinery, faint reverberant activity implying occupied inaccessible levels |
| 3 | Semi-enclosed; exterior pressure bleeding in | Wind loading, glazing and structural cues, reduced interior ambience |
| 4 | Quiet, wide, exposed | Low wind, low-frequency structural presence, minimal interior noise |

**Principles:**
- The transition between compressed (Beat 1) and monumental (Beat 2) acoustics must be **immediately audible** at the reveal threshold. The acoustic change is part of the reveal.
- Distant sources should read as distant: filtered, delayed, reverberant, quiet.
- Silence is a usable material. Beat 4 may be the quietest point in the slice.
- No music is required for v0.1. Whether the slice uses score at all is deferred (§14).

**Explicitly out of scope for v0.1:** no complex dynamic audio system, no runtime acoustic simulation, no procedural ambience system, no occlusion/portal audio framework. Beat-appropriate ambience and reverb configured per space is sufficient.

---

## 9. Scale Strategy

Scale is produced by **contrast**, not by size. The following are the operative rules for v0.1.

1. **Reference before magnitude.** Beat 1 exists solely so that Beats 2–4 have something to be measured against. It must not be shortened or made spectacular.
2. **Maintain the hierarchy.** Human → door → room → atrium → building → megastructure, per `docs/WORLD_SCALE.md`. Every monumental frame must contain at least one element from the human end of that chain.
3. **Anchor every large view.** No monumental composition should be presented without a near-field human-scale anchor in the same frame.
4. **Escalate monotonically.** Each beat's dominant spatial dimension exceeds the previous beat's. Beat 1 (metres) → Beat 2 (tens of metres) → Beat 3 (hundreds of metres of exposure) → Beat 4 (~kilometre-scale towers).
5. **Do not inflate everything.** If every object is enormous, nothing is enormous. Doors, railings, signage, and furniture remain at real human dimensions throughout.
6. **Camera height is a scale constant — value deferred.** All architectural proportion is authored against the player's eye height, so it must be realistic, fixed, and stable once chosen. **This document does not select a value.** The value belongs to the Player Movement Specification. Once selected there it must be treated as a project constant: changing it afterwards invalidates the authored proportion of every space in the slice. No architectural work should be authored before it is fixed.
7. **Movement speed is a scale instrument — value deferred.** Traversal speed determines how large a space feels, so it is a scale decision as much as a comfort decision. **This document does not select a value.** The Player Movement Specification must select it deliberately against the §3 duration budget and the §6 route length, and must keep it stable thereafter.

---

## 10. World Illusion Strategy

The perceived world must greatly exceed the authored world.

**Techniques permitted and intended for v0.1:**
- **Inaccessible architecture.** Bridges, galleries, upper levels, and adjacent volumes modelled to be seen, never entered.
- **Implied occupation.** Lit windows, moving light, signage, and distant ambient sound that suggest the structure is in use, with zero NPCs or simulation.
- **Distant low-detail masses.** Neighbouring towers built as simplified geometry appropriate to their viewing distance.
- **Atmospheric perspective.** Fog and aerial haze used as a primary depth cue and as a budget mechanism.
- **Cloud and haze layers.** Used to truncate the world downward and imply unmodelled depth below the player.
- **Framed and controlled views.** Vistas composed by architecture, so that the extent and quality of distant geometry is authored for known sightlines rather than for free observation.
- **Truncation by design.** Where the world ends, architecture, atmosphere, or glazing must terminate the view deliberately.

**Constraints:**
- Distant geometry exists to support authored sightlines. It does not need to be correct from positions the player cannot reach.
- No procedural city generation.
- No streaming or open-world infrastructure.
- The illusion must hold under normal player behaviour, including looking in unintended directions from anywhere on the route.

---

## 11. Required Systems

These are the systems v0.1 actually requires. They are the only systems later tasks may assume.

**Gameplay**
- First-person character controller: walking, looking, gravity, collision, stairs/ramps.
- Fixed, realistic eye height with tuning exposed. The value itself is deferred to the Player Movement Specification (§9, §15).
- Basic traversal only. No sprint/crouch/jump requirement is asserted here; the player movement specification task will decide and justify, within the scale rules of §9.

**World**
- Static level geometry authored per beat, as Godot scenes under `game/world/`.
- Collision authored for the traversable route and its bounds.
- Non-playable architecture as separate, collision-free or bounded geometry.

**Rendering / Atmosphere**
- Forward+ renderer, per `docs/ARCHITECTURE.md`.
- Directional and baked/static lighting appropriate to each beat.
- Fog and atmospheric depth.
- Sky and distant environment.
- LOD and visibility management sufficient to keep the vista beats within budget.

**Audio**
- Per-space ambience playback.
- Per-space reverb characterization.
- Exposed tuning for ranges and levels, per `docs/CODING_RULES.md`.

**Support**
- Minimal debug tooling under `game/debug/` (position readout, performance readout) for development only.

All required systems must follow the directory responsibilities and the composition, tuning, and processing rules in `docs/ARCHITECTURE.md` and `docs/CODING_RULES.md`. Any system here that appears to require a new autoload, a new global event architecture, or a renderer change must be escalated per §10 of `AGENTS.md` rather than implemented.

---

## 12. Deferred Systems

Not part of v0.1. May be reconsidered only after the slice is playable and reviewed.

- Moving elevators and any vertical transport mechanic.
- Interaction system (doors, terminals, buttons). **Simple interaction may be added only if the experience is later proven to require it**, and only via a dedicated task.
- Save/load and checkpoints.
- Player HUD and menus beyond what is needed to launch and quit.
- Settings/options UI.
- Music and adaptive score.
- Dynamic audio systems, audio occlusion frameworks, runtime acoustics.
- NPCs, crowds, animation systems, and any character other than the player.
- Narrative delivery, audio logs, text, dialogue.
- Photo mode.
- Any form of scoring, objectives, or progression tracking.

---

## 13. Explicit Non-Goals

v0.1 does **not** include, and no task may add without explicit orchestrator approval:

- combat, weapons, damage, or death states
- multiplayer or networking
- vehicles
- crafting, skill trees, character customization
- inventory of any size
- quest or objective frameworks
- dialogue trees
- open-world or streaming world systems
- procedural city or building generation
- complex NPC AI
- destructible or heavily simulated environments
- a second playable location outside the defined route
- console, mobile, web, or handheld support
- any expansion of the traversable footprint beyond §6

The slice is not a demo of engine features. It is not a sandbox. It is not extensible content. It is a single, finished, four-beat experience.

---

## 14. Success Criteria

v0.1 is successful when all of the following are demonstrably true.

**Experience**
1. The slice has a defined beginning (Beat 1), progression (Beats 2–3), climax (Beat 4), and endpoint, and a player can traverse all four without instruction.
2. A first-time player completes the route in 10–15 minutes at an exploratory pace.
3. A first-time player looks upward within the first few seconds of entering Beat 2, without being prompted.
4. A first-time player, at the end of the slice, describes the world as much larger than the space they explored.
5. The player never becomes lost for more than a few seconds, with no UI wayfinding present.

**Scale**
6. Every monumental composition on the authored route contains a legible human-scale reference in the same frame.
7. The dominant spatial dimension escalates monotonically across the four beats.
8. Beat 1 reads as ordinary and restrained; it is not confused for a hero space.

**Art direction**
9. The slice reads as Corporate Futurism and does not depend on neon, holographic advertising, clutter, grime, or saturated colour for its identity.
10. Primary architectural form communicates scale before surface detail does.
11. Beat 4 presents at least three legible depth layers and towers reading at 800–1200 m.

**Audio**
12. The acoustic change at the Beat 1 → Beat 2 threshold is immediately noticeable.
13. Each beat has a distinct ambience and reverberation character consistent with its volume.

**Scope**
14. The traversable footprint remains within the bounds in §6.
15. No system from §12 or §13 has been implemented.

**Technical**
16. The slice runs on the selected target PC hardware at a stable frame rate, against budgets established by the performance benchmark methodology task (not yet defined — see `docs/PERFORMANCE_BUDGET.md`).
17. No Godot parser or runtime errors during a full playthrough.
18. The illusion of the larger world does not break when the player looks in unintended directions from any reachable position.

Criteria 1–15 are evaluable from greybox onward and are the primary guide for the greybox scale test. Criteria 9–11 require art passes. Criterion 16 requires the performance methodology task to define the budget first.

---

## 15. Open Questions / Deferred Decisions

These are intentionally unresolved. Each should be closed by a dedicated task, not by an implementation agent acting unilaterally.

1. **Player movement parameters.** Exact eye height, walk speed, acceleration, whether sprint or crouch exist, head-bob and camera behaviour. → *Define player movement specification.*
2. **Slice termination behaviour.** What happens when the player has reached the final vista and stops. Quiet hold, fade, return to menu. Currently undefined by design.
3. **Session start.** Whether v0.1 launches directly into Beat 1 or through a minimal launch screen.
4. **Beat 1 fiction.** Whether the arrival space is a lobby, transit arrival, service corridor, or security vestibule. Affects props and signage, not structure.
5. **Whether any simple interaction is required.** Currently assumed not. A door that must be opened, or a threshold that must be triggered, may prove necessary; if so it requires a dedicated task.
6. **Vertical circulation form in Beat 2.** Stair, ramp, escalator geometry, or a level entry that avoids vertical change entirely. Elevators remain excluded.
7. **Exterior time of day and weather.** Fixed and unchanging for v0.1, but the specific condition is not chosen. Affects lighting strategy across all four beats.
8. **Extent and construction of distant tower geometry.** Modelled masses, impostors, or a hybrid. Depends on the performance benchmark results.
9. **Whether the slice uses music.** Currently assumed silent.
10. **Target PC hardware specification.** Required before performance budgets in `docs/PERFORMANCE_BUDGET.md` can be made concrete.
11. **Precise atrium dimensions within the 60–100 m range**, and precise final-vista camera position and framing. To be fixed by the greybox scale test.

---

## 16. Relationship to the Roadmap

This document defines the target that `docs/ROADMAP.md` milestones M1–M7 build toward:

- **M1 Greybox** validates §4, §6, §9 and success criteria 1–8, 14–15.
- **M2 Exploration Systems** implements only §11, and only what the slice requires.
- **M3 Lighting Prototype** and **M5 Hero Scene** address §7 and criteria 9–11.
- **M6 Megacity Illusion** implements §10 and criteria 11, 18.
- **M7 Complete Vertical Slice** connects the four beats into the sequence defined in §4.
- **M8 Polish** addresses §8, criteria 12–13, and criteria 16–17.
