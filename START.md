# First session

The human pasted the kickstart prompt (or opened this folder and told you to begin). They may have no git, no GitHub, no package manager, and no map. You own the floor. Bootstrap is not the product — it is the floor. Then you ask what they wanted to build.

Do not narrate this file. Do not tour the industry. Do not install VS Code.

## 0. Get the protocol onto this machine

If `AGENTS.md` and `PROTOCOL.md` are already in the current workspace, skip this step.

Otherwise the user kicked off from a blank or unrelated folder. Fetch **https://github.com/youwenshao/prometheus-protocol** without making them operate git:

1. Prefer `~/Projects/prometheus-protocol` if `~/Projects` exists, else `~/prometheus-protocol`. If that path already has `AGENTS.md`, use it.
2. If `git` exists: `git clone https://github.com/youwenshao/prometheus-protocol.git` into that path.
3. If `git` does not exist: download `https://github.com/youwenshao/prometheus-protocol/archive/refs/heads/main.zip`, unzip, move the inner folder to that path.
4. Switch the workspace to that folder if you can (`move_agent_to_root` or equivalent). If you cannot, tell them one sentence: **File → Open Folder…** on that path, then paste the same kickstart prompt again. Stop and wait. Do not continue from a workspace that cannot see these files.
5. Read `AGENTS.md`, then continue this file from the next section.

Fetching the public protocol is green (read-only). Do not ask. Installing tools after that is still yellow.

## 1. Already done?

If `~/.prometheus/install.json` exists and `user/PROFILE.md` (here or at the recorded personal repo) exists, this is not a first session. Read `skills/session-memory/SKILL.md` and continue. Do not re-install.

## 2. Silent recon

Run `scripts/doctor.sh` if you can. If you cannot execute it, perform the same checks by hand. Do not ask the user to run commands they do not understand.

Read the report. Do not recite it.

## 3. One yellow consent

If the baseline is incomplete, ask **once**, consequence language, time estimate. Not a tool list.

Shape:

> This computer can't yet keep work going after we close this chat. I want about fifteen minutes and your okay to install the standard local tools I need so I can save progress, continue later, and not strand you. You may see a password prompt. I will stop before creating any accounts or putting anything on the internet. OK?

If they say no: work with what exists. Record the refusal. State the continuity cost in one sentence. Do not nag.

If they say yes: read `skills/bootstrap-machine/SKILL.md` and install in dependency order. Skip what doctor says is already there. One-clause consequence narration as you go. Ledger every step.

## 4. Red: identity

After baseline (or if git/`gh` already exist), read `skills/accounts-and-identity/SKILL.md`.

- Git name and email: ask. Do not invent. Do not silently write git config.
- GitHub: recommend it as **continuity for the work**, not professional identity. One yes. Then `gh auth login`. You cannot create the account for them (email, captcha, 2FA). Open the browser, wait, resume. Verify `gh auth status`.
- If they refuse GitHub: local git only. Say the cost: a new chat or a new machine may not see this work. Continue.

## 5. Personal fork and memory

Goal: a repo that is *theirs*, with `user/` filled, so a later chat can continue.

- If they have GitHub auth: create a personal repo (fork this one, or generate from it). Clone that if this folder is a ZIP without `.git`.
- If they do not: initialize git in this folder (or `~/Projects/my-prometheus` if this folder looks disposable) and write `user/` here.
- Copy `templates/PROFILE.md`, `templates/LEDGER.md`, `templates/HABITS.md` into `user/` if missing. Fill the profile from doctor + this session. Start the ledger.
- Record the personal repo path in `~/.prometheus/install.json` when you install the user layer.

Never put secrets in `user/`.

## 6. Install the user layer

This is why the protocol survives the next folder.

Read `skills/consent-and-risk/SKILL.md`. This copy is yellow: it writes Cursor rules and skills into their home directory.

Run `scripts/install-user-layer.sh` from this repo. Confirm `~/.cursor/rules/prometheus.mdc` and `~/.prometheus/install.json` exist. Ledger it.

If the script cannot run, copy by hand:

- `.cursor/rules/prometheus.mdc` → `~/.cursor/rules/prometheus.mdc`
- each `skills/*` → `~/.cursor/skills/prometheus-<name>/`
- `PROTOCOL.md`, `AGENTS.md`, `START.md`, `UNINSTALL.md`, `VERSION` → `~/.prometheus/`

## 7. Debrief, then the real work

Plain language. No tool catalog.

- What exists now that didn't.
- What changed on this machine (and what did not: you did not take over their GitHub beyond what they clicked).
- How to start the next chat: open Cursor and say what they want. They do not need this folder open.
- How to undo: say `Uninstall the Prometheus Protocol` or open `UNINSTALL.md`.
- Then ask what they wanted to build.

If they already said the objective at the start, do not make them repeat it. After the floor exists, pursue it. Read `skills/new-project/SKILL.md` if the work does not belong inside this protocol repo.

## Resume mid-flight

If this chat dies during steps 0–6: the next chat reads the ledger, runs doctor, and continues at the first incomplete step. Do not start over. See `skills/session-memory/SKILL.md`.
