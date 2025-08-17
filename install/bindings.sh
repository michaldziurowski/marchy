#!/bin/bash
set -euo pipefail

FILE="${HOME}/.config/hypr/bindings.conf"

if [[ ! -f "$FILE" ]]; then
  echo "Error: $FILE does not exist." >&2
  exit 1
fi

# Targets to comment (exact full-line matches)
targets="$(mktemp)"
cat >"$targets" <<'EOF'
bindd = SUPER, B, Browser, exec, $browser
bindd = SUPER, G, Signal, exec, uwsm app -- signal-desktop
bindd = SUPER, O, Obsidian, exec, uwsm app -- obsidian -disable-gpu
bindd = SUPER, slash, Passwords, exec, uwsm app -- 1password
bindd = SUPER SHIFT, A, Grok, exec, $webapp="https://grok.com"
bindd = SUPER, C, Calendar, exec, $webapp="https://app.hey.com/calendar/weeks/"
bindd = SUPER, E, Email, exec, $webapp="https://app.hey.com"
bindd = SUPER ALT, G, Google Messages, exec, $webapp="https://messages.google.com/web/conversations"
EOF

tmp_out="$(mktemp)"
# Comment the exact lines if present and not already commented
awk -v RS='\n' '
  NR==FNR { t[$0]=1; next }
  {
    # If already commented (leading whitespace + #), leave as is
    if ($0 ~ /^[[:space:]]*#/) { print; next }
    # If exact match in targets, comment it
    if ($0 in t) { print "# " $0; next }
    # Otherwise print unchanged
    print
  }
' "$targets" "$FILE" >"$tmp_out"

mv -- "$tmp_out" "$FILE"
rm -f -- "$targets"

# Append line if not present (uncommented exact match)
append_line='bindd = SUPER SHIFT, return, Brave, exec, uwsm app -- brave'
if ! grep -Fxq -- "$append_line" "$FILE"; then
  printf '%s\n' "$append_line" >>"$FILE"
fi

echo "Done. Updated: $FILE"
