#!/bin/bash

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"
ZSHRC_PATH="$HOME/.zshrc"
ASDF_DIR="$HOME/.asdf"
ASDF_PLUGINS_DIR="$ASDF_DIR/plugins"
ASDF_INSTALLS_DIR="$ASDF_DIR/installs"
ASDF_SH="/opt/homebrew/opt/asdf/libexec/asdf.sh"

. "$THIS_DIR/utilities.sh"

echo "==> Asdf setup started."

if ! grep -q "$ASDF_SH" "$ZSHRC_PATH"; then
  SETUP_ASDF="echo '# Add asdf plugins to \$PATH' >> $ZSHRC_PATH && echo . $ASDF_SH >> $ZSHRC_PATH"
  confirmAction "Add asdf to \$PATH?" "$SETUP_ASDF"
fi

if [ ! -d "$ASDF_PLUGINS_DIR/erlang" ]; then
  INSTALL_ERLANG_PLUGIN="asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git"
  confirmAction "Install erlang plugin for asdf?" "$INSTALL_ERLANG_PLUGIN"
fi

if [ ! -d "$ASDF_INSTALLS_DIR/erlang" ]; then
  ERLANG_VERSION="24.3.3"
  INSTALL_ERLANG="asdf install erlang $ERLANG_VERSION && asdf global erlang $ERLANG_VERSION"
  confirmAction "Install erlang $ERLANG_VERSION?" "$INSTALL_ERLANG"
fi

if [ ! -d "$ASDF_PLUGINS_DIR/elixir" ]; then
  INSTALL_ELIXIR_PLUGIN="asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"
  confirmAction "Install elixir plugin for asdf?" "$INSTALL_ELIXIR_PLUGIN"
fi

if [ ! -d "$ASDF_INSTALLS_DIR/elixir" ]; then
  ELIXIR_VERSION="1.13.4-otp-24"
  INSTALL_ELIXIR="asdf install elixir $ELIXIR_VERSION && asdf global elixir $ELIXIR_VERSION"
  confirmAction "Install elixir $ELIXIR_VERSION?" "$INSTALL_ELIXIR"
fi

if [ ! -d "$ASDF_PLUGINS_DIR/nodejs" ]; then
  INSTALL_NODEJS_PLUGIN="asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git"
  confirmAction "Install nodejs plugin for asdf?" "$INSTALL_NODEJS_PLUGIN"
fi

if [ ! -d "$ASDF_INSTALLS_DIR/nodejs" ]; then
  NODEJS_VERSION="17.9.0"
  INSTALL_NODEJS="asdf install nodejs $NODEJS_VERSION && asdf global nodejs $NODEJS_VERSION"
  confirmAction "Install nodejs $NODEJS_VERSION?" "$INSTALL_NODEJS"
fi

if [ ! -d "$ASDF_PLUGINS_DIR/ruby" ]; then
  INSTALL_RUBY_PLUGIN="asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git"
  confirmAction "Install ruby plugin for asdf?" "$INSTALL_RUBY_PLUGIN"
fi

if [ ! -d "$ASDF_INSTALLS_DIR/ruby" ]; then
  RUBY_VERSION="3.1.2"
  INSTALL_RUBY="asdf install ruby $RUBY_VERSION && asdf global ruby $RUBY_VERSION"
  confirmAction "Install ruby $RUBY_VERSION?" "$INSTALL_RUBY"
fi

echo "==> Asdf setup finished!"
