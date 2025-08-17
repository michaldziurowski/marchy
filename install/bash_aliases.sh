#!/bin/bash

BASHRC="$HOME/.bashrc"

add_alias() {
  local name="$1"
  local command="$2"

  if grep -qE "^[[:space:]]*alias[[:space:]]+$name=" "$BASHRC"; then
    echo "Alias '$name' already exists in $BASHRC"
  else
    echo "alias $name='$command'" >>"$BASHRC"
    echo "Added alias '$name=$command' to $BASHRC"
  fi
}

add_alias l "ls"
add_alias la "ls -a"
add_alias v "nvim"
