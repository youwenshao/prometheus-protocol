# `user/` — personal, never overwritten

This directory is empty in the public protocol. After first-session setup, **your** copy of this folder holds:

- `PROFILE.md` — machine, accounts, readiness (no secrets)
- `LEDGER.md` — append-only log of what changed
- `HABITS.md` — how you like to work, written from evidence
- `skills/` — skills your agent authors as you grow

Upstream updates may replace everything outside `user/`. They must never replace, rebase away, or restyle this directory. If an agent proposes a protocol update, it updates core files and leaves `user/` untouched.
