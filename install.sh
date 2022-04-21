#!/bin/zsh

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"

. "$THIS_DIR/utilities.sh"

echo "==> Setup started."

# Install Homebrew
if [ ! -f "/opt/homebrew/bin/brew" ]; then
  INSTALL_HOMEBREW='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  SETUP_HOMEBREW="echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $ZPROFILE_PATH"
  confirmAction "Install Homebrew" "$INSTALL_HOMEBREW && $SETUP_HOMEBREW"
  . "$ZPROFILE_PATH"
fi

# Install git
if [ ! -f "/opt/homebrew/bin/git" ]; then
  INSTALL_GIT="brew install git"
  confirmAction "Install Git" "$INSTALL_GIT"
fi

# Install VSCode
if [ ! -d "/Applications/Visual Studio Code.app" ]; then
  INSTALL_VSCODE="brew install --cask visual-studio-code"
  confirmAction "Install VSCode" "$INSTALL_VSCODE"
fi

# Install iTerm2
if [ ! -d "/Applications/iTerm.app" ]; then
  INSTALL_ITERM2="brew install --cask iterm2"
  confirmAction "Install iTerm2" "$INSTALL_ITERM2"
fi

# Install Google Chrome
if [ ! -d "/Applications/Google Chrome.app" ]; then
  INSTALL_GOOGLE_CHROME="brew install --cask google-chrome"
  confirmAction "Install Google Chrome" "$INSTALL_GOOGLE_CHROME"
fi

# Install Github Desktop
if [ ! -d "/Applications/GitHub Desktop.app" ]; then
  INSTALL_GITHUB_DESKTOP="brew install --cask github"
  confirmAction "Install Github Desktop" "$INSTALL_GITHUB_DESKTOP"
fi

# Install Postgres.app
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
  confirmAction "Install Postgres.app" "$INSTALL_POSTGRES_APP"
fi

# Install Postico
if [ ! -d "/Applications/Postico.app" ]; then
  INSTALL_POSTICO="brew install --cask postico"
  confirmAction "Install Postico" "$INSTALL_POSTICO"
fi

# Install OhMyZsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  INSTALL_OHMYZSH='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  confirmAction "Install OhMyZsh" "$INSTALL_OHMYZSH"
fi

# Install asdf
if [ ! -f "/opt/homebrew/bin/asdf" ]; then
  INSTALL_ASDF="brew install asdf"
  confirmAction "Install Asdf" "$INSTALL_ASDF"
fi

# Install Docker Desktop
if [ ! -d "/Applications/Docker.app" ]; then
  INSTALL_DOCKER_DESKTOP="brew install --cask docker"
  confirmAction "Install Docker Desktop" "$INSTALL_DOCKER_DESKTOP"
fi

# Install f.lux
if [ ! -d "/Applications/Flux.app" ]; then
  INSTALL_FLUX="brew install --cask flux"
  confirmAction "Install F.lux" "$INSTALL_FLUX"
fi

# Install Telegram
if [ ! -d "/Applications/Telegram.app" ]; then
  INSTALL_TELEGRAM="brew install --cask telegram"
  confirmAction "Install Telegram" "$INSTALL_TELEGRAM"
fi

# Install Slack
if [ ! -d "/Applications/Slack.app" ]; then
  INSTALL_SLACK="brew install --cask slack"
  confirmAction "Install Slack" "$INSTALL_SLACK"
fi

# Install Zoom
if [ ! -d "/Applications/zoom.us.app" ]; then
  INSTALL_ZOOM="brew install --cask zoom"
  confirmAction "Install Zoom" "$INSTALL_ZOOM"
fi

# Install nix
if [ ! -d "/nix/var/nix" ]; then
  INSTALL_NIX="sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon"
  confirmAction "Install nix" "$INSTALL_NIX"
fi

# Install minikube
if [ ! -f "/opt/homebrew/bin/minikube" ]; then
  INSTALL_MINIKUBE="brew install minikube"
  confirmAction "Install minikube" "$INSTALL_MINIKUBE"
fi

# Install kubectl
if [ ! -f "/usr/local/bin/kubectl" ]; then
  INSTALL_KUBECTL="brew install kubectl"
  confirmAction "Install kubectl" "$INSTALL_KUBECTL"
fi

# Install Heroku CLI
if [ ! -f "/opt/homebrew/bin/heroku" ]; then
  INSTALL_HEROKU_CLI="brew tap heroku/brew && brew install heroku"
  confirmAction "Install Heroku CLI" "$INSTALL_HEROKU_CLI"
fi

# Install AWS CLI
if [ ! -f "/opt/homebrew/bin/aws" ]; then
  INSTALL_AWS_CLI="brew install awscli"
  confirmAction "Install AWS CLI" "$INSTALL_AWS_CLI"
fi

# Install eksctl
if [ ! -f "/opt/homebrew/bin/eksctl" ]; then
  INSTALL_EKSCTL="brew tap weaveworks/tap && brew install weaveworks/tap/eksctl"
  confirmAction "Install eksctl" "$INSTALL_EKSCTL"
fi

# Install doctl
if [ ! -f "/opt/homebrew/bin/doctl" ]; then
  INSTALL_DOCTL="brew install doctl"
  confirmAction "Install doctl" "$INSTALL_DOCTL"
fi

# Install bitcoind
if [ ! -f "/opt/homebrew/bin/bitcoind" ]; then
  INSTALL_BITCOIND="brew install bitcoin"
  confirmAction "Install bitcoind" "$INSTALL_BITCOIND"
fi

# Install jq
if [ ! -f "/opt/homebrew/bin/jq" ]; then
  INSTALL_JQ="brew install jq"
  confirmAction "Install jq" "$INSTALL_JQ"
fi

# Install Spotify
if [ ! -d "/Applications/Spotify.app" ]; then
  INSTALL_SPOTIFY="brew install --cask spotify"
  confirmAction "Install Spotify" "$INSTALL_SPOTIFY"
fi

echo "==> Setup finished!"
