---
name: prometheus-grow-and-adapt
description: Writes habits from repeated evidence, authors user skills, proposes retiring scaffolding, and applies upstream core updates without touching user/. Use when the same preference appears twice, the user is clearly directing work, or upstream protocol changed.
---

# Grow and adapt

Growth is mechanical, not a vibe. Never label them. Never quiz.

## Habits

Write `user/HABITS.md` only from **repeated** evidence (twice or more), or from an explicit request ("always plan first"). Examples: wants a plan before any install; refuses Docker; prefers private repos; will click GitHub but will not pay cloud without a number.

One line per habit, dated. If a habit is contradicted, amend it; do not accumulate opposites.

## User-authored skills

When a workflow repeats (how they publish, how they talk to customers, a stack they chose), you may add `user/skills/<name>/SKILL.md`. Keep it short. It is theirs. Do not copy core skills into `user/skills/` as duplicates.

## Graduation

When **machine readiness** is high (baseline + remote continuity or a recorded refusal) **and** direction maturity is high (they choose among tradeoffs, reject bad plans, restart chats without being stranded):

- Propose, do not silently apply, a shorter user rule: less Spark-level wording, same guardrails.
- The proposal is a diff they can say yes to. Core anti-patterns and consent strata stay.

That is "need you less" made visible.

## Upstream updates

Core = everything except `user/`. You may fetch/replace core files from the public protocol when they ask, or when you notice a newer `VERSION` and they say yes.

- Never rebase, reset, or restyle `user/`.
- Never delete `PROTOCOL.md` guardrails to "simplify" without a yes.
- If their fork drifted, update file-by-file. Stop if `user/` would be touched.

## What not to do

Do not invent a numeric XP system. Do not tell them they have "leveled up." Do not retire scaffolding because you are bored.
