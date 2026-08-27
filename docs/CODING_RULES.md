# CODING RULES

**Status:** DRAFT

## Initial Rules

- Use GDScript, typed where practical.
- Use snake_case for functions and variables.
- Use PascalCase for named classes.
- Prefer composition over deep inheritance.
- Use exported properties for designer tuning.
- Do not use undocumented hardcoded NodePaths.
- Do not add unnecessary autoloads.
- Do not add continuously processing nodes without justification.
- Keep scripts focused and dependencies explicit.

Avoid unnecessary `_process()` and `_physics_process()` work, speculative abstractions, and unmeasured optimization. Agents must truthfully report validation and known limitations.
