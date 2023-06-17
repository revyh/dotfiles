#!/bin/zsh

SSH_FILENAME='id_ed25519'

if [ ! -f ~/.ssh/$SSH_FILENAME.pub ]; then
  vared -p 'Enter your e-mail for ssh key generation: ' -c EMAIL
  ssh-keygen -t ed25519 -f "$SSH_FILENAME" -C "$EMAIL"
  mv "$SSH_FILENAME" "$SSH_FILENAME.pub" ~/.ssh/
fi

pbcopy < ~/.ssh/$SSH_FILENAME.pub

echo "Your ssh public key (~/.ssh/$SSH_FILENAME.pub) has been copied to clipboard. Paste it where necessary"
