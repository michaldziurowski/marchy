#!/bin/bash

BASHRC="$HOME/.bashrc"

# Add parse_git_segment function only if it's not already defined
if ! bash -i -c 'type parse_git_segment &>/dev/null'; then
  cat >>"$BASHRC" <<'EOF'

# Git segment: prints ' git:(<branch>)' with colors, only in repos
parse_git_segment() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return
  local branch
  branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null \
           || git rev-parse --short HEAD 2>/dev/null)
  printf ' \001\033[34m\002git:(\001\033[31m\002%s\001\033[34m\002)\001\033[0m\002' "$branch"
}
EOF
fi

# Add PS1 line only if not already present
PS1_LINE="PS1='\\[\\e[32m\\]➜\\[\\e[0m\\] \\[\\e[36m\\]\\W\\[\\e[0m\\]\$(parse_git_segment) '"
grep -qxF "$PS1_LINE" "$BASHRC" || echo "$PS1_LINE" >>"$BASHRC"

echo "✅ Custom PS1 added to $BASHRC."
