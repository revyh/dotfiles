# Dotfiles by revyh

These dotfiles are managed using [chezmoi](chezmoi.io) and are designed for use on macOS.

## Install

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/revyh/dotfiles/HEAD/bootstrap.zsh)"
```

Ideally, this script will prompt for the superuser password only once at the beginning of execution and then proceed automatically. However, in real-world scenarios, it may require rerunning after a system reboot caused by updates or may ask for confirmation when installing Xcode command line tools.

## Post-install checklist

Not all installation steps can or should be automated. The following checklist will assist you with manual steps:

- [ ] Generate an SSH key and paste it where required (e.g., GitHub). You can use the `generate_ssh_key.zsh` script to help with this process
- [ ] Populate the ~/.gnupg folder with your GPG keys
- [ ] Configure the VPN client
