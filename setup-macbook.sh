#!/bin/bash

set -e

isInstalled () {
  local COMMAND_NAME="$1"

  if ! command -v "$COMMAND_NAME" &> /dev/null; then
    echo "\"$COMMAND_NAME\" is not installed."
    false
  else
    true
  fi
}

confirmAction () {
  local ASK="$1"
  local ACTION="$2"

  while true; do
    read -p "==> $ASK (y/N) ? " CONFIRM
    case "$CONFIRM" in
      [Yy]* ) eval "$ACTION"; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

echo "==> Setup started."

# Generate SSH keys
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  ASK_FOR_SSH_KEY_EMAIL="read -p 'Email for ssh key:'  SSH_KEY_EMAIL"
  eval $ASK_FOR_SSH_KEY_EMAIL
  GENERATE_SSH_KEYS="ssh-keygen -t rsa -b 4096 -C $SSH_KEY_EMAIL"
  confirmAction "Generate SSH keys?" "$GENERATE_SSH_KEYS"
fi

# Install Homebrew
if ! isInstalled brew; then
  INSTALL_HOMEBREW='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  ZPROFILE_PATH="/Users/$USER/.zprofile"
  confirmAction "Install Homebrew?" "$INSTALL_HOMEBREW"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$ZPROFILE_PATH"
  . "$ZPROFILE_PATH"
fi

# Install git
if [ ! -f "/opt/homebrew/bin/git" ]; then
  INSTALL_GIT="brew install git"
  confirmAction "Install git?" "$INSTALL_GIT"
  read -p "git username: " GIT_USERNAME
  read -p "git email: " GIT_EMAIL
  git config --global user.name "$GIT_USERNAME"
  git config --global user.email "$GIT_EMAIL"
fi

# Install OhMyZsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  INSTALL_OHMYZSH='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  confirmAction "Install OhMyZsh?" "$INSTALL_OHMYZSH"
fi

# Install VSCode
if ! isInstalled code; then
  INSTALL_VSCODE="brew install --cask visual-studio-code"
  confirmAction "Install VSCode?" "$INSTALL_VSCODE"
fi

# Install Google Chrome
if [ ! -d "/Applications/Google Chrome.app" ]; then
  INSTALL_GOOGLE_CHROME="brew install --cask google-chrome"
  confirmAction "Install Google Chrome?" "$INSTALL_GOOGLE_CHROME"
fi

# Install iTerm2
if [ ! -d "/Applications/iTerm.app" ]; then
  INSTALL_ITERM2="brew install --cask iterm2"
  confirmAction "Install iTerm2" "$INSTALL_ITERM2"
fi

echo "==> Setup finished!"
