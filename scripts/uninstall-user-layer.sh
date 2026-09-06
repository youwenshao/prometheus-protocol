#!/usr/bin/env bash
# Remove user-level protocol files. Does not uninstall toolchains or GitHub.
# Does not delete the personal fork.

set -euo pipefail

cursor_home="${CURSOR_HOME:-$HOME/.cursor}"
prom_home="${PROMETHEUS_HOME:-$HOME/.prometheus}"

rm -f "$cursor_home/rules/prometheus.mdc"

if [[ -d "$cursor_home/skills" ]]; then
  find "$cursor_home/skills" -maxdepth 1 -type d -name 'prometheus-*' -exec rm -rf {} +
fi

rm -rf "$prom_home"

echo "removed_rule=$cursor_home/rules/prometheus.mdc"
echo "removed_skills=$cursor_home/skills/prometheus-*"
echo "removed_home=$prom_home"
echo "ok=yes"
