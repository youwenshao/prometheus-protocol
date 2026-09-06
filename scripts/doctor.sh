#!/usr/bin/env bash
# Silent reconnaissance. Prints machine-readable KEY=value and gap= lines.
# Exit 0 even when gaps exist (gaps are data, not failure).
# Do not print tokens, emails, or key material.

set -u

version="0.1.0"
if [[ -f "$(dirname "$0")/../VERSION" ]]; then
  version="$(tr -d '[:space:]' < "$(dirname "$0")/../VERSION")"
fi

have() {
  command -v "$1" >/dev/null 2>&1
}

os="unknown"
arch="$(uname -m 2>/dev/null || echo unknown)"
kernel="$(uname -s 2>/dev/null || echo unknown)"

case "$kernel" in
  Darwin) os="macos" ;;
  Linux)
    if grep -qi microsoft /proc/version 2>/dev/null; then
      os="wsl"
    else
      os="linux"
    fi
    ;;
  MINGW*|MSYS*|CYGWIN*) os="windows" ;;
  *) os="unknown" ;;
esac

shell_name="${SHELL:-unknown}"
shell_name="${shell_name##*/}"

pkg="missing"
if have brew; then
  pkg="homebrew"
elif have apt-get; then
  pkg="apt"
elif have dnf; then
  pkg="dnf"
elif have pacman; then
  pkg="pacman"
elif have zypper; then
  pkg="zypper"
elif have apk; then
  pkg="apk"
elif have winget; then
  pkg="winget"
elif have choco; then
  pkg="chocolatey"
fi

git_bin="missing"
git_version=""
if have git; then
  git_bin="ok"
  git_version="$(git --version 2>/dev/null | awk '{print $3}')"
fi

git_name_set="no"
git_email_set="no"
if [[ "$git_bin" == "ok" ]]; then
  if git config --global --get user.name >/dev/null 2>&1; then
    git_name_set="yes"
  fi
  if git config --global --get user.email >/dev/null 2>&1; then
    git_email_set="yes"
  fi
fi

gh_bin="missing"
gh_version=""
if have gh; then
  gh_bin="ok"
  gh_version="$(gh --version 2>/dev/null | head -n1 | awk '{print $3}')"
fi

gh_auth="no"
if [[ "$gh_bin" == "ok" ]]; then
  if gh auth status >/dev/null 2>&1; then
    gh_auth="yes"
  fi
fi

node_bin="missing"
node_version=""
if have node; then
  node_bin="ok"
  node_version="$(node --version 2>/dev/null | tr -d 'v')"
fi

node_vm="missing"
if have fnm; then
  node_vm="fnm"
elif have nvm; then
  node_vm="nvm"
elif [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  node_vm="nvm"
fi

uv_bin="missing"
uv_version=""
if have uv; then
  uv_bin="ok"
  uv_version="$(uv --version 2>/dev/null | awk '{print $2}')"
fi

python_bin="missing"
if have python3; then
  python_bin="ok"
elif have python; then
  python_bin="ok"
fi

cursor_hint="unknown"
if [[ -n "${CURSOR_TRACE_ID:-}" ]] || [[ -n "${CURSOR_PROJECT_DIR:-}" ]]; then
  cursor_hint="likely"
fi
if have cursor; then
  cursor_hint="cli"
fi

user_layer="no"
if [[ -f "$HOME/.cursor/rules/prometheus.mdc" ]] && [[ -f "$HOME/.prometheus/install.json" ]]; then
  user_layer="yes"
elif [[ -f "$HOME/.prometheus/install.json" ]]; then
  user_layer="partial"
fi

personal_repo=""
if [[ -f "$HOME/.prometheus/install.json" ]]; then
  personal_repo="$(
    # Prefer python for JSON; fall back to a crude grep.
    if have python3; then
      python3 -c 'import json,sys; print(json.load(open(sys.argv[1])).get("personal_repo",""))' \
        "$HOME/.prometheus/install.json" 2>/dev/null || true
    else
      grep -o '"personal_repo"[[:space:]]*:[[:space:]]*"[^"]*"' "$HOME/.prometheus/install.json" 2>/dev/null \
        | head -n1 | sed 's/.*"personal_repo"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/'
    fi
  )"
fi

gaps=()
[[ "$pkg" == "missing" ]] && gaps+=("package_manager")
[[ "$git_bin" == "missing" ]] && gaps+=("git")
[[ "$gh_bin" == "missing" ]] && gaps+=("gh")
[[ "$node_bin" == "missing" && "$node_vm" == "missing" ]] && gaps+=("node")
[[ "$uv_bin" == "missing" ]] && gaps+=("uv")
[[ "$gh_auth" == "no" ]] && gaps+=("github_auth")
[[ "$git_name_set" == "no" || "$git_email_set" == "no" ]] && gaps+=("git_identity")
[[ "$user_layer" != "yes" ]] && gaps+=("user_layer")

echo "prometheus_doctor=$version"
echo "os=$os"
echo "arch=$arch"
echo "kernel=$kernel"
echo "shell=$shell_name"
echo "package_manager=$pkg"
echo "git=$git_bin"
echo "git_version=${git_version:-}"
echo "git_name_set=$git_name_set"
echo "git_email_set=$git_email_set"
echo "gh=$gh_bin"
echo "gh_version=${gh_version:-}"
echo "gh_auth=$gh_auth"
echo "node=$node_bin"
echo "node_version=${node_version:-}"
echo "node_version_manager=$node_vm"
echo "uv=$uv_bin"
echo "uv_version=${uv_version:-}"
echo "python=$python_bin"
echo "cursor=$cursor_hint"
echo "user_layer=$user_layer"
echo "personal_repo=${personal_repo:-}"
echo "gap_count=${#gaps[@]}"
if [[ ${#gaps[@]} -eq 0 ]]; then
  echo "gap=none"
else
  for g in "${gaps[@]}"; do
    echo "gap=$g"
  done
fi

exit 0
