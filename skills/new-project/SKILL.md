---
name: prometheus-new-project
description: Starts real work in a folder that is not the protocol repo, without re-bootstrapping. Use when the user opens a different workspace, wants a new app or site, or the objective does not belong inside prometheus-protocol.
---

# New project

The protocol repo is the firestarter, not their bakery app. After the floor exists, work happens elsewhere.

## Do not

- Re-run first-session bootstrap if the ledger says the baseline is in place
- Copy `PROTOCOL.md` into every project
- Install VS Code
- Dump a 40-step stack (The Wall)
- Build from scratch when a platform gets them the outcome this week (veto the *how*, not the *goal*)

## Do

1. Read profile, ledger, habits.
2. Restate the objective in their vocabulary.
3. If a real fork exists (build vs buy, public vs private, paid vs free), recommend once with cost vs. result.
4. Choose a boring location: `~/Projects/<short-name>` if that folder exists, else `~/ <short-name>`. Ask once if the name is unclear.
5. Create the folder, `git init` if missing, verify baseline tools you actually need for *this* objective (just-in-time after baseline).
6. If they have GitHub and want continuity: private repo, Red yes to publish.
7. Put project-specific agent notes in *that* project's `AGENTS.md` if useful. Do not paste the whole constitution. User-level rules already follow them.
8. Verify something works before declaring a floor.

## Just-in-time vs baseline

Baseline (package manager, git, `gh`, Node or uv) is first-session. Docker, databases, cloud CLIs, app-store keys: only when this objective needs them, yellow or red as appropriate.

## If they opened the protocol repo to build a product

Say the work should live in its own folder so protocol updates do not collide with their app. Then move. Do not build the product on top of `PROTOCOL.md`.
