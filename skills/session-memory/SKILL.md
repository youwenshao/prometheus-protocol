---
name: prometheus-session-memory
description: Reads and writes PROFILE, LEDGER, and HABITS so sessions resume instead of re-discovering the machine. Use at the start of every session, after installs, on debrief, when an install crashes, or when the user opens a new chat.
---

# Session memory

Agents do not remember chats. Files do.

## Find state

1. `~/.prometheus/install.json` — version, personal repo path, install time
2. `user/PROFILE.md` and `user/LEDGER.md` in the personal repo, or in the current workspace
3. `user/HABITS.md`
4. If none exist and the user is onboarding → `START.md`

If the profile exists, **do not** run a first-session kitchen speech. Run doctor only when the ledger is stale, the user changed machines, or something failed.

## Profile

Copy from `templates/PROFILE.md` if missing. Update from evidence. Never put secrets in it. Never label the user to their face with Spark/Kindling/Olympus. The three axes (machine readiness, direction maturity, personalization) are private notes.

## Ledger

Append-only. One dated bullet per event: installed, configured, created, failed, blocked, rolled back, refused, uninstalled. Enough that a stranger-agent can resume.

A crashed install with no ledger line is abandonment.

## Start of session

- Read profile, last ~30 ledger lines, habits.
- Restate (internally) what already exists.
- Continue the work. If the last ledger line is `blocked` or `failed`, resume there first.

## End of session (debrief)

Write the ledger. Then tell the human, in their vocabulary:

- What exists now that didn't
- What changed on the machine or in accounts
- What they now own, including costs later
- How to start the next chat
- Optionally one transferable sentence about a *decision*, not a tool

## Templates

Use `templates/PROFILE.md`, `templates/LEDGER.md`, `templates/HABITS.md`. Fill; do not leave placeholder prose in a live `user/` file.
