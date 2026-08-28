# ACTIVE TASK — Define Performance Benchmark Methodology

**Type:** Documentation/design only. No implementation, no scenes, no scripts, no project settings changes. No subsequent task may start before Orchestrator review.

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

## Gate

**No subsequent task may start before Orchestrator review of this task's results.** "Define first playable area layout" remains blocked until then.
