# FIRST PLAYABLE AREA LAYOUT

**Status:** APPROVED by Project Owner / Orchestrator (2026-08-29).

**Related documents:**

- `docs/VERTICAL_SLICE.md` — parent specification (four-beat sequence, scope bounds)
- `docs/PLAYER_MOVEMENT.md` — fixed player constants the layout is authored against
- `docs/GREYBOX_SCALE_TEST.md` — completed M1 evidence this layout carries forward
- `docs/WORLD_SCALE.md`, `docs/VISION.md` — inherited scale references (human → tower)
- `docs/PERFORMANCE_BENCHMARK.md` — benchmark viewpoint types mapped in §17
- `docs/ART_DIRECTION.md` — Corporate Futurism constraints (not implemented by this document)

---

## 1. Purpose and Authority

This document converts the approved Vertical Slice v0.1 and the completed M1 Greybox Scale
Test into one concrete spatial plan for the actual 10–15 minute playable slice. It defines
the route, its subspaces, distances, elevations, areas, reveal sequence, and wayfinding so
that a later production-greybox task can be built **without inventing major spatial
decisions**.

It is a layout specification, not an implementation plan. It creates no scenes, scripts,
assets, or project settings, and does not start production greyboxing.

**Experiential arc (binding for every design decision below):**

> ordinary → compressed → monumental → exposed → overwhelming

The route is authored and largely linear. The playable route must feel much smaller than
the architecture surrounding it. Visible/inaccessible architecture remains one of
MONOLITH's primary scale tools: the player is never given a large freely explorable level
simply because the visible architecture is large.

**Scope authority:** all figures in this document are **layout budgets** — approximate
planning values to be measured in-engine during the production greybox, not engine
coordinates. Where this document is more specific than `docs/VERTICAL_SLICE.md`, it is a
narrowing of that document for v0.1 only. Where a measurement later conflicts with a value
here, the conflict is reported to the Orchestrator — never silently resolved.

---

## 2. M1 Evidence Carried Forward

The completed M1 owner evaluation is treated as evidence. The successful scale concept is
**not redesigned**; the successful variables are preserved.

| M1 evaluation | Score | Design consequence in this layout |
|---|---:|---|
| Human Scale (Zone A) | 7/10 | **Targeted refinement:** Beat 1 carries a denser, consistent human-scale rhythm (see §6.3) — layout requirement, not prop density |
| Reveal (Zone C entry) | 8/10 | Preserve the compression-corridor → human-scale door → full-height reveal pattern unchanged |
| Atrium | 9/10 | Preserve ~80 m clear height and validated footprint proportion (§7.1) |
| Instinctive Upward Look | 10/10 | First atrium reveal must expose the full 80 m height at once (§7.4) |
| Scale References | 7/10 | **Targeted refinement:** explicit near-field anchor rules (§13), including a human-scale object within ~5–10 m of the atrium reveal position |
| Skybridge Height/Depth | 9/10 | Preserve bridge width reference (~6 m), 1.15 m rails, exposed depth below |
| Megatowers | 10/10 | Preserve 800–1200 m neighbour masses; no added complexity to "improve" them |
| Overall MONOLITH Feeling | 9/10 | Preserve overall structure: compression-before-reveal, elevated exterior transition, strong atmospheric depth |

**M1 measured facts reused as layout references** (from `docs/GREYBOX_SCALE_TEST.md`):

- Atrium clear height **80.0 m**; atrium footprint **80 × 64 m** (rated 9/10 — retained).
- 4 m wall-band module (19 bands read) — retained as the vertical rhythm module.
- Balconies alternating at 12/24/36/48/60/72 m; bridges ~20 m and ~45 m above floor.
- Skybridge 6 m wide, rails 1.15 m, posts every 4 m, two full-height pylons.
- Doors 2.2–2.5 m; parapets/rails 1.10–1.15 m; bench/planter blocks 0.40–0.45 m.
- Implied ground at 0 m; main floor at ~160 m; vista deck at 162.4 m — this layout keeps
  the same elevation band (§5).
- Stair collision as hidden ramp over visual steps (M1 gradient ~19.7°) — retained strategy;
  this layout designs all stairs at ≤ ~17° (§7.6, §9.1), below the de-facto maximum.
- M1 placeholder tower names (Meridian/Aster/Obsidian) are **greybox-only, not canon**;
  this document uses functional names only.

---

## 3. Player Constants (unchanged — binding)

The layout adapts to the player. The player does not adapt to the layout. No change to any
player constant is proposed by this document.

| Constant | Value | Source |
|---|---:|---|
| Eye height | 1.65 m | `docs/PLAYER_MOVEMENT.md` §5.2 |
| Walk speed | 2.0 m/s | `docs/PLAYER_MOVEMENT.md` §6.1 |
| Camera FOV | 70° vertical | `docs/PLAYER_MOVEMENT.md` §10.1 |
| Sprint / jump / crouch | none | `docs/PLAYER_MOVEMENT.md` §6.2–6.4 |

All proportions, door heights, rail heights, and vista framing in this document are judged
from 1.65 m eye height at 70° vertical FOV.

---

## 4. Route Overview and Budget Summary

One continuous, authored, non-branching route through four beats plus connective
circulation. Route travels generally **north** through Beat 1, enters the atrium through
its **south** face, crosses the atrium **south → north then east → west**, exits **west**
across the skybridge, bends **south** into the receiving volume, then turns **north**
through Beat 4 to face the final panorama **north/northwest**.

| Beat | Subspaces | Critical path | Floor area (main) | Character |
|---|---|---:|---:|---|
| 1 — Corporate Access | 1a–1e | ~147 m | ~635 m² | ordinary, human-scale, compressed |
| 2 — Monumental Atrium | 2a–2g | ~255 m | ~1,150 m² | monumental reveal + authored crossing |
| 3 — Elevated Transition | 3a–3d | ~185 m | ~1,070 m² | exposed, exterior depth |
| 4 — Final Vista | 4a–4d | ~105 m | ~860 m² | restrained → overwhelming climax |
| **Main route total** | | **~692 m** | **~3,715 m²** | |
| Optional pockets O1 + O2 | | ~35 m extra path | ~110 m² | dead ends, non-progressive |
| **Grand total (incl. optional)** | | **~727 m** | **~3,825 m²** | |

Budget compliance:

- Critical path ~692 m — within the ~680–700 m target (§15 records the timing tension).
- Traversable floor area ~3,825 m² — within the ~3,400–3,900 m² aim and ≤ ~4,000 m² cap.
- Optional exploration ~110 m² ≈ **3%** additional — far below the ≤ 25% bound.
- Playable vertical range 152–172 m = **20 m** — far below the ≤ ~120 m cap (§5).
- Visible space exceeds playable space in every beat (visible-space > playable-space
  principle); only a small fraction of the atrium volume is traversable (§7.7).

---

## 5. Elevation Strategy

The slice begins already high inside the host tower. The player never climbs from ground
level; no elevator is required to explain arrival — the slice simply begins on that level.
The general M1 scale is kept rather than a new elevation.

**Coordinate convention (layout budget values, not engine coordinates):** implied ground
slab top = **0 m** (never walkable, truncated by atmosphere/lower structure). All playable
floors sit high in the host tower.

| Surface | Elevation | Notes |
|---|---:|---|
| Implied ground | 0 m | Never walkable; obscured by haze/lower structure |
| Beat 1 floor (1a–1e) | **152 m** | Flat throughout; thresholds only |
| Atrium floor (2a–2d) | **152 m** | Flat entry — preserves the validated M1 reveal |
| Atrium clear top (roof glazing) | 232 m | 80 m clear height above atrium floor |
| Egress gallery (2f–2g) | **166 m** | +14 m via north stair |
| Skybridge deck / transfer node / receiving gallery / concourse / threshold (3a–3c, 4a–4c) | **166 m** | Flat; the M1-proven exposure band |
| Final vista overlook (4d) | **172 m** | +6 m via broad stair inside the chamber approach |

- **Playable vertical range: 152 → 172 m = ~20 m** (lowest to highest walkable surface),
  comfortably within the ≤ ~120 m budget. All vertical change is made on foot via two
  stair sequences (+14 m in Beat 2, +6 m in Beat 4).
- Beat 1/atrium floor at 152 m sits in the proven "main arrival/atrium floor ~150–180 m"
  band; skybridge deck at 166 m sits in the "160–190 m" elevated-transition band.
- Neighbouring megastructure masses (~880 / ~1030 / ~1150 m) continue hundreds of metres
  above the player at every exterior view; the host tower's own structure also continues
  far above the atrium roof.
- A recessed light well beside the atrium causeway drops ~6 m below the walking surface
  (146 m); it is railed, lit, and **not walkable or accessible** — it is a depth cue, not
  playable vertical range.

---

## 6. Beat 1 — Corporate Access / Human Scale

**Purpose:** establish believable ordinary architecture and the player's own size, so that
every later scale is meaningful. This space must feel designed, expensive, and controlled —
but intentionally not spectacular. It must not be confused for a hero space.

### 6.1 Sub-sequence and budgets

| # | Subspace | Path | Floor level | Area | Key dimensions |
|---|---|---:|---:|---:|---|
| 1a | Arrival vestibule | ~12 m | 152 m | ~80 m² | ~10 × 8 m, ceiling 3.2 m |
| 1b | Access lobby | ~18 m | 152 m | ~240 m² | ~20 × 12 m, ceiling 3.4 m (local ~4.0 m over reception zone) |
| 1c | Access corridor (dog-leg) | ~55 m | 152 m | ~165 m² | width 3.0 m, ceiling 2.8–3.0 m, two 90° turns |
| 1d | Transfer corridor | ~38 m | 152 m | ~95 m² | width 2.5 m, ceiling 2.8 m |
| 1e | Compression run | ~24 m | 152 m | ~55 m² | width 2.2 m, ceiling 2.6 m, straight run |

**Beat 1 totals: ~147 m critical path, ~635 m² floor area.**

### 6.2 Spatial requirements

- Ceilings **mostly 2.8–3.5 m** (within the approved 2.6–4.5 m range); the reception zone
  may reach ~4.0 m; the final compression run drops to **2.6 m**.
- Corridor widths **mainly 2.5–3.5 m**; the final compression run narrows to **2.2 m** —
  an intentional chokepoint with M1 precedent (M1 used 2.0 m × 2.7 m successfully).
- Multiple turns; short and medium sightlines only. The dog-leg in 1c forces the route
  away from any direct run toward the atrium.
- **No exterior vista. No atrium visibility. No megatower visibility.** Beat 1 has no
  exterior glazing; all openings face interior circulation.
- The space reads as ordinary, institutional, and slightly institutional-expensive:
  restrained composition, controlled palette, low prop density.
- The compression run (1e) **substantially limits the player's field of view** immediately
  before Beat 2: 2.2 m width × 2.6 m ceiling for its final ~22 m, ending in a **1.6 × 2.5 m
  reveal door** with a ~4 m tall structural baffle just inside — no atrium sightline exists
  until the threshold is crossed (the exact M1 reveal mechanism).

### 6.3 Human-scale rhythm (addresses M1 Human Scale 7/10)

Beat 1 must contain **more consistently readable human-scale rhythm than the M1 test
lobby**. The following repeated architectural anchors are **layout requirements** (they
must have reserved positions in the production greybox); they are not art production and
must not become decorative prop noise:

- Doors/openings **2.2–2.5 m** at a regular rhythm (roughly every 8–12 m of corridor:
  sealed service doors, glazed office openings, inspection hatches).
- Rails **1.0–1.15 m** at the lobby edges, planter surround, and any level change.
- Ceiling bays with a legible service-grid rhythm (~3 m module) in lobby and corridors.
- At least one **seating niche** in the lobby and one in the access corridor widening.
- A reception/security-sized counter or block at **1.05–1.10 m** working height in 1b.
- Wall recesses framed at **2.4 m** heads (joinery-scale, not monumental).
- Structural bays at a **5–6 m** rhythm readable along the corridors.
- Signage **positions** at human reading height (~1.5–1.7 m centre) at each turn decision
  point — layout positions only; no content, branding, or text is designed here.

### 6.4 Wayfinding without UI

Architectural wayfinding only: a lit lobby opening beyond the vestibule; a clearly lit
corridor mouth past the reception block; restrained signage plates at 1c/1d decision
points; a bright threshold slit at the far end of 1d; the reveal door's light seam at the
end of 1e. The player must never be uncertain about forward direction for more than a few
seconds.

---

## 7. Beat 2 — Monumental Atrium

**Purpose:** the first architectural reveal and the slice's monumental core. The player
must instinctively look upward within the first few seconds of entry.

### 7.1 Footprint decision — retain the validated M1 proportion (Option A)

This layout **explicitly retains the validated ~80 × 64 m atrium footprint and the ~80 m
clear height**. Reason: the M1 atrium was rated **9/10** and the reveal **8/10**; the
footprint's deviation from an earlier suggested proportion was reviewed by the owner and
judged sound (`docs/GREYBOX_SCALE_TEST.md` limitation 1). Redesigning a 9/10 space to
satisfy a superseded suggestion would be risk without benefit. No proportional refinement
is proposed.

- Atrium interior footprint: **80 m (north–south) × 64 m (east–west)**.
- Clear height: **80 m** (floor 152 m → clear top 232 m).
- Entrance: a human-scale reveal door in the **south face**.
- Egress: the **northwest corner** at 166 m.

### 7.2 Scale language (preserve or improve M1)

The atrium must not read as an empty rectangular box. Required elements, all inaccessible
except where stated:

- **20 wall bands on the 4 m module** (M1: 19 readable bands) doubling as a vertical ruler.
- **Six inaccessible balconies** (~30 m wide, 1.1 m parapets) alternating sides at
  **12/24/36/48/60/72 m** above the atrium floor (the M1 rhythm).
- **Two inaccessible bridges** at **~20 m** and **~45 m** above the floor, 1.1 m rails.
  The ~20 m bridge lands on the pier mass that the route passes through (§7.3).
- **Four full-height columns (4 × 4 m) on plinths**, defining the column lines the
  causeway crosses.
- **Rows of glazing and wall openings** on the upper walls (~29 m and ~45 m up) implying
  occupied, inaccessible levels; **mullioned roof glazing** at the clear top.
- Repeated **~4 m floor/structural rhythm** on the walkable surfaces (floor bands, apron
  tiling, stair landings) so vertical distance stays readable everywhere.
- **Close 1.1 m railings** on every walkable edge; **nearby human-size doors** (2.2–2.5 m)
  in the atrium walls; **seating/reference blocks** (bench ~0.45 m, planter ~0.40 m) at the
  apron and promenade; **readable glazing subdivisions** (mullion rhythm) on upper glazing.

### 7.3 Route concept (~255 m)

The player must **not** simply walk straight across an empty giant floor. The authored
sequence:

| # | Subspace | Path | Level | Area | Function |
|---|---|---:|---:|---:|---|
| 2a | Reveal apron | ~12 m | 152 m | ~120 m² | reveal position; eye adjusts; anchors near field |
| 2b | East promenade | ~65 m | 152 m | ~340 m² | edge route north along the east wall; two seating bays; full volume always in view to the west |
| 2c | Column causeway | ~45 m | 152 m | ~200 m² | turns west; crosses between the column lines over the railed ~6 m deep light well; 4.5–5 m wide |
| 2d | Pier passage | ~30 m | 152 m | ~130 m² | compression pulse: a ~10–12 m long, ~5 m wide, ~4 m tall opening through the base of the pier carrying the lowest bridge |
| 2e | North stair | ~68 m | 152 → 166 m | ~220 m² | broad ceremonial stair, two ~7 m flights against the north wall with a mid landing; gains **14 m** |
| 2f | Egress gallery | ~30 m | 166 m | ~130 m² | elevated gallery running west along the north edge, **looking back south across the atrium** |
| 2g | Egress portal | ~5 m | 166 m | ~10 m² | compressed portal (~2.2 × 2.6 m) in the northwest corner |

Only a small fraction of the visible atrium volume is traversable; the player experiences
the volume from two meaningfully different elevations and angles (floor route at 152 m;
egress gallery at 166 m looking back); no jump or traversal mechanic is required anywhere;
the upper architecture remains overwhelmingly inaccessible.

### 7.4 Reveal rule (preserves Instinctive Upward Look 10/10)

Crossing the reveal door, the full **80 m clear height must be exposed at once** (the M1
mechanism: entry around the interior baffle). The reveal apron is a low, open slab; nothing
hangs low over the entry axis. Benchmark viewpoints 2 and 4 both sit here (§17).

### 7.5 Scale reference rules for the atrium (addresses M1 Scale References 7/10)

- At the main reveal position (2a), at least one strong human-scale reference must be
  visible **within ~5–10 m** of the player: a planter block with a **1.10 m rail** at ~4 m,
  a **0.45 m bench** at ~7 m, and a **2.4 m service door** in the atrium wall at ~9 m.
- Every monumental view from the route (promenade, causeway, stair, gallery) keeps at least
  one legible near-field human anchor in frame: railing, floor bands, bench, door, or
  parapet.
- The 4 m wall bands, balcony parapets, bridge rails, and stair landings keep vertical
  distance legible from every route position — the bands are the atrium's height ruler.
- These are anchor-placement rules for the production greybox, not prop-density demands;
  architecture remains primary.

### 7.6 Stair geometry

North stair: two flights of ~7 m rise, ~23 m run each (~30% grade, ≈ **17°**), mid landing
~10 m, total path ~68 m. Visual steps over hidden ramp collision per
`docs/PLAYER_MOVEMENT.md` §9; below the M1 de-facto ~19.7° maximum. Traversable at
2.0 m/s without stalling (M1-proven pattern).

### 7.7 Traversability share

Traversable atrium surface ≈ 2a–2g ≈ **~1,150 m² of the 5,120 m² floor plate (~22%)**, and
well under 2% of the enclosed 80 m-high volume. The remaining visible volume — balconies,
bridges, upper galleries, opposite wall, roof glazing — is authored to be looked at and
never entered.

---

## 8. Beat 3 — Elevated Transition / Skybridge

**Purpose:** convert interior monumentality into exterior scale and establish that the
host tower is only one element of a larger complex. Preserves the M1-proven height/depth
sensation (9/10).

### 8.1 Sub-sequence and budgets

| # | Subspace | Path | Level | Area | Key dimensions |
|---|---|---|---:|---:|---|
| 3a | Bridge approach | ~15 m | 166 m | ~60 m² | interior pressure transition; narrows 3.0 → 2.4 m; ceiling 2.8 m |
| 3b | Skybridge | ~130 m | 166 m | ~780 m² | **130 m long × ~6 m wide**, exterior glazed, flat deck |
| 3c | Transfer node | ~18 m | 166 m | ~120 m² | enclosed structural node; **90° bend to the south** |
| 3d | Receiving gallery | ~22 m | 166 m | ~110 m² | interior, ~5 m wide, re-entry into the destination volume |

**Beat 3 totals: ~185 m critical path, ~1,070 m² floor area.** The 130 m primary span is
substantially longer than the M1 40 m bridge (within the suggested 120–140 m band) while
the bend and receiving gallery break monotony.

### 8.2 Bridge design requirements

- Walking surface elevation **166 m** above implied ground — within the 160–190 m target,
  in the M1-proven band (M1 vista deck: 162.4 m).
- Keep the **~6 m bridge width** as the M1 reference; **rails at 1.15 m**; **posts/structural
  frames every ~4 m** producing continuous near-field parallax (M1 rhythm); two or three
  full-height pylons dropping the full ~166 m.
- Strong visible depth **beneath and beside** the player: the host tower flank falling away
  on the east; lower complex roofs and a **lower crossing bridge ~60 m below** on the south
  side; mid-distance and far atmospheric layers beyond.
- No branching, no traversal mechanic, no fall hazard; ground never reachable.

### 8.3 Critical reveal rule — the skybridge must NOT spoil Beat 4

> The skybridge communicates: "This complex is enormous."
> The final vista communicates: "This entire world is enormous."

**Orientation strategy (decided here):** the bridge axis runs **west**; the hero tower
group lies to the **north/northwest**. The bridge's **north side** is closed by the close
flank of the destination volume at ~25–40 m with full-height **4 m structural frames** —
the hero composition is withheld behind it for the entire bridge traverse. The **south
side is open**: depth below, the lower crossing bridge, near/mid complex layers, and only
**partial, non-hero** far silhouettes. Looking back east shows the host tower flank and the
atrium's exterior — allowed, but not the hero composition.

The transfer node's 90° southward bend plus the receiving gallery and Beat 4's northbound
concourse rotate the player's visual axis so the final vista (facing **north/northwest**)
sits **~90°** off the dominant bridge view (west). That angle is a **composition target**,
not an engine constant. The receiving architecture — not a UI or trigger — performs the
withholding.

---

## 9. Beat 4 — Final Vista

**Purpose:** the climax and endpoint; the largest implied scale in the slice. The 3–4
minute Beat 4 experience **includes observation time**; it does not require 3–4 minutes of
pure walking (the ~105 m approach walks in under a minute).

### 9.1 Sub-sequence and budgets

| # | Subspace | Path | Level | Area | Character |
|---|---|---:|---:|---:|---|
| 4a | Receiving corridor | ~25 m | 166 m | ~100 m² | darkens and compresses; ceiling 3.0 m, width 4 m |
| 4b | Terminal concourse | ~30 m | 166 m | ~300 m² | restrained, dim corporate concourse, ~13 m wide, ceiling ~4.5 m |
| 4c | Framed threshold | ~10 m | 166 m | ~40 m² | slit-like framed opening (~6 m wide) at the concourse's north end |
| 4d | Observation chamber | ~40 m | 166 → 172 m | ~420 m² | approach includes a ~20 m broad stair gaining **+6 m** (≈17°) to the overlook rail line |

**Beat 4 totals: ~105 m critical path, ~860 m² floor area.**

### 9.2 The final view

The observation chamber opens **north/northwest** through full-height glazing. The approach
conceals the hero view until close: the receiving corridor darkens, the concourse holds the
player with its back to the hero direction, and the framed threshold is the last
chokepoint before the reveal — **darker interior foreground, bright exterior beyond,
architecture framing the panorama, a threshold before the full reveal**.

The final view must be the **strongest composition in the slice**:

- **3+ depth layers** beyond the glazing: near complex structure (~100–300 m out),
  mid-distance towers (~500–900 m out), far atmospheric masses (~1,300–2,000 m out).
- Neighbouring towers reading at **~800–1200 m** (the M1-proven trio: ~880, ~1030,
  ~1150 m — placeholder identities only), positioned north/northwest.
- Enormous depth below (the deck sits at 172 m with structure and a cloud/haze layer
  truncating the world downward) and megastructure continuing **far above** the player.
- Atmospheric perspective and a cloud/haze layer below the player.
- Architecture visibly continuing past the frame edges.
- **Human-scale interior foreground in the same frame:** a 1.10 m rail line, seating
  blocks (~0.45 m), floor bands, and a 2.4 m side door — so the comparison happens inside
  one camera view at 1.65 m eye height / 70° FOV.

Megatowers already scored **10/10** at M1. This layout adds **no complexity** to them;
production art (silhouette, material identity) improves them later. The exact final
composition is refined in the production greybox against the framing constraints above.

Endpoint: the slice is complete when the player stands at the overlook rail with the
composed view available. Formal session termination is deferred (`VERTICAL_SLICE.md` §15.2).

---

## 10. Optional Exploration

Small, dead-end, non-progressive. Both pockets return to the main route. They reward
curiosity with a view or a detail — never progression, never mechanics.

| # | Pocket | Location | Area | Reward | Rules |
|---|---|---|---:|---:|---|
| O1 | Records niche | off 1b Access lobby | ~50 m² (6 × 8 m) | a human-scale detail: a recessed wall of sealed access panels at reading height, a bench | one door, same door out; no view of atrium/exterior |
| O2 | Secondary viewing bay | off 4b Terminal concourse, east side | ~60 m² (5 × 12 m) | a **secondary** exterior composition — adjacent flank and lower depth, not the hero panorama | bay window, dead end, cannot see the final vista framing |

Combined optional area ~110 m² ≈ **3%** of main-route area (bound: ≤ 25%; aim: substantially
less). No alternate progression routes anywhere.

---

## 11. Wayfinding / Visual Destinations

No objective marker or UI anywhere. Every segment gives the player a visible destination
before asking them to travel toward it.

| Location | Visible destination (what draws the player forward) | What blocks premature views | Next reveal |
|---|---|---|---|
| 1a Arrival vestibule | Lit lobby opening beyond a glazed screen | Solid vestibule walls | Access lobby |
| 1b Access lobby | Lit corridor mouth past the reception block | Dog-leg wall blocks through-view | Access corridor |
| 1c Access corridor | Signage plate + lit portal at the far end of each leg | Turns break all long sightlines | Transfer corridor |
| 1d Transfer corridor | Bright threshold slit ahead | Solid walls; no glazing | Compression run |
| 1e Compression run | The reveal door's light seam | 2.2 × 2.6 m section; baffle behind door | **Full atrium reveal** |
| 2a Reveal apron | The full 80 m void; the east promenade lit along the wall | Baffle blocks the corridor's view; north stair mass blocks the egress level | Atrium volume |
| 2b East promenade | Causeway head and the north stair mass, lit | Balcony massing blocks the egress portal until close | Causeway |
| 2c Column causeway | The pier mass and its lit passage opening | Light-well rails frame the view; pier blocks the north stair | Pier passage |
| 2d Pier passage | Lit stair hall beyond the pier | Pier mass surrounds; no atrium sightline | North stair |
| 2e North stair | Upper landing light + the gallery mouth | Stairwell walls enclose until the landing | Egress gallery — atrium from above |
| 2f Egress gallery | Bright egress portal at the gallery's west end | Parapet + floor edge keep eyes in the volume | Portal / Beat 3 |
| 3a Bridge approach | Glazed bridge daylight beyond the pressure transition | Enclosed approach walls | **Skybridge exposure** |
| 3b Skybridge | The receiving mass dead ahead (west); open depth south | Destination flank + frames block the north hero view | Transfer node |
| 3c Transfer node | The receiving gallery mouth, lit | Node walls close the bridge view | Receiving gallery |
| 3d Receiving gallery | The dark receiving-corridor mouth | No exterior opening on the hero bearing | Receiving corridor |
| 4a Receiving corridor | Faint concourse glow ahead | Darkening; walls close in | Terminal concourse |
| 4b Terminal concourse | Framed-threshold glow at the north end | Concourse's north wall is solid until the threshold | Framed threshold |
| 4c Framed threshold | A bright exterior slit through the frame | Frame edges crop the view to a slit | **Final vista** |
| 4d Observation chamber | The full north/northwest panorama | — (endpoint) | Session endpoint |

---

## 12. Reveal Discipline

Explicit visibility rules; every reveal must be stronger than the one before it.

| Beat | May show | Must NOT show |
|---|---|---|
| 1 | interior human-scale architecture | atrium, exterior skyline, hero towers |
| 2 | internal monumental architecture (full 80 m void, balconies, bridges, roof glazing) | final exterior hero composition |
| 3 | exterior depth, neighbouring structure, lower crossing bridge, **partial** non-hero silhouettes | the final hero tower composition (blocked by destination flank + frames, §8.3) |
| 4 | **full final panorama** — primary megatowers, full atmospheric depth hierarchy | — (climax; endpoint) |

Reveal escalation: human-scale rooms (1) → one 80 m void (2) → hundreds of metres of
exterior depth (3) → a kilometre-scale world (4). The compression run before 2a and the
framed threshold before 4d are the two hard chokepoints enforcing the sequence; bridge
orientation and receiving architecture enforce the Beat 3 withholding.

---

## 13. Scale Anchor Rules

Directly addressing the M1 Scale References 7/10 result. These are **layout rules**, not
decorative prop-density requirements; architecture remains primary.

1. **Major thresholds use human-size doors/openings** — 2.2–2.5 m throughout (reveal door
   1.6 × 2.5 m; egress portal 2.2 × 2.6 m; Beat 4 framed threshold ~6 m wide but human-cut
   by its frame proportions).
2. **Railings remain ~1.1 m** (1.10 m interior; 1.15 m on the skybridge) on every exposed
   edge and every balcony parapet — including the inaccessible ones.
3. **Atrium reveal keeps a human-scale object within ~5–10 m** of the reveal position
   (planter + 1.10 m rail at ~4 m; bench at ~7 m; 2.4 m door at ~9 m).
4. **Repeated vertical modules stay legible in the atrium** — 4 m wall bands (20 of them),
   balcony stack at 12 m intervals, bridge rails, floor bands, stair landings.
5. **The skybridge uses near frames/posts/mullions (~4 m rhythm) for parallax** against
   mid and far layers, with visible depth below.
6. **The final vista retains human-scale foreground architecture in the same frame** as the
   panorama (§9.2).
7. Every monumental frame on the route contains at least one element from the human end of
   the hierarchy (human → door → room → atrium → building → megastructure).

---

## 14. Route Budget Table

Master budget. All values are approximate layout budgets, not engine measurements; no
false precision.

| Beat | Subspace | Path (m) | Elevation (m) | Floor area (m²) | Purpose | Reveal / destination |
|---|---|---:|---:|---:|---|---|
| 1 | 1a Arrival vestibule | ~12 | 152 | ~80 | arrival, containment | lit lobby opening |
| 1 | 1b Access lobby | ~18 | 152 | ~240 | human-scale baseline | lit corridor mouth |
| 1 | 1c Access corridor (dog-leg) | ~55 | 152 | ~165 | controlled circulation, turns | lit transfer portal |
| 1 | 1d Transfer corridor | ~38 | 152 | ~95 | narrowing, institutional tone | bright threshold slit |
| 1 | 1e Compression run | ~24 | 152 | ~55 | FOV constriction | reveal door light seam |
| 2 | 2a Reveal apron | ~12 | 152 | ~120 | first reveal, full 80 m | atrium volume |
| 2 | 2b East promenade | ~65 | 152 | ~340 | edge route, volume experience | causeway + stair mass |
| 2 | 2c Column causeway | ~45 | 152 | ~200 | cross-volume over light well | pier + passage |
| 2 | 2d Pier passage | ~30 | 152 | ~130 | compression pulse inside atrium | lit stair hall |
| 2 | 2e North stair | ~68 | 152→166 | ~220 | +14 m procession | atrium from above |
| 2 | 2f Egress gallery | ~30 | 166 | ~130 | second elevation, look back | bright egress portal |
| 2 | 2g Egress portal | ~5 | 166 | ~10 | transition | bridge approach light |
| 3 | 3a Bridge approach | ~15 | 166 | ~60 | pressure transition | glazed daylight beyond |
| 3 | 3b Skybridge | ~130 | 166 | ~780 | exposure, complex scale | receiving mass ahead |
| 3 | 3c Transfer node | ~18 | 166 | ~120 | 90° bend, re-orientation | gallery mouth |
| 3 | 3d Receiving gallery | ~22 | 166 | ~110 | re-entry, recalibration | dark corridor mouth |
| 4 | 4a Receiving corridor | ~25 | 166 | ~100 | darkening, compression | faint concourse glow |
| 4 | 4b Terminal concourse | ~30 | 166 | ~300 | restrained terminal arrival | threshold glow |
| 4 | 4c Framed threshold | ~10 | 166 | ~40 | final chokepoint | bright exterior slit |
| 4 | 4d Observation chamber | ~40 | 166→172 | ~420 | climax, final panorama | full vista (endpoint) |

**Sums:** path 147 + 255 + 185 + 105 = **~692 m** (target ~680–700 ✓). Floor area
635 + 1,150 + 1,070 + 860 = **~3,715 m²** main; + ~110 m² optional = **~3,825 m²** total
(aim ~3,400–3,900 ✓, cap ≤ ~4,000 ✓; optional ≈ 3% ≤ 25% ✓). Playable vertical range
152–172 = **~20 m** ≤ ~120 m ✓.

---

## 15. Traversal Timing and the ≥ 6:00 Requirement

**Recorded explicitly — do not resolve by tuning the player.**

- The layout targets **~680–700 m critical-path centerline**; this plan sums to **~692 m**.
- At the fixed 2.0 m/s walk speed, the pure centerline walk is **692 / 2.0 = 346 s ≈
  5 min 46 s** — **below** the `VERTICAL_SLICE.md` §3 requirement of **≥ 6 minutes** direct
  traversal, before any cornering, stair, or alignment cost.
- **Later production-greybox measurement must confirm ≥ 6:00 direct traversal** in-engine
  (M1 method: scripted physics walk of the full route). M1 measured a real path ~0.5%
  longer than its centerline estimate, so cornering/stairs may close some of the 14-second
  gap — but that is a measurement, not an assumption.
- **If measured direct traversal remains below 6:00, report the conflict to the
  Orchestrator.** Do **not** silently change player speed (`PLAYER_MOVEMENT.md` §6.1), and
  do **not** silently expand the route beyond the approved `VERTICAL_SLICE.md` §6 scope
  (~400–700 m; this plan sits at the top of that range). Do **not** modify
  `docs/VERTICAL_SLICE.md` to resolve this arithmetic tension without Orchestrator review.
- Exploratory-duration targets remain comfortably achievable: ~692 m of walking plus the
  Beat 4 observation window and per-beat dwell time lands well inside 10–15 minutes, and
  the optional pockets add only ~35 m of path against the 18-minute exploration cap.

---

## 16. Diagrams

Communication tools only — not to scale, not engine coordinates.

### 16.1 Logical top-down route diagram

```text
Compass: route travels generally N through Beat 1, enters the atrium through
its S face, crosses it S->N then E->W, exits W on the skybridge, bends S into
the receiving volume, then turns N again to face the final panorama.

                                            N
                                            ^
                     [O1 records niche]     |
                         (dead end)         |
  SPAWN                                     |
    v                                       |
+--------------------------------------------------------------+
| BEAT 1 — Corporate Access (floor 152 m)                      |
|                                                              |
| [1a vestibule] > [1b access lobby] > [1c dog-leg corridor]   |
|        |              |                     |          |     |
|        |         [O1 niche]           (90 deg)    (90 deg)   |
|        |         (dead end)               v          v      |
|        |                        [1d transfer corridor]       |
|        |                              |                      |
|        |                              v                      |
|        |                        [1e compression run]         |
|        |                              |  2.2 m wide          |
+---------------------------------------|----------------------+
                                        v
                              [reveal door 1.6 x 2.5 m]
                                        |
+--------------------------------------------------------------+
| BEAT 2 — ATRIUM, 80 m clear (floor 152 m, top 232 m)         |
|                                                              |
|   [2a reveal apron] > [2b east promenade] > [2c causeway]    |
|      (VP-2/VP-4)         |                  (VP-3)  |        |
|                          v                          v        |
|                   [seating bays]            [2d pier passage]|
|                                                     |        |
|                                                     v        |
|                                             [2e north stair] |
|                                               +14 m -> 166 m |
|                                                     |        |
|                                                     v        |
|                                      [2f egress gallery]     |
|                                          (looks back S)      |
|                                                     |        |
|                                              [2g portal]     |
+----------------------------------------------------|---------+
                                                     v
+--------------------------------------------------------------+
| BEAT 3 — Elevated Transition (deck 166 m)                    |
|                                                              |
| [3a bridge approach] > [3b SKYBRIDGE 130 m x 6 m, runs W]    |
|      (airlock)          N side: flank + 4 m frames block     |
|                         the hero view for the whole span     |
|                                   |                          |
|                                   v                          |
|                     [3c transfer node: 90 deg bend S]        |
|                                   |                          |
|                                   v                          |
|                     [3d receiving gallery, runs S]           |
+--------------------------------------------------------------+
                                  |
                                  v
+--------------------------------------------------------------+
| BEAT 4 — Final Vista (166 -> 172 m)                          |
|                                                              |
| [4a receiving corridor, darkens] -- runs W                   |
|            |                                                 |
|            v                                                 |
| [4b terminal concourse] -- runs N      [O2 bay window]       |
|            |                            (E-facing secondary  |
|            v                             view, dead end)     |
| [4c framed threshold]                                        |
|            |                                                 |
|            v                                                 |
| [4d observation chamber] -- broad stair +6 m                 |
|            |                                                 |
|            v                                                 |
| [FINAL VISTA @ 172 m, faces N/NW]  --  END                   |
+--------------------------------------------------------------+
```

### 16.2 Elevation diagram

```text
Elevation above implied ground (m) — not to scale

 1150 |   C                          neighbour crowns (M1 placeholder masses,
 1030 |     B                        ~880 / ~1030 / ~1150 m; NOT walkable)
  880 |  A
      |  A    B    C                 neighbouring towers continue hundreds of
      |  :    :    :        <-+     metres above the player everywhere outside
      |  :    :    :          |
  232 |..:....:....:..........:.......................  atrium clear top
      |  :    :    :          |   (roof glazing; 80 m above atrium floor)
      |  :    :    :          |
  172 |  :    :    :          |          +--------+    FINAL VISTA overlook (172 m)
      |  :    :    :          |          | chamber|    (highest walkable surface)
      |  :    :    :          |          +---+====+      1.10 m overlook rail
  166 |  :    :    :==========|==============+           skybridge deck (Beat 3) =
      |  :    :    :          |     [ 2f egress gallery ]  egress gallery (Beat 2 end)
      |  :    :    :          |          (166 m, flat deck)
      |  :    :    :          |
      |  :    :    :          |      [ 2e north stair: 152 -> 166 inside the atrium ]
      |  :    :    :          |
  152 |##:####:####:##########|#################  BEAT 1 floor = ATRIUM floor (152 m)
      | ############          |  ##########      (lowest walkable surface; start)
      |      :  [ 2c causeway light well: ~6 m recess, railed, NOT walkable ]
    0 |===============================================  implied ground (0 m,
                                                            never walkable)
        Beat 1      |    atrium void      |   host tower flank drops
        interior    |    (80 m clear)     |   152+ m below the skybridge
```

---

## 17. Performance Benchmark Viewpoint Mapping

`docs/PERFORMANCE_BENCHMARK.md` §9 defines six viewpoint types. The layout preserves an
equivalent named location for each. **No benchmark tooling is implemented by this
document**; the M1 greybox remains the provisional workload until representative content
exists.

| # | Benchmark viewpoint type | Named location in this layout |
|---|---|---|
| 1 | Human-scale interior | **1b Access lobby** (Beat 1) |
| 2 | Atrium reveal | **2a Reveal apron**, standing at the compression-threshold reveal door |
| 3 | Atrium cross-volume view | **2c Column causeway**, mid-span looking across the void |
| 4 | Atrium upward view | **2a Reveal apron** (alternately 2b promenade start), pitched up at the 80 m clear height |
| 5 | Skybridge midpoint | **3b Skybridge**, mid-span |
| 6 | Final vista | **4d Observation chamber**, at the overlook rail line (172 m) |

The deterministic benchmark route, when the layout is built, follows the §14 subspace
order; per `PERFORMANCE_BENCHMARK.md` §9–10, exact coordinates are recorded with the first
benchmark result against the eventual scene.

---

## 18. Production Greybox Implications

The eventual production greybox task must preserve, from this document:

1. **Validated player constants** — 1.65 m eye height, 2.0 m/s walk, 70° vertical FOV, no
   sprint/jump/crouch. The layout adapts to the player, never the reverse.
2. **Route centerline budget** — ~680–700 m planned; measured direct traversal must be
   confirmed ≥ 6:00 in-engine (§15 escalation rule if not).
3. **Atrium 80 m scale** — 80 m clear height, ~80 × 64 m footprint, flat floor-level entry.
4. **Compression/reveal sequencing** — Beat 1 chokepoints (1e) and the reveal door + baffle
   mechanism; no atrium/exterior sightline in Beat 1.
5. **Final vista withholding** — bridge-side flanking architecture and Beat 4's darkened
   approach keep the hero composition hidden until the framed threshold (§8.3, §9).
6. **Benchmark positions** — the six named locations of §17 must exist and remain
   representable.
7. **Visible-space > playable-space principle** — inaccessible balconies, bridges,
   galleries, and neighbouring masses dominate every large view.
8. **No traversal mechanics** — walking only; no jump/crouch/sprint requirements; no
   elevator; the slice simply begins at 152 m.
9. **Simple collision** — box/concave-static collision for the route; **hidden ramp
   collision under visual stair steps** where used (both stair sequences), per
   `docs/PLAYER_MOVEMENT.md` §9; authored gradients ≤ ~17°.
10. **Human-scale anchor placement** per §6.3 and §13 — positions are layout requirements.
11. **Near/mid/far atmospheric depth** at every exterior view (Beat 3 south side, Beat 4
    panorama), including the lower crossing bridge and cloud/haze truncation below.

This document does **not** design the architecture kit (Roadmap M4), materials, or lighting.

---

## 19. Explicit Non-Goals

This task does **not** design or implement:

- production architecture meshes, materials, or textures
- detailed lighting or audio implementation
- interaction; doors that open; elevators
- NPCs, narrative, lore, or company branding
- UI, objectives, collectibles, or gameplay systems
- automated benchmarking, streaming, LOD, or occlusion systems
- city generation
- an architecture kit design

No lore names are invented for the host tower or any corporation; all names here are
functional. (M1's Meridian/Aster/Obsidian remain greybox placeholders, not canon.)

---

## 20. Open Questions

Only genuinely unresolvable decisions are deferred; route structure, distances, elevations,
reveal sequence, atrium scale, skybridge position, vista orientation, and benchmark mapping
are **decided in this document**.

1. **Beat 1 fiction** — arrival lobby vs. transit arrival vs. security vestibule
   (`VERTICAL_SLICE.md` §15.4). Affects props and signage only; the spatial structure above
   is fixed either way.
2. **Exact production material palette** — deferred to the Architecture Kit / art tasks
   (M4/M5 per `docs/ROADMAP.md`).
3. **Exact final tower silhouettes and distant-city mass placement** — height bands
   (~880/~1030/~1150 m) and bearings (north/northwest) are fixed here; exact forms are
   refined during M6 Megacity Illusion.
4. **Formal session termination** at the final vista — deferred by design
   (`VERTICAL_SLICE.md` §15.2).
5. **Audio implementation** — per-beat acoustic characters are specified in
   `VERTICAL_SLICE.md` §8; their implementation is a later audio task (M8).
