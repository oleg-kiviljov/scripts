#!/bin/zsh

set -e

ZSHRC_PATH="$HOME/.zshrc"
ZPROFILE_PATH="$HOME/.zprofile"

confirmAction () {
  local ASK="$1"
  local ACTION="$2"

  while true; do
    printf "==> $ASK (y/N) ?"
    read yn
    case $yn in
        [Yy]* ) eval "$ACTION"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
  done
}

isInstalled () {
  local COMMAND_NAME="$1"

  if ! command -v "$COMMAND_NAME" &> /dev/null; then
    echo "\"$COMMAND_NAME\" is not installed."
    false
  else
    true
  fi
}
