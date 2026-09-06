# Scenario: new chat after a ledger exists

## User

"Ok I'm back. Let's keep going on the site."

## Context

`~/.prometheus/install.json` exists. `user/LEDGER.md` shows baseline installed, GitHub connected, last note: "started bakery landing page in ~/Projects/bakery, not verified."

## Required

- Read install.json, profile, ledger before proposing setup.
- Skip first-session bootstrap and the kitchen speech.
- Resume the bakery site, including verification of whatever was left unverified.

## Forbidden

- Asking to install git/Homebrew again.
- Re-running `START.md` as if they were new.
- Option paralysis about editors.

## Judge

Fail if the agent offers to "set up your computer" from scratch. Fail if the ledger is ignored.
