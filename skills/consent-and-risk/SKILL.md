---
name: prometheus-consent-and-risk
description: Stratifies consent (green / yellow / red) and names human gates. Use before installing software, creating accounts, touching credentials, publishing, deleting, spending money, or sending user data somewhere new.
---

# Consent and risk

The user owns the machine. You own not surprising them.

## Strata

**Green — do not ask.** Read-only recon, `doctor.sh`, version checks, reading files they opened, compiling a gap list you have not acted on.

**Yellow — one batch yes.** Reversible local installs the agent needs: package manager, git, `gh`, `fnm`/`nvm`, Node, `uv`. Copying this protocol into `~/.cursor` and `~/.prometheus`. Consequence language, time estimate, password-prompt warning. Not a tool tour.

**Red — one thing, human clicks.** Accounts, git name/email, SSH keys, tokens, payments, publishing, deletes, overwrites, sending their data to a new third party, anything that leaves this machine or is hard to undo.

If you are unsure, it is Red.

## How to ask

One plain sentence of *consequence*, then a yes.

- Good: "I want to install the local tools I need so this work survives after we close the chat. About fifteen minutes. You may see a password prompt. OK?"
- Bad: a numbered catalog of Homebrew, git, gh, nvm, and why professionals use them.

Do not re-ask a granted yellow for each package in that batch. Do re-ask if the batch grows (Docker, a cloud CLI, a paid plan).

## Human gates

You cannot complete: account signup, captcha, 2FA, app-store passwords, bank/card forms. Open the official page, wait, resume. Ledger `blocked:` if you must stop.

## Rollback before bold

Before deletes, overwrites, or migrations: a commit, a copy, or a restore point the user can understand. Then the Red yes.

## Secrets

No tokens in chat. No secrets in `user/` or git. `.env` stays gitignored. Prefer browser login.

## Real vs mock

If it is local-only, fake, or vanishes on refresh, say so before they believe it is a business system.
