#!/bin/bash

set -e

# Generate SSH keys
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  ASK_FOR_SSH_KEY_EMAIL="read -p 'Email for ssh key:'  SSH_KEY_EMAIL"
  eval $ASK_FOR_SSH_KEY_EMAIL
  GENERATE_SSH_KEYS="ssh-keygen -t rsa -b 4096 -C $SSH_KEY_EMAIL"
  confirmAction "Generate SSH keys?" "$GENERATE_SSH_KEYS"
fi
