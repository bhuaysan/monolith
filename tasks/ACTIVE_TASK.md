# ACTIVE TASK — Define Vertical Slice v0.1

**Type:** Documentation / design only. No implementation.

## Goal

Turn the existing high-level project vision into a concrete, bounded specification for MONOLITH Vertical Slice v0.1, so that later tasks — player movement, greybox geometry, lighting, architecture, audio, and performance — are all designed against the same defined experience.

The specification lives in `docs/VERTICAL_SLICE.md`.

## Context

The project bootstrap task is complete: the repository, documentation structure, and Godot project configuration exist.

`docs/VISION.md`, `docs/ART_DIRECTION.md`, and `docs/WORLD_SCALE.md` describe direction and principles, but do not define a specific playable target. Without a defined target, subsequent design tasks would each have to invent their own interpretation of the slice.

## Relevant Files

- `docs/VERTICAL_SLICE.md` — the deliverable
- `docs/VISION.md`
- `docs/ART_DIRECTION.md`
- `docs/WORLD_SCALE.md`
- `docs/ARCHITECTURE.md`
- `docs/PERFORMANCE_BUDGET.md`
- `docs/ROADMAP.md`
- `tasks/BACKLOG.md`
- `AGENTS.md`

## Requirements

`docs/VERTICAL_SLICE.md` must define at minimum:

- Status
- Purpose
- Target Experience
- Target Duration
- Spatial Sequence
- Core Exploration Loop
- Playable Scope
- Visual Goals
- Audio Goals
- Scale Strategy
- World Illusion Strategy
- Required Systems
- Explicit Non-Goals
- Success Criteria
- Open Questions / Deferred Decisions

The specification must use project-specification language rather than marketing copy, and must not contradict `AGENTS.md` or the existing documents under `docs/`.

## Constraints

- Documentation only.
- Do not implement gameplay.
- Do not create Godot scenes or scripts.
- Do not add assets, plugins, or dependencies.
- Do not change renderer or project settings.
- Do not begin player movement implementation.
- Do not begin the greybox.
- Do not modify anything under `game/`, or `project.godot`.
- Do not invent additional major milestones or features.
- Do not advance this file to the next task; that happens only after Orchestrator review.

## Acceptance Criteria

- Vertical Slice v0.1 has a defined beginning, progression, climax, and endpoint.
- Target play duration is defined.
- Playable scope is bounded.
- Spatial beats are defined.
- Required systems are separated from deferred systems.
- Visual and audio intent support the project fantasy.
- Non-goals prevent scope expansion.
- Success criteria are sufficiently concrete to guide later greybox work.
- No gameplay implementation is added.

## Validation Requirements

Report:
- all changed and created files
- confirmation that the specification does not contradict `AGENTS.md`, `docs/VISION.md`, `docs/ART_DIRECTION.md`, `docs/WORLD_SCALE.md`, `docs/ARCHITECTURE.md`, or `docs/ROADMAP.md`
- `git status` and `git diff` inspection, including `git diff --check`
- confirmation that no game files or project configuration were modified
- any documentation conflicts found, reported rather than silently resolved
