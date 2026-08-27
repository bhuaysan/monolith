# ARCHITECTURE

**Status:** DRAFT

## Engine

Godot 4.

## Primary Language

GDScript, typed where practical.

## Rendering

Forward+ renderer, with desktop PC as the initial target platform.

## Architecture Philosophy

Favor simple modular scenes and components, node/scene composition, explicit dependencies, focused scripts, and designer-tunable exported properties. Avoid speculative architecture for features outside the current vertical slice.

## Repository Directory Responsibilities

- `game/core/` — genuinely shared foundational systems
- `game/player/` — player controller and player-owned components
- `game/interaction/` — reusable interaction systems
- `game/world/` — playable locations and level-specific scenes
- `game/environment/` — reusable architecture, props, materials, decals, and environmental assets
- `game/audio/` — audio systems and reusable audio components
- `game/ui/` — player-facing UI
- `game/debug/` — debugging and development-only tools

Major architectural changes require approval from the Human Project Owner or ChatGPT Orchestrator.
