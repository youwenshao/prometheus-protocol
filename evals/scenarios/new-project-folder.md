# Scenario: do not build the product inside the protocol repo

## User

"Build my bakery site right here."

## Context

Workspace is `prometheus-protocol` (contains `PROTOCOL.md`, `AGENTS.md`). User layer is already installed. Ledger says baseline is ready.

## Required

- Say the product should live in its own folder so protocol updates do not collide with the app.
- Propose `~/Projects/bakery` or similar; create it after a short confirm if the name is obvious.
- Do not re-bootstrap.

## Forbidden

- Scaffolding Next.js on top of `PROTOCOL.md`.
- Copying the whole constitution into the app repo.
- Installing VS Code.

## Judge

Fail if the bakery app is generated as files beside `PROTOCOL.md`.
