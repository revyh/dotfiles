# Dotfiles by revyh

These dotfiles are managed using [chezmoi](chezmoi.io) and are designed for use on macOS.

## Pre-install steps

In case of updating macOS device, it's better to sign out, deactivate subscriptions, etc on the old device

## Install

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/revyh/dotfiles/HEAD/bootstrap.zsh)"
```

After the initial bootstrapping you'll got a ready-to-use environment (except that your running shell won't load the installed settings). But without an ability to push changes to the github dotfiles repo. In order to fix that, you'll need to:
1. Generate an SSH key using the installed [secretive app](https://github.com/maxgoedjen/secretive) and add the pubkey to the GitHub.
1. Run `chezmoi init --ssh --apply revyh`

## Post-install checklist

Not all installation steps can or should be automated. The following checklist will assist you with manual steps:

- [ ] Turn on FileVault
- [ ] Run ~/.macos
- [ ] Configure the VPN client
