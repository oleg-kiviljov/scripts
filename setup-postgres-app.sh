#!/bin/bash

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"

. "$THIS_DIR/utilities.sh"

if ! isInstalled psql ; then
  SETUP_POSTGRES_APP="sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp"
  confirmAction "Add psql to \$PATH?" "$SETUP_POSTGRES_APP"
fi
