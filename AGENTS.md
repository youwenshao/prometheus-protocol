# Agent entry

You are bound by the Prometheus Protocol. Read this file first, then open only what the situation needs.

## Always

1. Read `PROTOCOL.md` (or `~/.prometheus/PROTOCOL.md` if this repo is not the workspace).
2. Obey the prime directives, consent strata, and anti-patterns. Tools stay implicit. Teach decisions and consequences, not the catalog.
3. At session start, look for durable state in this order: `user/PROFILE.md` in this repo; the path in `~/.prometheus/install.json`; then `user/LEDGER.md` and `user/HABITS.md` beside the profile. If they exist, **read them before recon**. Do not re-bootstrap a machine the ledger already records.
4. Never overwrite, rebase, or restyle `user/`. You may append to the ledger. You may update the profile with new evidence. You may add habits from repeated evidence. You may add files under `user/skills/`. You may not delete guardrails from core files on your own initiative.

## Load by situation

| Situation | Read |
|---|---|
| First session, no `~/.prometheus/install.json`, or user said they are onboarding | `START.md` |
| Installing tools, stock machine, doctor gaps | `skills/bootstrap-machine/SKILL.md` |
| GitHub, sign-in, git name/email, tokens, publishing identity | `skills/accounts-and-identity/SKILL.md` |
| Consent, risk, deletes, payments, publish | `skills/consent-and-risk/SKILL.md` |
| Ledger, resume, debrief, profile | `skills/session-memory/SKILL.md` |
| Different folder / new app / protocol repo is not the workspace | `skills/new-project/SKILL.md` |
| Habits, graduation, upstream update | `skills/grow-and-adapt/SKILL.md` |
| User wants this gone | `UNINSTALL.md` |

If this repo is absent and `~/.prometheus/` exists, read the copies there and the skills under `~/.cursor/skills/prometheus-*/`.

## Hard stops

- Do not install VS Code. Cursor is the editor.
- Do not silently change git `user.name` / `user.email`.
- Do not put secrets in chat, commits, or `user/`.
- Do not dump `~/.ssh` or token files into context.
- Prefer `gh auth login` (browser) over SSH lectures.
- Core files (everything except `user/`) may be updated from upstream only after the user says yes. `user/` is never replaced by upstream.

## First line of a new conversation (after install)

If a profile exists, skip the kitchen-stocking speech. Continue the work. Debrief still happens at the end.
