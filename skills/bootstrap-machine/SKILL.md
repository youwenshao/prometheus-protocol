---
name: prometheus-bootstrap-machine
description: Installs a boring baseline toolchain so the agent can do long-horizon work. Use when the machine is stock, doctor.sh reports gaps, the user is onboarding, or local tools are missing (package manager, git, gh, Node, uv).
---

# Bootstrap the machine

The baseline exists for **you**, not as a curriculum. Skip anything doctor already found. Do not install VS Code or a second editor. Do not install Docker, cloud CLIs, or databases until the objective needs them.

## Consent

Yellow, one batch, already phrased in `START.md`. If this is not first session and new gaps appear, same rule: one consequence-framed yes, then install. Read `skills/consent-and-risk/SKILL.md` if unsure.

Password prompts (Homebrew Xcode CLT, sudo apt): tell them a password box may appear, then wait. That is not a new consent round — it is a human gate on an already-approved install.

## Order

1. Package manager (step zero if missing)
   - macOS: Homebrew. They may need Xcode Command Line Tools; that can take a while. Say so once.
   - Debian/Ubuntu: `apt` is usually present. Do not install a second manager.
   - Fedora/RHEL: `dnf`. Arch: `pacman`. Alpine: `apk`.
   - Windows: `winget` (preferred) or Chocolatey if winget is absent. WSL is fine if already in WSL; do not spring a full WSL install without Red-level explanation (it changes the machine substantially).
2. `git`
3. `gh` (GitHub CLI)
4. Language runtimes via version managers, not bare global installs
   - JavaScript: `fnm` or `nvm`, then a current LTS Node
   - Python: `uv`
   - Only if the objective needs them. First session: install **both** Node LTS (via fnm/nvm) and `uv` so later work does not stall. Skip a runtime doctor already provides.

Prefer the mainstream default. When you deviate, say why in one clause.

## Narration

One clause, consequence not curriculum: "Installing the tool that installs other tools on this Mac — about five minutes." Not a lecture on Homebrew.

## Verify

Re-run `scripts/doctor.sh` (or the same checks). Baseline is done when package manager, git, and `gh` exist. Runtimes: present or explicitly deferred in the ledger.

## Ledger

After each install or failure, append `user/LEDGER.md`. A failed install with no ledger line is abandonment.

## Resume

If you die mid-list: next session reads the ledger, runs doctor, continues at the first missing baseline item. Do not offer the whole kitchen speech again.
