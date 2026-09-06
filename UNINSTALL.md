# Uninstall the Prometheus Protocol

The user owns the machine. Leaving must be as clean as arriving. Do not lecture. Do not guilt. Confirm, then remove.

This file is for the agent first. A human can follow the same steps.

## What this removes

- User-level Cursor rule: `~/.cursor/rules/prometheus.mdc`
- User-level Cursor skills named `prometheus-*` under `~/.cursor/skills/`
- Local core copy and install record: `~/.prometheus/`

## What this does not remove

- Tools installed during setup (package manager, git, `gh`, language runtimes). Those remain useful. Offer to list them from the ledger; do not uninstall them unless the user asks.
- The personal fork or `user/` profile, ledger, and habits. Ask whether to keep that folder. Default: **keep**.
- GitHub accounts, SSH keys, or git identity. Those are the user's. Never delete keys or accounts as part of uninstall.

## Agent procedure

1. Read `~/.prometheus/install.json` if it exists. It names what was installed and where the personal repo lives.
2. Say, in one short paragraph: you will remove the protocol's Cursor rules, skills, and local copy. Tools and the GitHub account stay. Ask for a yes.
3. On yes, run `scripts/uninstall-user-layer.sh` from this repo if available; otherwise delete the paths above by hand.
4. Confirm each path is gone. Append one last ledger line if the personal repo is being kept: `uninstalled protocol user-layer`.
5. Tell the user they can delete this folder (or the personal fork) whenever they want. If they want tools removed too, wait for a separate yes and a specific list.

## Human procedure (no agent)

In a terminal:

```bash
rm -f "$HOME/.cursor/rules/prometheus.mdc"
rm -rf "$HOME/.cursor/skills"/prometheus-*
rm -rf "$HOME/.prometheus"
```

That is enough to stop the protocol from loading in future chats.
