#!/usr/bin/env bash
# Copy protocol rules, skills, and core docs into the user's home.
# Idempotent. Does not install language toolchains. Does not touch user/.

set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cursor_home="${CURSOR_HOME:-$HOME/.cursor}"
prom_home="${PROMETHEUS_HOME:-$HOME/.prometheus}"
personal_repo="${1:-}"
timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
version="0.1.0"
if [[ -f "$root/VERSION" ]]; then
  version="$(tr -d '[:space:]' < "$root/VERSION")"
fi

mkdir -p "$cursor_home/rules" "$cursor_home/skills" "$prom_home"

if [[ -f "$root/.cursor/rules/prometheus.mdc" ]]; then
  cp "$root/.cursor/rules/prometheus.mdc" "$cursor_home/rules/prometheus.mdc"
fi

# Install each shipped skill as ~/.cursor/skills/prometheus-<dir>/
if [[ -d "$root/skills" ]]; then
  for skill_dir in "$root/skills"/*; do
    [[ -d "$skill_dir" ]] || continue
    [[ -f "$skill_dir/SKILL.md" ]] || continue
    name="$(basename "$skill_dir")"
    dest_name="$name"
    case "$name" in
      prometheus-*) ;;
      *) dest_name="prometheus-$name" ;;
    esac
    dest="$cursor_home/skills/$dest_name"
    mkdir -p "$dest"
    cp -R "$skill_dir/." "$dest/"
  done
fi

for f in PROTOCOL.md AGENTS.md START.md UNINSTALL.md VERSION; do
  if [[ -f "$root/$f" ]]; then
    cp "$root/$f" "$prom_home/$f"
  fi
done

if [[ -d "$root/skills" ]]; then
  rm -rf "$prom_home/skills"
  mkdir -p "$prom_home/skills"
  cp -R "$root/skills/." "$prom_home/skills/"
fi

if [[ -d "$root/templates" ]]; then
  rm -rf "$prom_home/templates"
  mkdir -p "$prom_home/templates"
  cp -R "$root/templates/." "$prom_home/templates/"
fi

# Preserve an existing personal_repo if the caller did not pass one.
if [[ -z "$personal_repo" && -f "$prom_home/install.json" ]]; then
  if command -v python3 >/dev/null 2>&1; then
    personal_repo="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1])).get("personal_repo",""))' "$prom_home/install.json" 2>/dev/null || true)"
  fi
fi

if [[ -z "$personal_repo" ]]; then
  personal_repo="$root"
fi

if command -v python3 >/dev/null 2>&1; then
  python3 - "$prom_home/install.json" "$version" "$timestamp" "$root" "$personal_repo" <<'PY'
import json, sys
path, version, timestamp, source, personal = sys.argv[1:6]
data = {
    "protocol": "prometheus",
    "version": version,
    "installed_at": timestamp,
    "source_repo": source,
    "personal_repo": personal,
    "cursor_rules": True,
    "cursor_skills": True,
}
with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
PY
else
  cat > "$prom_home/install.json" <<EOF
{
  "protocol": "prometheus",
  "version": "$version",
  "installed_at": "$timestamp",
  "source_repo": "$root",
  "personal_repo": "$personal_repo",
  "cursor_rules": true,
  "cursor_skills": true
}
EOF
fi

echo "installed_rule=$cursor_home/rules/prometheus.mdc"
echo "installed_home=$prom_home"
echo "personal_repo=$personal_repo"
echo "version=$version"
echo "ok=yes"
