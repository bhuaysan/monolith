# AGENTS.md — MONOLITH Development Contract

## Project

MONOLITH is a high-fidelity first-person 3D exploration experience built with Godot. It is intentionally a small, polished vertical slice focused on monumental futuristic architecture, atmosphere, scale, interaction, audio, and presentation.

Core fantasy:

> The player is a human inside architecture built at a scale that feels almost inhuman.

The target experience is first-person exploration in a corporate futuristic megastructure, with towers approximately 800–1200 m tall, a small number of highly polished playable zones, strong architectural scale, no conventional cyberpunk visual clichés, and a PC-first high-quality presentation.

## Authority Model

Development follows this hierarchy:

1. Human Project Owner
2. ChatGPT — Orchestrator / Technical Director
3. Repository architecture/specifications
4. Active task specification
5. Codex / Claude Code — Implementation Agents

The Human Project Owner has final authority over product direction. ChatGPT owns architecture, technical direction, scope control, milestone planning, task decomposition, acceptance criteria, code review reasoning, performance strategy, debugging strategy, and documentation architecture. Codex and Claude Code are implementation agents and must not independently expand scope or redesign major architecture.

## Implementation Agent Responsibilities

Before modifying code, agents must:

1. Read this file.
2. Read relevant documentation.
3. Inspect the existing implementation.
4. Understand the active task and its acceptance criteria.
5. Preserve established patterns unless the task explicitly changes them.

During implementation, agents must make the smallest coherent change, avoid unrelated refactors and speculative abstractions, justify any dependency, reuse existing systems where appropriate, and keep Godot scenes and scripts modular. After implementation they must validate the work, check for parser/errors, review the diff, and truthfully report what was and was not tested.

## Architecture Approval

Implementation agents must not independently:

- introduce new global singletons or autoloads
- replace established subsystems
- add third-party plugins or libraries
- perform broad refactors
- change project-wide architecture
- change the renderer strategy
- introduce a new global event architecture

If one of these appears necessary, document why the current architecture is insufficient, the proposal, alternatives, affected systems, and migration impact, then request architectural review instead of implementing it silently.

## Scope Discipline

MONOLITH is a vertical slice. Unless explicitly approved, it does not currently require:

- combat
- weapons
- multiplayer
- vehicles
- crafting
- skill trees
- procedural city generation
- complex NPC AI
- dialogue trees
- large inventory systems
- open-world systems

New systems must support the current playable experience. The core principle is: **polished depth > feature breadth**.

## Engineering Principles

- Prefer the simplest architecture that satisfies current requirements.
- Keep systems modular, focused, and explicit about dependencies.
- Prefer Godot scene/node composition over deep inheritance hierarchies.
- Expose designer-facing tuning through exported properties or resources where appropriate.
- Use typed GDScript where practical.
- Use snake_case for variables/functions and PascalCase for named classes.
- Avoid undocumented hardcoded NodePaths and unnecessary autoloads.
- Do not add continuously processing nodes without a clear reason.
- Do not optimize speculatively; profile performance and act on measured bottlenecks.
- Do not create giant monolithic scripts.

## Repository Knowledge

The repository is the system of record. `AGENTS.md` is the operating contract; detailed project knowledge belongs under `docs/`. When documentation conflicts with existing code, report the conflict rather than silently choosing one.

Implementation work should normally originate from `tasks/ACTIVE_TASK.md`. Agents must follow its acceptance criteria and must not implement backlog ideas while completing the active task.

## Definition of Done

A task is complete only when the requested functionality exists, acceptance criteria are satisfied, relevant errors are resolved, conventions are followed, unrelated behavior has not intentionally changed, validation was performed where possible, the diff was reviewed, changed files are reported, known limitations are reported, and documentation is updated when architecture or usage changed.

Every implementation report must contain:

### Summary

What was implemented.

### Changed Files

Files added, modified, or deleted.

### Validation

Commands/tests/checks actually performed.

### Decisions

Non-trivial implementation decisions.

### Remaining Issues

Known limitations, risks, or follow-up work.
