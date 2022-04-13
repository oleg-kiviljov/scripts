#!/bin/bash

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"
OHMYZSH_PLUGINS="git mix bundler npm docker heroku"

. "$THIS_DIR/utilities.sh"

if ! grep -q "plugins=($OHMYZSH_PLUGINS)" "$ZSHRC_PATH"; then
  SETUP_OHMYZSH="sed 's/plugins=(git)/plugins='($OHMYZSH_PLUGINS)' $ZSHRC_PATH"
  confirmAction "Add OhMyZsh plugins \"$OHMYZSH_PLUGINS\"" "$SETUP_OHMYZSH"
fi
