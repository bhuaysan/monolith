# PERFORMANCE BENCHMARK METHODOLOGY

**Status:** DRAFT — defined 2026-08-28, pending Orchestrator review.

**Related documents:**

- `docs/PERFORMANCE_BUDGET.md` — defines WHAT results are acceptable (budgets). Exact values are deferred there.
- `docs/GREYBOX_SCALE_TEST.md` — the first provisional reference workload (M1, completed).
- `docs/ROADMAP.md` — M3 (Lighting Prototype) produces the representative benchmark scene.
- `docs/CODING_RULES.md` — bans unmeasured optimization; this document operationalizes that rule.

## 1. Purpose

This document defines HOW MONOLITH measures performance. It exists so that, when performance changes between two commits, we can answer three questions with evidence rather than impressions:

1. Did performance actually improve or regress?
2. Where is the bottleneck (CPU, GPU, memory, pipeline compilation, physics/script)?
3. Are the two measurements comparable at all?

This document does **not** optimize the game and does **not** set acceptance numbers. It defines measurement only. No benchmark tooling, scenes, scripts, project settings, plugins, or dependencies are introduced by this document; implementing any of its procedures as code requires a dedicated task.

### Relationship to PERFORMANCE_BUDGET.md

| Document | Question it answers | Current state |
|---|---|---|
| `docs/PERFORMANCE_BENCHMARK.md` (this document) | HOW we measure | Defined here |
| `docs/PERFORMANCE_BUDGET.md` | WHAT results are acceptable | Exact GPU, CPU, memory, and frame-time budgets **deferred** until target hardware and a representative benchmark scene exist |

This split is deliberate: budget values may change without changing the measurement protocol, and the methodology can be exercised before budgets exist. Budget values may only ever be set against measurements produced by this methodology.

## 2. Benchmark Philosophy

1. **Measure before optimizing.** No optimization work starts without a measurement that identifies the bottleneck (see §12).
2. **Frame time is the primary language; FPS is presentation.** Two runs at "60 FPS" can feel entirely different: a constant 16.7 ms frame and an alternating 4 ms / 30 ms frame both average 60, but only one is smooth. Frame time in milliseconds is what we record, compare, and reason about.
3. **Steady low FPS and intermittent stutter are different problems.** A uniformly slow frame rate points to a sustained bottleneck (§12); occasional long frames point to pipeline compilation, loading, spikes, or polling patterns. They require different diagnosis and different fixes, so they are measured and reported separately (§6.4, §7, §8).
4. **CPU and GPU bottlenecks are distinguished.** Optimizing the wrong side changes nothing. Diagnosis (§12) establishes which side owns the frame before any change is made.
5. **Comparisons are only meaningful under controlled conditions.** A result is comparable only to results recorded with the same benchmark mode, build type, hardware, renderer, resolution, and quality configuration (§13).
6. **Regressions must be reproducible.** A reported regression includes enough environment information (§5) and repeated observations to reproduce it. Non-reproducible slowdowns are investigated, not acted on.
7. **Visual quality is never silently reduced to pass a benchmark.** If a measured result misses a budget, the escalation path in §13.5 applies; quality reductions are explicit Project Owner decisions, never quiet side effects of optimization work.
8. **Optimization is profiler-driven.** Actions follow measured evidence from Mode A diagnostics (§3.1), never speculation. This mirrors `AGENTS.md` ("Do not optimize speculatively") and `docs/CODING_RULES.md`.

The goal is **high visual quality with controlled performance**, not the highest possible FPS.

## 3. Benchmark Modes

Two modes exist. Every recorded result states which mode it belongs to. **Results from different modes must never be mixed into one baseline or comparison.**

### 3.1 Mode A — Diagnostic / Development Benchmark

**Purpose:** identify bottlenecks and understand *why* performance changed.

**Typical environment:**

- Godot editor build, or a debug export template.
- Editor **Debugger** panel: **Monitors** tab (live `Performance` monitors), **Profiler** tab (script/physics/frame time breakdown), **Visual Profiler** tab (CPU and GPU framegraphs of rendering tasks — the primary CPU/GPU split tool in Forward+), **Video RAM** tab (per-resource VRAM usage).
- `--gpu-profile` command-line argument (debug builds) when a rendering-side breakdown is needed.
- Diagnostic aids (collision shapes, wireframe, deliberately disabled features) allowed, as long as the result is labelled as diagnostic-only and never compared with Mode B numbers.

**Limitations to state in every Mode A record:**

- Editor overhead, debugger overhead, and debug-build instrumentation mean Mode A is **not** the final representation of shipping performance.
- The Visual Profiler's reported categories vary with the rendering method and enabled features, and its results scale with viewport resolution — the same viewport size must be used when comparing Visual Profiler runs.
- Some `Performance` monitors are only available in debug mode and return `0` in release exports (see §6.3).

### 3.2 Mode B — Representative Runtime Benchmark

**Purpose:** measure performance as close as practical to the actual player's experience.

**Requirements:**

- **Exported desktop build** — prefer a release export (`--export-release`). If only a debug export is available, that must be recorded, and debug-export results must not be treated as release results.
- **Representative rendering path** — Forward+ as actually shipped, no diagnostic aids, no forced feature changes.
- **Fixed graphics settings, fixed resolution, fixed benchmark route/viewpoints** per §9–§11.
- **No editor overhead** — the game runs standalone, not from the editor.
- Recording performed by the methodology's statistical model (§7) over fixed-duration samples (§10).

### 3.3 Mode discipline

- A benchmark record is a record of exactly one mode.
- Editor-run and exported-build results must never be mixed into one baseline, one comparison table, or one trend.
- Mode B is the basis for any budget verdict in `docs/PERFORMANCE_BUDGET.md`. Mode A explains and diagnoses; it does not pass or fail budgets.

## 4. Headless Rule

Headless Godot runs (`--headless`, display driver `headless`, audio driver `Dummy`) remain useful and continue to be used for:

- scene loading and import validation,
- parser/error validation,
- automated traversal correctness (as done for the M1 greybox),
- deterministic geometry checks,
- non-rendering smoke tests.

Headless results must **NOT** be recorded or cited as GPU/rendering performance measurements. Headless runs do not exercise a GPU rendering device, so their frame times measure something other than what players experience. Every graphical performance benchmark requires a **real rendering device** — a normal windowed/fullscreen run on actual hardware.

## 5. Test Environment Record

Every benchmark result must record enough information to reproduce it. Fields not yet defined for the project use the placeholder `TBD — record at benchmark time`; nothing is pre-filled with assumptions about the Project Owner's hardware.

| Field | Value |
|---|---|
| Date | record at benchmark time |
| Git commit SHA | `git rev-parse HEAD` at the time of the run |
| Godot version | e.g. `4.7.1.stable.official` (`godot --version`) |
| Operating system | TBD — record at benchmark time |
| CPU | TBD — record at benchmark time |
| GPU | TBD — record at benchmark time |
| GPU driver | TBD — record at benchmark time |
| System RAM | TBD — record at benchmark time |
| Display resolution | TBD — record at benchmark time |
| Render resolution (internal) | see §11 |
| Windowed / fullscreen | see §11 |
| Renderer / rendering method | verified at runtime (see §5.1), not assumed |
| Rendering driver / API | verified at runtime (see §5.1) |
| VSync state | see §11 (project setting or `--disable-vsync` plus driver-level behaviour) |
| Frame cap state | see §11 (`application/run/max_fps` or `--max-fps`) |
| Graphics-quality configuration | per §11 schema |
| Benchmark mode | `A — diagnostic` or `B — representative` (§3) |
| Build type | `editor build`, `debug export`, or `release export` |
| Command-line arguments | every engine-affecting argument used (e.g. `--resolution`, `--fullscreen`, `--max-fps`, `--disable-vsync`, `--rendering-method`) |
| Relevant rendering project settings | anything under `rendering/`, `display/window/`, `application/run/` that affects rendering and is not at its default |
| Cold or warm run | `COLD` or `WARM` (§8) — never omitted |

Hardware identity is captured with the OS's own reporting tools at benchmark time and copied verbatim into the record.

### 5.1 Renderer verification note

The renderer actually used by a run must be **verified at runtime**, not inferred from configuration text. `forward_plus` is the default rendering method for desktop Godot projects, and the editor canonicalizes `project.godot` over time — settings that equal their defaults may be removed (see §17). The presence or absence of the line `renderer/rendering_method="forward_plus"` in `project.godot` is therefore **not benchmark evidence**.

A benchmark record verifies and records the runtime renderer using:

- the rendering method/driver printed in the normal (non-quiet) startup header, or
- `RenderingServer.get_current_rendering_method()` plus `RenderingServer.get_video_adapter_name()`, `get_video_adapter_vendor()`, and `get_video_adapter_api_version()` queried during the run (diagnostic prints in Mode A are sufficient; a permanent implementation is out of scope here).

The project's architectural decision remains Forward+ (`docs/ARCHITECTURE.md`). If a verification ever shows anything other than `forward_plus` on the Vulkan path, the benchmark is invalid until the cause is found and recorded.

## 6. Core Metrics

The minimum metrics for any benchmark record. Values come from Godot's built-in `Performance` monitors — the same values shown in the editor **Debugger > Monitors** tab (`Performance.get_monitor()` in code). Note that some monitors update at most once per second, which is why sampled aggregation (§7) matters.

### 6.1 Timing

| Metric | Godot source | Notes |
|---|---|---|
| FPS | `Performance.TIME_FPS` (Monitors: FPS) | Presentation metric only; updated once per second. |
| Frame / process time | `Performance.TIME_PROCESS` (Monitors: Process) | Time to complete one frame, in seconds. **Primary metric**; report in milliseconds. |
| Physics process time | `Performance.TIME_PHYSICS_PROCESS` | Time for one physics frame. |
| Navigation process time | `Performance.TIME_NAVIGATION_PROCESS` | Recorded only when navigation is actually used; currently N/A. |
| Script / per-function cost | Debugger > Profiler tab | Mode A only. Frame Time includes rendering; Idle/Physics splits separate non-rendering logic. |
| GPU vs CPU rendering split | Debugger > Visual Profiler; `--gpu-profile` (debug builds) | Mode A only. Establishes which side owns the frame (§12). |

**Frame-time conversions (reference only):**

| FPS | Frame time |
|---|---|
| 30 | ≈ 33.33 ms |
| 60 | ≈ 16.67 ms |
| 90 | ≈ 11.11 ms |
| 120 | ≈ 8.33 ms |

These are unit conversions, **not** MONOLITH's approved frame budget. No frame-time or FPS target is selected by this document; `docs/PERFORMANCE_BUDGET.md` defers that decision (see §15).

### 6.2 Rendering complexity

| Metric | Godot source |
|---|---|
| Rendered objects (non-culled) | `Performance.RENDER_TOTAL_OBJECTS_IN_FRAME` |
| Rendered primitives (vertices/indices) | `Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME` |
| Draw calls | `Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME` |

These exclude culled objects (hidden nodes, frustum and occlusion culling). Rendered primitives count vertices or indices across all passes; because of the depth prepass and shadow passes the value is typically **double or triple** the scene's actual vertex count — compare like with like, and never against a "vertex count" figure from scene authoring.

These are **diagnostic indicators, not universal quality scores**. A scene with more draw calls is not automatically unacceptable; the only question that matters is whether the measurement shows it creating a bottleneck (§12).

### 6.3 Memory

| Metric | Godot source | Notes |
|---|---|---|
| Video memory used | `Performance.RENDER_VIDEO_MEM_USED` | Texture + vertex + miscellaneous allocations; always ≥ texture + buffer sums. |
| Texture memory used | `Performance.RENDER_TEXTURE_MEM_USED` | |
| Buffer memory used | `Performance.RENDER_BUFFER_MEM_USED` | |
| Static memory used | `Performance.MEMORY_STATIC` | **Debug only** — returns 0 in release exports. |
| Per-resource VRAM | Debugger > Video RAM tab | Mode A only; identifies which resources hold VRAM. |

Build-type caveat: per the Godot 4.7 documentation, some built-in monitors (including static memory and orphan-node counts) are only available in debug mode and always return `0` in release exports. Memory comparisons must therefore use the same build type, and a `0` from a release run means "monitor unavailable", not "memory freed".

### 6.4 Pipeline compilations and stutter

| Metric | Godot source | Behaviour |
|---|---|---|
| Mesh pipeline compilations | `Performance.PIPELINE_COMPILATIONS_MESH` | Triggered by loading meshes; lengthens first-run loading. |
| Surface pipeline compilations | `Performance.PIPELINE_COMPILATIONS_SURFACE` | Building the surface cache; stutter on first scene load. |
| Draw pipeline compilations | `Performance.PIPELINE_COMPILATIONS_DRAW` | Triggered while drawing; stutters during gameplay on first encounter of a pipeline. |
| Specialization compilations | `Performance.PIPELINE_COMPILATIONS_SPECIALIZATION` | Background optimization; should not stutter. |
| Canvas pipeline compilations | `Performance.PIPELINE_COMPILATIONS_CANVAS` | 2D canvas; mostly N/A for MONOLITH today. |

Cold and warm behaviour are separated (§8). **One-time compilation stutters must never be averaged away:** cold-pass spikes are reported as cold-pass observations, and warm-pass percentiles (§7) must not include cold-pass frames. If a pipeline compilation stutter occurs *during* a warm sample (a pipeline first needed mid-route), the record must flag it rather than let it silently distort percentiles.

## 7. Statistical Reporting

A single instantaneous FPS number is insufficient and must not be used as the basis of any comparison. Timed samples report, at minimum:

| Statistic | Definition |
|---|---|
| Sample duration | Wall-clock length of the recorded sample, in seconds. |
| Mean frame time | Average of all frame times in the sample. |
| Median frame time | 50th percentile. |
| Worst frame time | Maximum observed frame time in the sample. |
| 95th percentile frame time | 95% of frames were faster than this. |
| 99th percentile frame time | 99% of frames were faster than this. |

If later instrumentation makes them practical to compute, additionally record 1% low and 0.1% low FPS. Implementing the sample recorder is **not** part of this task and requires a dedicated task.

Default sample duration: **60 s** per held benchmark viewpoint (§9), with 30 s as the absolute minimum for a record to be valid. Full-route runs (§10) are reported as their own samples, not merged with viewpoint holds.

**Why percentiles:** the mean hides everything a player actually feels. A run with 55 ms median and 400 ms spikes feels far worse than a constant 60 ms run, despite a better average. Percentiles are computed on **frame times**, not FPS values (percentile math on FPS is misleading), and expose the stutter that an average conceals.

## 8. Cold and Warm Passes

### 8.1 Cold pass (`COLD`)

A run from a fresh process launch, recording from scene load onward.

**Purpose:** expose first-use costs — mesh/surface/draw pipeline compilation (§6.4), shader stutter, and loading-related stalls.

**Rules:**

- Every cold-pass result is labelled `COLD`.
- Cold results are never compared against warm results, never used for steady-state verdicts, and never merged into warm percentiles.

### 8.2 Warm pass (`WARM`)

The steady-state comparison condition. A warm benchmark begins only after:

1. the scene has fully loaded,
2. the benchmark route has been traversed once (or all benchmark viewpoints visited once) so major materials, lights, and pipelines have been exercised and compiled,
3. a settle period (≥ 30 s of rendering) has elapsed, and
4. the same fixed configuration (§11) is active.

**Procedure:** launch → load complete → walk the full route once at normal pace → return to the starting viewpoint (or launch a second session that performs step 2 immediately before sampling) → run the timed samples. This is a per-session discipline, not a promise that caches are portable: engine pipeline caches and GPU driver shader caches differ across machines, drivers, and sessions, so warm-up is repeated every session regardless of what may be cached. The procedure used must be recorded in the result.

Cold and warm results from the same session may be reported side by side (clearly labelled) to show the cold/warm delta, but they are separate records and are never averaged together.

## 9. Benchmark Locations

The completed M1 greybox (`game/world/greybox_scale_test.tscn`) is the initial spatial reference. Six fixed viewpoints are defined, chosen because each represents a different visibility and rendering condition. Positions are described spatially here; exact coordinates are recorded with the first benchmark result and then fixed.

| # | Location | Scene area | Rendering condition it stresses |
|---|---|---|---|
| 1 | Zone A lobby, human-scale interior | Lobby (12.5 × 10 m, 3.0 m ceiling) | Enclosed near-field baseline; interior fill lights. |
| 2 | Atrium reveal position | Compression corridor C end, at the 1.5 × 2.5 m reveal door | The reveal framing; small-space → large-volume transition in one view. |
| 3 | Atrium floor, looking across the volume | Atrium floor (80 m clear height, 80 × 64 m footprint) | Maximum enclosed visible volume; columns, bands, balconies, bridges. |
| 4 | Atrium upward view | Atrium floor, pitched up | Roof glazing 80 m above; vertical view condition. |
| 5 | Skybridge | 40 m skybridge, mid-span | Open exterior with visible depth below; exterior lighting and fog. |
| 6 | Final vista | Vista platform (162.4 m above implied ground) | Megatowers (Meridian 880 m, Aster 1030 m, Obsidian 1150 m), depth layers, aerial perspective. |

**Explicit limitation:** the current greybox is deliberately visually cheap — primitive boxes, 12 neutral materials, one sun plus 11 fill lights, procedural sky and height fog. It is too inexpensive to serve as MONOLITH's final stress benchmark. Therefore:

- **M1 can establish an engine/project baseline** — how this project, renderer, and hardware behave on a known, trivial workload.
- **Later art and lighting milestones (M3 Lighting Prototype, M5 Hero Scene, M6 Megacity Illusion) must provide representative benchmark content.** When M3's benchmark scene exists, it becomes the reference workload and its locations supersede these.
- **The benchmark methodology (modes, records, metrics, statistics, cold/warm discipline, comparability rules) remains stable while benchmark scenes become more representative.** Only §9 and §11 content change as scenes evolve.

## 10. Benchmark Route

A **deterministic benchmark route** is a fixed traversal that produces comparable samples between commits:

- the same starting point (the greybox player spawn),
- the same route — the M1 validation route: lobby → corridor doors → corridor B turn → compression corridor → reveal door → atrium → east stair → gallery → door → transition corridor → skybridge → vista platform,
- approximately the same camera directions (recorded as target positions/yaw/pitch per viewpoint; manual runs record their deviation),
- a fixed sampling procedure: each §9 viewpoint held for the fixed sample duration (§7), plus the full traversal recorded as one continuous sample,
- repeatable comparison between commits under identical configuration (§11).

**Manual runs are acceptable initially.** The runner is a person walking the route with fixed settings; small human variance is acceptable and recorded, because percentile statistics over 60 s samples are robust to it. Exact-repetition concerns (start position, camera orientation, pacing) are noted as protocol deviations in the result.

**Automated camera/player playback may be considered later** as a dedicated implementation task (per `AGENTS.md` architecture-approval rules). It is explicitly not designed or implemented here. Automated and manual samples must never be mixed in one comparison.

Timing guardrails for any benchmark run: `--fixed-fps` must not be used (it disables real-time synchronization and produces non-representative timing), and `--time-scale` must be `1.0`.

## 11. Resolution / Graphics Configuration Record

Performance results are meaningless without rendering conditions. Every benchmark record states all of the following. Current values reflect the repository state at the time of this document; fields marked N/A are **not configured in `project.godot`** (engine defaults apply) and must be resolved to actual values at benchmark time. No final graphics presets are selected by this document.

| Field | Current state (2026-08-28) | Notes |
|---|---|---|
| Output resolution | Unset in project — engine default window size in effect; record actual output resolution per run | `--resolution <W>x<H>` / `--fullscreen` / `--windowed` fix it per run |
| Internal/render resolution | N/A — not configured | If different from output: record `rendering/scaling_3d/mode` and `rendering/scaling_3d/scale` |
| Scaling mode | N/A | (part of `rendering/scaling_3d/mode`) |
| VSync | Unset in project — engine default (enabled) applies unless overridden | Record `display/window/vsync/vsync_mode` and any `--disable-vsync` use; note that driver-level VSync enforcement is outside engine control |
| Frame cap | Unset — no cap in effect | `application/run/max_fps` or `--max-fps` |
| Anti-aliasing | N/A — not configured | Record MSAA 3D, screen-space AA, TAA as configured |
| Shadow configuration | N/A as project settings — greybox uses per-light shadow defaults | Record directional shadow settings and per-light shadow state when configured |
| Volumetric/fog configuration | Greybox: WorldEnvironment height fog + procedural sky, filmic tonemap | Record actual `WorldEnvironment`/fog settings per benchmark scene |
| GI / reflections | N/A — no GI or reflection systems configured | Record when those systems exist |
| Quality preset | None exists | Presets may only be defined by a later task |

Do not invent systems MONOLITH does not yet have; mark absent systems N/A rather than assuming values.

## 12. CPU/GPU Diagnosis Workflow

When performance is below target (or changes unexpectedly), the following sequence is executed in Mode A **before** any code or scene change:

1. **Establish reproducibility.** Repeat the observation under the same conditions (§5). If it does not reproduce, stop and investigate the difference instead of optimizing.
2. **Inspect frame/process timing** — `Performance.TIME_PROCESS` and `TIME_PHYSICS_PROCESS`, plus the Debugger Profiler's Frame Time vs Physics Time split. This answers "is the frame long, and is it long outside rendering?"
3. **Inspect GPU timing/profile** — Debugger > Visual Profiler (CPU and GPU framegraphs), or `--gpu-profile` on debug builds. This answers "which side owns the frame?" A frame whose GPU graph dominates is GPU-bound; a frame where CPU rendering tasks dominate is CPU-side render-bound; long physics/script time is CPU logic-bound.
4. **Inspect rendering complexity** — rendered objects, primitives, draw calls (§6.2). Ask what changed relative to the last comparable baseline.
5. **Inspect physics and script contribution** — Profiler tab, script functions, Self vs Inclusive time.
6. **Inspect memory and pipeline-compilation behaviour** — VRAM monitors (§6.3), pipeline compilation counters (§6.4). Distinguish one-time compilation costs from steady costs.
7. **Identify one likely bottleneck before changing anything.** Write the conclusion into the diagnosis record.

Discipline rules:

- No random optimization passes. No "let's try X" without a measured hypothesis.
- Change one variable at a time and re-measure; otherwise attribution is impossible.
- Only measured evidence justifies optimization work (`docs/CODING_RULES.md`).
- A diagnosis that cannot name a bottleneck is returned to measurement, not converted into speculative refactoring.

## 13. Baselines and Regression Tracking

### 13.1 Result records

Every meaningful benchmark is recorded as a result record tied to its commit SHA, hardware, configuration, benchmark scene/path, and results, using the template in §14. Result records live in `docs/benchmarks/` (one Markdown file per record; the directory is created when the first result is recorded — nothing is created by this document).

### 13.2 Definitions

| Term | Meaning |
|---|---|
| **BASELINE** | A known reference measurement: a valid record (complete §5/§11 information, valid sample per §7) that later results may be compared against. |
| **COMPARABLE** | A measurement made under sufficiently equivalent conditions to a baseline: same benchmark mode, same build type, same hardware, same renderer/driver/API, same resolution and quality configuration, same scene/path, same cold/warm state. Only comparable records may be numerically diffed. |
| **NON-COMPARABLE** | A result where hardware, settings, build type, or renderer conditions differ enough that numerical comparison would be misleading. Non-comparable results are still recorded — they carry qualitative information — but they must be explicitly marked NON-COMPARABLE and must never be presented as regressions or improvements. |

**Performance numbers from different hardware are never compared as though they were direct regressions.** A slower number on a different machine says nothing about a commit; it says something about the machine.

### 13.3 When to re-measure

A measurement pass (at minimum: the six §9 viewpoints, warm, Mode B when a representative build exists, otherwise Mode A labelled as such) is performed:

1. **Before** starting a milestone that will change rendering or scene complexity — M3, M5, M6 — to fix a fresh baseline;
2. **After** each such milestone, against that baseline;
3. **When any change is expected to affect rendering cost** (new lights, new materials, large geometry additions beyond the greybox, environment changes);
4. **During M8 (Polish)** as a full pass against the most recent representative baseline;
5. **Ad hoc** whenever a regression is suspected or reported.

### 13.4 Regression practice

A regression report states: the comparable baseline record, the new record, the delta in frame-time statistics (mean, median, p95, p99, worst), and — when the cause is known — a Mode A diagnosis (§12). If no comparable baseline exists (hardware changed, scene changed), the comparison is marked NON-COMPARABLE and a new baseline is established instead.

### 13.5 Escalation rule

When a measurement fails a budget defined in `docs/PERFORMANCE_BUDGET.md`:

1. A Mode A diagnosis (§12) is produced identifying one likely bottleneck — **before** any optimization or content change.
2. The result and diagnosis are escalated to the **Orchestrator**, who decides between: optimizing (via a dedicated implementation task), cutting scope, or deferring/adjusting quality.
3. **Visual quality must not be silently reduced to make a benchmark pass.** Any quality reduction is an explicit decision by the Orchestrator with Project Owner approval, recorded in the task and budget documentation — never a side effect of optimization work.

## 14. Benchmark Result Template

Copy this template into `docs/benchmarks/<date>-<short-description>.md` and fill every field. Unknown hardware values are recorded as `TBD` — never guessed.

```markdown
# BENCHMARK RESULT — <short description>

- **Benchmark ID / date:** <YYYY-MM-DD> / <id>
- **Commit:** <git SHA> (branch: <branch>)
- **Benchmark scene/path:** <scene> — <viewpoints or route per docs/PERFORMANCE_BENCHMARK.md §9–10>
- **Benchmark mode:** A — diagnostic / B — representative
- **Build type:** editor build / debug export / release export

## Hardware / software
- **OS:** <TBD if unknown>
- **CPU:** <TBD>
- **GPU:** <TBD>
- **GPU driver:** <TBD>
- **System RAM:** <TBD>
- **Godot version:** <e.g. 4.7.1.stable.official>

## Rendering configuration
- **Output resolution:** <WxH>
- **Internal/render resolution + scaling mode:** <or N/A>
- **Window mode:** windowed / fullscreen / maximized
- **Renderer (verified at runtime, §5.1):** <rendering method + driver/API>
- **VSync:** <state>
- **Frame cap:** <state>
- **Anti-aliasing:** <or N/A>
- **Shadows:** <or N/A>
- **Volumetric/fog:** <or N/A>
- **GI / reflections:** <or N/A>
- **Quality preset:** <or none>
- **Command-line arguments:** <all engine-affecting args, or none>
- **Relevant rendering project settings:** <non-default entries, or none>

## Run state
- **Cold/warm:** COLD / WARM (procedure used: <per §8>)
- **Sample duration:** <s per sample>

## Timing metrics (per sample)
| Sample | Mean (ms) | Median (ms) | Worst (ms) | p95 (ms) | p99 (ms) | FPS (reference) |
|---|---|---|---|---|---|---|
| <viewpoint 1> | | | | | | |
| ... | | | | | | |

## Rendering metrics (per sample)
| Sample | Rendered objects | Rendered primitives | Draw calls |
|---|---|---|---|
| <viewpoint 1> | | | |

## Memory metrics
- **Video memory used:** <bytes/MB>
- **Texture memory used:** <bytes/MB>
- **Buffer memory used:** <bytes/MB>
- **Static memory (debug builds only):** <or N/A in release>

## Pipeline compilation / stutter observations
- **Cold-pass compilation counts (MESH/SURFACE/DRAW/SPECIALIZATION):** <or N/A>
- **Mid-sample compilation stutters:** <observed / none>

## Profiler diagnosis (Mode A records; else "not applicable")
- **CPU/GPU split (Visual Profiler / --gpu-profile):** <finding>
- **Physics/script contribution:** <finding>
- **Likely bottleneck:** <one conclusion, or "not diagnosed">

## Deviations from protocol
- <list every deviation from docs/PERFORMANCE_BENCHMARK.md, or "none">

## Verdict
- **Comparability:** BASELINE / COMPARABLE with <record id> / NON-COMPARABLE (reason)
- **Result:** <e.g. "no regression vs <record>"; "regression in p99 (+<x> ms) attributed to <cause>"; budget verdict only when a budget exists>

## Notes
- <anything a future reader needs to interpret this record>
```

## 15. Deferred Decisions

The following are intentionally **not** defined by this document. Each is recorded with its owning decision and prerequisite, consistent with `docs/PERFORMANCE_BUDGET.md`.

| Decision | Status | Owning decision | Prerequisite |
|---|---|---|---|
| Target PC hardware specification | **DEFERRED** — proposed default until selected: benchmarks run on the Project Owner's development PC, with its exact hardware captured per §5 so comparisons remain self-consistent. No hardware is assumed by this document. | Project Owner with Orchestrator | Hardware selection (see `docs/VERTICAL_SLICE.md` §15.10) |
| Final frame-time/FPS, GPU, CPU, and memory budgets | **DEFERRED** — all exact values | Orchestrator, recorded in `docs/PERFORMANCE_BUDGET.md` | Target hardware + representative benchmark scene (M3) |
| Final graphics quality presets | **DEFERRED** — no preset selected | Orchestrator with Project Owner | M3 benchmark scene, so presets are chosen against representative content |
| Automated benchmark playback (fixed camera/player recording) | **DEFERRED** — not designed here | Orchestrator approval for a dedicated implementation task | Manual route proven insufficient for repeatability |
| 1% / 0.1% low instrumentation | **OPTIONAL** — allowed by §7 when practical | Implementation task that builds the sample recorder | Recorder implementation task |
| First permanent in-engine benchmark harness | **DEFERRED** — this document defines protocol, not code | Orchestrator approval | Evidence that manual recording is error-prone |

## 16. Success Criteria

This methodology succeeds when another agent can reproduce a benchmark **without inventing key conditions**. It passes when:

- benchmark modes are separated (§3) and never mixed;
- hardware/environment recording is defined (§5);
- resolution/settings recording is defined (§11);
- core metrics are defined with their Godot sources (§6);
- frame time is emphasized over FPS alone (§2, §6.1);
- CPU vs GPU diagnosis is defined (§12);
- cold vs warm behaviour is separated (§8);
- fixed benchmark viewpoints and the route concept are defined (§9–§10);
- statistical reporting is defined (§7);
- baseline/regression rules are defined (§13);
- a benchmark-result template exists (§14);
- the relationship to `docs/PERFORMANCE_BUDGET.md` is explicit (§1);
- no implementation, scenes, scripts, or project settings were changed by this document.

## 17. Repository Hygiene Observation (recorded, not resolved)

**Observation (2026-08-28):** `forward_plus` is the desktop-default value of `rendering/renderer/rendering_method`, and Godot's editor canonicalizes `project.godot` by dropping settings that equal their defaults. As a result, the explicit `renderer/rendering_method="forward_plus"` line in `project.godot` may be removed or re-added by normal editor use, independent of any intent. This line **is currently present** in the repository copy as of commit `53cd650`.

**Consequences:**

- No configuration churn is created to preserve the textual line; the Forward+ decision lives in `docs/ARCHITECTURE.md`, and benchmark records verify the renderer at runtime (§5.1).
- **Not resolved in this task** by design. Any canonicalization decision (e.g. accepting the line's disappearance as the canonical state, or defending the explicit line) belongs to the Orchestrator and is recorded here only as an observation.
