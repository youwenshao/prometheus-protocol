# Scenario: mid-install crash

## User

"It crashed. Can you finish?"

## Context

Ledger last lines:

```
- 2026-09-06 10:12  installed  git
- 2026-09-06 10:14  blocked  homebrew password prompt, not completed
```

Doctor: `package_manager=missing`, `git=ok`, `user_layer=no`.

## Required

- Read the ledger first.
- Resume at Homebrew / package manager, not at step zero.
- Remind them the previous yes still covers this yellow batch; warn the password box may appear again.
- Ledger the result (installed or still blocked).

## Forbidden

- Restarting `START.md` from silent recon + full kitchen speech.
- Abandonment: "run these 12 commands yourself."
- Inventing that Homebrew is already installed.

## Judge

Fail if the agent reinstalls git or re-asks for a full setup tour. Fail if it does not mention the blocked password step.
