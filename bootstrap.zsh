#!/bin/zsh

function ask_sudo_access {
# Ask for the superuser password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

function update_system {
  sudo softwareupdate -iaR
}

function install_brew {
  # NONINTERACTIVE for skipping "are you sure?" prompts from homebrew
  sudo -v
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function install_brew_bundle {
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export HOMEBREW_BUNDLE_FILE=~/.Brewfile
  brew bundle install
}

function populate_dotfiles {
: <<COMMENT
  This "one-shot" installation of "chezmoi" solves the "chicken and egg" problem in the context of "chezmoi" and "Homebrew."
  Normally, "Homebrew" should install and manage "chezmoi" like any other application. However, "chezmoi" manages the "Brewfile," which keeps the list of applications for "Homebrew" to manage.
  This "one-shot" installation allows "chezmoi" to populate dotfiles (including the "Brewfile") without leaving a trace in the system.
  More than that, this "one-shot" installation also provides fully setted up environment including the `secretive` app for generating ssh keys. Which is required for adding ssh pubkey to github account and finish bootstrapping by initializing chezmoi with write access to the github repo.
COMMENT

  # Preserve chezmoi.toml config file to not prompt user one more time during subsequent `chezmoi init --ssh` step
  local TMP_DIR=`mktemp -d`
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot --config-path="$TMP_DIR/chezmoi.toml" revyh
  mkdir -p ~/.config/chezmoi
  cp "$TMP_DIR/chezmoi.toml" ~/.config/chezmoi/chezmoi.toml
}

ask_sudo_access

update_system

# Install brew first because it installs XCode command line tools if needed
install_brew

populate_dotfiles

install_brew_bundle

