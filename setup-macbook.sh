#!/bin/bash

set -e

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

# Install Homebrew
if [ ! -f "/opt/homebrew/bin/brew" ]; then
  ZPROFILE_PATH="/Users/$USER/.zprofile"
  INSTALL_HOMEBREW='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  confirmAction "Install Homebrew?" "$INSTALL_HOMEBREW"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$ZPROFILE_PATH"
  . "$ZPROFILE_PATH"
fi

# Install git
if [ ! -f "/opt/homebrew/bin/git" ]; then
  INSTALL_GIT="brew install git"
  confirmAction "Install git?" "$INSTALL_GIT"
fi

# Install VSCode
if [ ! -d "/Applications/Visual Studio Code.app" ]; then
  INSTALL_VSCODE="brew install --cask visual-studio-code"
  confirmAction "Install VSCode?" "$INSTALL_VSCODE"
fi

# Install iTerm2
if [ ! -d "/Applications/iTerm.app" ]; then
  INSTALL_ITERM2="brew install --cask iterm2"
  confirmAction "Install iTerm2" "$INSTALL_ITERM2"
fi

# Install Google Chrome
if [ ! -d "/Applications/Google Chrome.app" ]; then
  INSTALL_GOOGLE_CHROME="brew install --cask google-chrome"
  confirmAction "Install Google Chrome?" "$INSTALL_GOOGLE_CHROME"
fi

# Install Github Desktop
if [ ! -d "/Applications/GitHub Desktop.app" ]; then
  INSTALL_GITHUB_DESKTOP="brew install --cask github"
  confirmAction "Install Github Desktop?" "$INSTALL_GITHUB_DESKTOP"
fi

# Install Postgres.app
# TODO: install into SHELL psql etc...
if [ ! -d "/Applications/Postgres.app" ]; then
  # Versions
  POSTGRES_APP_VERSION="Postgres-2.5.6-14"
  POSTGRES_APP_URL="https://github.com/PostgresApp/PostgresApp/releases/download/v2.5.6/$POSTGRES_APP_VERSION.dmg"
  POSTGRES_APP_DMG_PATH="/tmp/$POSTGRES_APP_VERSION.dmg"

  # Commands
  DOWNLOAD_POSTGRES_APP_DMG="curl -L $POSTGRES_APP_URL --output $POSTGRES_APP_DMG_PATH"
  MOUNT_POSTGRES_APP_DMG="hdiutil mount $POSTGRES_APP_DMG_PATH -nobrowse"
  COPY_POSTGRES_APP_TO_APPLICATIONS="cp -R /Volumes/$POSTGRES_APP_VERSION/Postgres.app /Applications"
  UNMOUNT_POSTGRES_APP_DMG="hdiutil unmount /Volumes/$POSTGRES_APP_VERSION"
  REMOVE_POSTGRES_APP_DMG="rm $POSTGRES_APP_DMG_PATH"

  # Install
  INSTALL_POSTGRES_APP="$DOWNLOAD_POSTGRES_APP_DMG && $MOUNT_POSTGRES_APP_DMG && $COPY_POSTGRES_APP_TO_APPLICATIONS && $UNMOUNT_POSTGRES_APP_DMG && $REMOVE_POSTGRES_APP_DMG" 
  confirmAction "Install Postgres.app?" "$INSTALL_POSTGRES_APP"
fi

# Install Postico
if [ ! -d "/Applications/Postico.app" ]; then
  INSTALL_POSTICO="brew install --cask postico"
  confirmAction "Install Postico?" "$INSTALL_POSTICO"
fi

# Install OhMyZsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  INSTALL_OHMYZSH='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  confirmAction "Install OhMyZsh?" "$INSTALL_OHMYZSH"
fi

# Install ASDF
# TODO: install erlang & elixir & ruby
if [ ! -f "/opt/homebrew/bin/asdf" ]; then
  INSTALL_ASDF="brew install asdf"
  confirmAction "Install ASDF?" "$INSTALL_ASDF"
  echo ". /opt/homebrew/opt/asdf/libexec/asdf.sh" > "~/.zshrc"
fi

# Install Docker Desktop
if [ ! -d "/Applications/Docker.app" ]; then
  INSTALL_DOCKER_DESKTOP="brew install --cask docker"
  confirmAction "Install Docker Desktop?" "$INSTALL_DOCKER_DESKTOP"
fi

# Install f.lux
if [ ! -d "/Applications/Flux.app" ]; then
  INSTALL_FLUX="brew install --cask flux"
  confirmAction "Install f.lux?" "$INSTALL_FLUX"
fi

# Generate SSH keys
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  ASK_FOR_SSH_KEY_EMAIL="read -p 'Email for ssh key:'  SSH_KEY_EMAIL"
  eval $ASK_FOR_SSH_KEY_EMAIL
  GENERATE_SSH_KEYS="ssh-keygen -t rsa -b 4096 -C $SSH_KEY_EMAIL"
  confirmAction "Generate SSH keys?" "$GENERATE_SSH_KEYS"
fi

echo "==> Setup finished!"
