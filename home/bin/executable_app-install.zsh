#!/bin/zsh

brew install $@
brew bundle dump --force
chezmoi re-add ~/.Brewfile
chezmoi git add home/dot_Brewfile