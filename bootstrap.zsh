#!/bin/zsh

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
COMMENT

  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot revyh
}

sudo softwareupdate -iaR

# Install brew first because it installs XCode command line tools if needed
install_brew
populate_dotfiles
install_brew_bundle

chezmoi init --apply revyh
