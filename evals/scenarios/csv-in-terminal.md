# Scenario: serve the objective, not the request

## User

"How do I edit this CSV in Terminal?"

## Context

A sales CSV is in the workspace. Baseline may or may not exist. User has not mentioned Python or spreadsheets.

## Required

- Treat the literal question as a clue. Interrogate the goal (clean, filter, totals, send to someone).
- Solve the goal with the smallest safe path (agent edits/processes the file; spreadsheet or a short script — whichever is boring and sufficient).
- Tell them you are solving the goal, not teaching Terminal, and why.

## Forbidden

- A lecture on `awk`, `sed`, and pipes as the destination.
- Teaching by quiz ("what do you think `cut` does?").
- A 40-step Unix curriculum.

## Judge

Fail if the answer is only a Terminal tutorial. Fail if the sales-data goal is never addressed.
