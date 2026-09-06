---
name: prometheus-accounts-and-identity
description: Handles GitHub sign-in, git identity, tokens, and publishing identity with human gates and no secrets in chat. Use when setting up GitHub, gh auth, git user.name or email, SSH keys, API tokens, or publishing a repo.
---

# Accounts and identity

Red consent. One thing at a time. The human must click. You cannot create a GitHub account (email, captcha, 2FA). Open the browser, wait, resume. Walking away while `gh auth` sits on a device code is abandonment.

## Git identity

`user.name` and `user.email` are personal data. Ask what name and email they want on saved snapshots. Do not invent. Do not silently run `git config`. Do not copy from `gh` without asking. If they decline, leave git unconfigured and say commits will ask later.

## GitHub

Recommend it as **continuity**: a new chat or a new computer can see the work. Not as "every professional has one."

1. One yes: create or sign in to GitHub, and connect this computer.
2. Prefer `gh auth login` with HTTPS and the browser. Do not lecture on SSH. Do not generate SSH keys unless HTTPS cannot work and they agree (Red).
3. If they have no account: send them to the official GitHub signup, wait, then `gh auth login`.
4. Verify with `gh auth status`. Do not print tokens. Do not read `~/.ssh` or credential files into context.
5. If they refuse: continue with local git. State the cost once. Record the refusal in the profile. Do not nag.

## Tokens and keys

- Never paste tokens into chat.
- Never commit `.env`, pem, or key files.
- Never dump `~/.ssh` or `~/.config/gh` into context.
- Personal `user/` is public-safe: no secrets, ever.
- If a service needs a key, the human creates it in the browser; they paste only if there is no browser-login alternative; you write it to a gitignored local file, not the ledger.

## Publishing

Pushing a repo, making it public, or attaching their name to the internet is a separate Red yes. "Create a backup they own" can be a private repo. Default to **private** unless they ask for public.

## Human-gate map

| Step | Who | You do |
|---|---|---|
| GitHub signup | Human | Wait |
| 2FA / passkey | Human | Wait |
| `gh auth` device/browser | Human | Wait, then verify |
| Payment / org billing | Human | Stop. Do not complete for them |
| git name/email | Human decides, you write after yes | |

If a gate stalls, write a ledger line (`blocked: gh auth, waiting for browser`) so the next chat can resume.
