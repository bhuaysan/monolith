# ACTIVE TASK — Plan First Playable Production Greybox

**Status:** DELIVERABLE COMPLETE — pending Orchestrator review (2026-08-29). `docs/PRODUCTION_GREYBOX_PLAN.md` has been written; documentation/planning work for this task is **complete**. **No implementation is authorized** — no Phase 0 work, no scenes, scripts, assets, or project-settings changes may begin until the Orchestrator reviews and approves the plan. Each approved phase (0–5) will then stop for review before the next begins.

## Specification

**Type:** Documentation / planning only. No Godot scenes, scripts, assets, or project.godot changes.

**Goal:** Convert the approved First Playable Area Layout (`docs/FIRST_PLAYABLE_AREA_LAYOUT.md`, APPROVED by Project Owner / Orchestrator 2026-08-29) into an implementation plan for the complete primitive-geometry production greybox, decomposed so that **no single agent task builds the entire ~692 m slice** — each phase is independently reviewable with its own acceptance criteria, validation, commit, and stop/review gate.

**Requirements (delivered in `docs/PRODUCTION_GREYBOX_PLAN.md`):**

1. Six-phase decomposition (0 Composition Skeleton, 1 Corporate Access, 2 Monumental Atrium, 3 Elevated Transition, 4 Final Vista, 5 Full Route Integration and Measurement) with per-phase deliverables, targets inherited from the approved layout, acceptance criteria, and stop/review gates.
2. Scene architecture under `game/world/first_playable/`: one composition scene plus four beat scenes; composition over one gigantic `.tscn`; a boundary transform contract frozen after Phase 0; the approved player scene reused unchanged; shared WorldEnvironment / development lighting in the root.
3. Explicit prohibitions: no gameplay scripts merely to construct static geometry, no autoloads, no event buses, no procedural level generation, no architecture-kit abstractions, no production materials, no plugins; primitive MeshInstance3D / StaticBody3D / CollisionShape3D geometry acceptable.
4. Per-phase validation strategy (Godot headless import, scene load/instantiate, parser/runtime error check, player constant verification, collision/traversal checks where applicable, `git diff --check`, diff/status review); M1-style scripted waypoint/physics traversal for route phases; no permanent performance benchmark harness.
5. Commit strategy: separate commits per approved phase (`feat: scaffold first playable greybox` … `test: validate first playable route`); each phase stops for Orchestrator review before the next begins.
6. Phase 5 timing gate preserved: the layout's ~692 m / 2.0 m/s ≈ 5:46 theoretical route-time tension stays unresolved; the complete in-engine route must be measured, and measured direct traversal < 6:00 is a hard STOP-AND-ESCALATE to the Orchestrator — no walk-speed change, no arbitrary corridor length, no scope beyond ~700 m, no `docs/VERTICAL_SLICE.md` modification without Orchestrator approval.

**Constraints:** planning only; the approved layout's spatial decisions are not altered; `game/world/greybox_scale_test.tscn` remains the historical M1 validation scene and is not overwritten or repurposed; no implementation is authorized by this task.

## Acceptance State (recorded 2026-08-29)

Deliverable: `docs/PRODUCTION_GREYBOX_PLAN.md` (Status: DRAFT — pending Orchestrator review). Phases 0–5 defined with deliverables, targets, acceptance criteria, validation, commit messages, and gates; global rules (player unchanged, primitive geometry, no new systems, hidden-ramp stairs ≤ ~17°, M1 scene untouched, escalation rules) stated once and referenced per phase. Validation performed: review of all changed Markdown; confirmed no `game/` changes and `project.godot` unchanged; confirmed layout values untouched except the status line and the §7.2 → §7.1 cross-reference fix; confirmed `AGENTS.md` authority hierarchy unchanged except tool-neutral Implementation Agent terminology; `git diff --check`; full diff review; `git status`.

---

# ARCHIVED — Define First Playable Area Layout (COMPLETED AND APPROVED 2026-08-29)

**Type:** Architectural / spatial design only. No Godot scenes, no player code, no project settings, no assets, no scripts, no production greyboxing.

**Status:** COMPLETED AND APPROVED — `docs/FIRST_PLAYABLE_AREA_LAYOUT.md` **approved by the Project Owner / Orchestrator (2026-08-29)**; status updated to APPROVED and the §7.2 → §7.1 cross-reference corrected. All approved spatial decisions stand unchanged: ~692 m critical path, 80 × 64 m atrium, 80 m clear height, floors at 152 m → 166 m → 172 m, 130 m × ~6 m skybridge, ~90° composition reorientation before the final vista, final vista facing north/northwest. The 5:46 theoretical route-time tension (§15) is deliberately **not resolved**; it remains an in-engine validation requirement for the production greybox (see `docs/PRODUCTION_GREYBOX_PLAN.md` §9).

## Specification

**Type:** Architectural / spatial design only. No Godot scenes, no player code, no project settings, no assets, no scripts, no production greyboxing.

**Goal:** Convert the approved Vertical Slice v0.1 (`docs/VERTICAL_SLICE.md`) and the completed, owner-evaluated M1 Greybox Scale Test (`docs/GREYBOX_SCALE_TEST.md`) into one concrete spatial plan for the actual 10–15 minute playable slice — concrete enough that a later implementation task can build the full production greybox without inventing major spatial decisions.

**Core layout principle:** the playable route must feel much smaller than the architecture surrounding it, following the arc *ordinary → compressed → monumental → exposed → overwhelming*. One authored, largely linear route; no branching progression; visible/inaccessible architecture remains a primary scale tool.

**Requirements (delivered in `docs/FIRST_PLAYABLE_AREA_LAYOUT.md`):**

1. Preserve validated player constants unchanged (1.65 m eye height, 2.0 m/s walk, 70° vertical FOV, no sprint/jump/crouch). The layout adapts to the player.
2. Carry M1 evidence forward: preserve the successful scale concept and variables (~80 m atrium clear height, compression-before-reveal, elevated exterior transition, 800–1200 m neighbouring masses, near/mid/far atmospheric depth). Targeted refinement only for the two 7/10 results (Human Scale rhythm in Beat 1; near-field scale references, including a human-scale object within ~5–10 m of the atrium reveal position).
3. Four concrete beats with subspaces: Beat 1 Corporate Access ~150 m; Beat 2 Monumental Atrium ~250–260 m retaining the validated ~80 × 64 m / 80 m clear volume with an authored (non-straight) crossing; Beat 3 Elevated Transition ~180–195 m with a ~120–140 m skybridge that does NOT spoil the final vista; Beat 4 Final Vista ~100–110 m containing the strongest reveal.
4. Critical path ~680–700 m; traversable floor ≤ ~4,000 m² (aim ~3,400–3,900 m²); optional exploration ≤ 25% additional (small dead-end pockets only); playable vertical range ≤ ~120 m; explicit elevation plan with no ground-level climb and no elevator requirement.
5. Reveal discipline, scale anchor rules, visual wayfinding without UI (waypoint/destination table), two ASCII diagrams (route + elevation), a route budget table, and a mapping of the six `docs/PERFORMANCE_BENCHMARK.md` viewpoint types to named layout locations.
6. Record the 2.0 m/s vs. ≥ 6:00 direct-traversal arithmetic tension as a validation item for the production greybox (measure in-engine; report conflict to the Orchestrator if unresolved; never silently change player speed or expand scope).

**Constraints:** documentation/design only; do not modify `docs/VERTICAL_SLICE.md` to resolve the timing tension; do not design an architecture kit, materials, lighting, audio, interaction, UI, or any non-goal system; functional spatial names only (no lore).

## Acceptance State (recorded 2026-08-28)

Deliverable: `docs/FIRST_PLAYABLE_AREA_LAYOUT.md` (Status: DRAFT — pending Orchestrator review). Key decisions recorded there: atrium proportion retained at the validated 80 × 64 m / 80 m clear (Option A); floors at 152 m (Beat 1 + atrium) rising to 166 m (egress/skybridge) and 172 m (final overlook), ~20 m playable vertical range; route sums ~692 m main + ~35 m optional; floor area ~3,715 m² main + ~110 m² optional (~3,825 m² total); skybridge 130 m × 6 m running west with hero towers withheld to the north/northwest; final vista facing north/northwest (~90° composition rotation from the bridge axis); benchmark viewpoints mapped to Access lobby / Reveal apron / Column causeway / Reveal apron (upward) / Skybridge mid-span / Observation chamber. Validation performed: arithmetic totals checked (path 147+255+185+105 = 692 m; area 635+1,150+1,070+860 = 3,715 m² main, 3,825 m² incl. optional; optional ≈ 3%; vertical range 20 m), cross-check against `VERTICAL_SLICE.md` §3/§4/§6 and `PLAYER_MOVEMENT.md` (no contradictions; the ≥ 6:00 tension is recorded, not resolved), M1 evidence represented per `GREYBOX_SCALE_TEST.md`, `git diff --check`, full diff review, `git status` (documentation/task files only; no `game/` or `project.godot` changes).

## Binding Context Already in the Repository

- `docs/VERTICAL_SLICE.md` §4/§6 — the four-beat spatial sequence and v0.1 scope bounds (route ~400–700 m, ≤ ~4,000 m² traversable floor, ≤ ~120 m playable vertical range, ≤ ~25% optional side area).
- `docs/GREYBOX_SCALE_TEST.md` — M1 completed and owner-evaluated; prototype route measured ~195 m; refinement observations (Human Scale 7/10, Scale References 7/10) are inputs to layout refinement, not defects.
- `docs/PERFORMANCE_BENCHMARK.md` — approved methodology; benchmark viewpoints and route must remain representable by whatever layout this task defines.
- `docs/PLAYER_MOVEMENT.md` — player constants are fixed project values; layout authors against them, never changes them.

---

# ARCHIVED — Define Performance Benchmark Methodology (COMPLETED 2026-08-28)

**Type:** Documentation/design only. No implementation, no scenes, no scripts, no project settings changes. No subsequent task may start before Orchestrator review.

**Status:** COMPLETED AND APPROVED — `docs/PERFORMANCE_BENCHMARK.md` created; `docs/PERFORMANCE_BUDGET.md` extended to link it (§ "Relationship to the Benchmark Methodology"). **Approved by the Orchestrator (2026-08-28)**; review corrections applied (release-capable `--gpu-profile`; `SESSION-COLD` vs warm run terminology). The review gate is lifted; "Define First Playable Area Layout" is the next active task.

## Goal

Define how MONOLITH measures performance for the remainder of the Vertical Slice, so that all later optimization and visual-quality decisions are made against measured data instead of speculation, per `AGENTS.md` ("performance awareness") and `docs/PERFORMANCE_BUDGET.md` ("optimization should be profiler-driven").

The task answers:

> What do we measure, how do we measure it, against which budgets, and on which target hardware — before the benchmark scene exists?

## Context

- M1 (Build Greybox Scale Test) is **completed**: automated validation passed and the Project Owner's manual evaluation is recorded in `docs/GREYBOX_SCALE_TEST.md`. M1 subjective gates are PASS.
- `docs/PERFORMANCE_BUDGET.md` (Status: DRAFT) states that exact GPU, CPU, memory, and frame-time budgets will be defined after the first benchmark scene and target hardware are selected. This task defines the **methodology** that makes those definitions possible; it does not itself fix final numeric budgets where a prerequisite (hardware, benchmark scene) is still missing, and must mark any such value as explicitly deferred rather than invented.
- The Vertical Slice requires a stable frame rate at high visual quality (`docs/VERTICAL_SLICE.md` §14, criterion 16), but the performance budget numbers cannot be finalized until the methodology task and the later benchmark scene (M3) exist.
- This is a predecessor to, not a substitute for, M3 — Lighting Prototype, which will produce the representative benchmark scene.

## Relevant Files

- `docs/PERFORMANCE_BUDGET.md` — expected primary output location (or a dedicated methodology document, if the structure demands it)
- `docs/VERTICAL_SLICE.md` — §14 success criteria and scope bounds the methodology must serve
- `docs/GREYBOX_SCALE_TEST.md` — measured prototype facts (scene composition, node/material counts) usable as first workload references
- `docs/ROADMAP.md` — milestone context (M3 produces the benchmark scene)
- `tasks/BACKLOG.md`

## Requirements

The methodology document must define:

1. **Metrics** — which quantities are tracked (e.g. frame time, FPS distribution/percentiles, GPU/CPU frame cost, draw calls, memory, asset/VRAM footprint) and why each matters for a graphics-focused Forward+ exploration experience.
2. **Measurement procedure** — how a scene is measured reproducibly in Godot 4 (e.g. profiler usage, headless vs. interactive runs, fixed camera paths, capture duration, warm-up rules), so results are comparable across sessions and tasks.
3. **Reference workloads** — which scenes/states act as measurement points (the greybox scale test can serve as the first provisional workload until M3 provides a representative benchmark scene).
4. **Target hardware** — the hardware specification question must be raised and either resolved by the Orchestrator/Project Owner within this task or explicitly recorded as a blocking deferral with a proposed default.
5. **Budget structure** — the frame-time/memory budget framework (targets and thresholds, how pass/fail is decided), with concrete numbers only where prerequisites allow and explicit `DEFERRED` markers elsewhere.
6. **Regression practice** — when and how performance is re-measured during development (which milestones/tasks trigger a measurement pass), and how results are recorded.
7. **Escalation rule** — what happens when a measurement fails its budget (who decides: cut scope, defer quality, or optimize; per the repository's authority model).

## Constraints

- Documentation/design only. No Godot scenes, scripts, autoloads, project settings, plugins, or benchmark tooling may be created or modified.
- Do not set final numeric budgets that depend on unresolved prerequisites (target hardware, benchmark scene); mark them `DEFERRED` with the owning decision named.
- Do not start M3 (Lighting Prototype) or any backlog item beyond this task.
- Keep the output consistent with `AGENTS.md`, `docs/ARCHITECTURE.md`, and the Vertical Slice scope; prefer simple, reproducible practice over elaborate tooling proposals.

## Acceptance Criteria

- The methodology is written down in the repository (extended `docs/PERFORMANCE_BUDGET.md` or a clearly linked dedicated document) and covers all seven requirement areas above.
- Every metric has a defined measurement procedure; every deferred value is explicitly marked `DEFERRED` with the decision that must close it.
- The methodology is reviewable by the Orchestrator and Project Owner without running the engine.
- No engine-facing files are changed; `git status` shows documentation/task changes only.

## Validation Requirements

- `git status`, full `git diff`, `git diff --check`.
- Markdown structure review of all edited documents.
- Cross-check against `docs/VERTICAL_SLICE.md` §14 and `docs/ROADMAP.md` for contradictions; report any conflict instead of resolving it silently.

## Gate — LIFTED (2026-08-28)

Original gate: "No subsequent task may start before Orchestrator review of this task's results." The Orchestrator review is complete (approved with corrections); the gate is lifted and "Define First Playable Area Layout" is the next active task.

## Acceptance State (recorded 2026-08-28)

Deliverable: `docs/PERFORMANCE_BENCHMARK.md` (new, with `docs/PERFORMANCE_BUDGET.md` extended to link it). Mapping of the seven requirement areas to the methodology document:

| Requirement | Covered by |
|---|---|
| 1. Metrics | PERFORMANCE_BENCHMARK.md §6 (timing, rendering complexity, memory, pipeline compilations — with Godot 4.7 `Performance` monitor names) |
| 2. Measurement procedure | §3 (modes A/B), §4 (headless rule), §5 (environment record), §7 (statistics), §8 (session-cold/warm), §10 (route), §11 (resolution/graphics configuration) |
| 3. Reference workloads | §9 (six fixed greybox viewpoints as provisional workload; M3 supersedes), §10 (deterministic route) |
| 4. Target hardware | §15 — recorded as DEFERRED with owning decision (Project Owner + Orchestrator) and proposed default (Project Owner's development PC, hardware captured per §5) |
| 5. Budget structure | §1 and §13 (frame-time statistics as the pass/fail basis; verdicts require Mode B) plus the extended PERFORMANCE_BUDGET.md — all exact numbers remain DEFERRED |
| 6. Regression practice | §13.3–§13.4 (re-measurement triggers, result records under `docs/benchmarks/`, BASELINE/COMPARABLE/NON-COMPARABLE rules) |
| 7. Escalation rule | §13.5 (diagnosis first, Orchestrator decides; no silent visual-quality reduction) |

Also recorded: the `project.godot` renderer-line canonicalization observation as a repository hygiene note (PERFORMANCE_BENCHMARK.md §17), explicitly not resolved by this task. Validation performed: `git status`, `git diff --check`, full `git diff` review; Godot 4.7 terminology verified against the official 4.7 documentation and the installed Godot 4.7.1 binary; no engine-facing files changed.
