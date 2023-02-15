# Personal NixOS & MacOS Configurations

![Screenshot](./data/nixos-screenshot.png "NixOS - Pantheon Desktop")

## NixOS Features

- NixOS 23.05 (Stoat - Unstable)
- Home Manager
- Linux Kernel 6.1.6-zen1
- LightDM (Display Manager)
- Pantheon Deskop Environment
- Nushell
- Starship Prompt
- Nano CLI Editor
- Visual Studio Code
- Netbird
- Opensnitch
- Firejail
- Steam

___

## Applications - NixOS vs Nix Darwin

System applications and their platform support comparison table:

| Application           | NixOS 23.05 (Stoat)       | Nix Darwin                |
|-----------------------|---------------------------|---------------------------|
| Beekeeper Studio      | ✅ Working                | ❓ Unknown Status         |
| Bitwarden             | ✅ Working                | ❓ Unknown Status         |
| DBeaver CE            | ✅ Working                | ✅ Working                |
| Discord               | ✅ Working                | ❓ Unknown Status         |
| Docker                | ✅ Working                | ⚡ WIP                    |
| Firefox               | ✅ Working                | ⚡ WIP                    |
| Google Chrome (Stable)| ✅ Working                | ❓ Unknown Status         |
| GIMP                  | ✅ Working                | ✅ Working                |
| GIT                   | ✅ Working                | ✅ Working                |
| Libre Office          | ✅ Working                | ✅ Working                |
| Mailspring            | ✅ Working                | ❓ Unknown Status         |
| Nano                  | ✅ Working                | ✅ Working                |
| Netbird               | ✅ Working                | ✅ Working                |
| Nushell               | ✅ Working                | ✅ Working                |
| Starship              | ✅ Working                | ✅ Working                |
| Simplenote            | ✅ Working                | ❓ Unknown Status         |
| Slack                 | ✅ Working                | ✅ Working                |
| Spotify               | ✅ Working                | ❓ Unknown Status         |
| Visual Studio Code    | ✅ Working                | ✅ Working                |
| Zoom                  | ✅ Working                | ✅ Working                |

[Looking for more applications / packages?](https://search.nixos.org/packages?channel=unstable)
___

## Setup

### Nix Package Manager

Installing the Nix Package Manager (standalone), needed for Mac setup.

```bash
# Linux (non-NixOS)
sh <(curl -L https://nixos.org/nix/install) --daemon

# Mac
sh <(curl -L https://nixos.org/nix/install)

# Windows (run NixOS in WSL - following line is for non-NixOS distros)
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

[The official nix package manager installation guide](https://nixos.org/download.html#download-nix)

### Enabling Nix Flakes

Edit **/etc/nix/nix.conf** and add/modify the following line:

```bash
experimental-features = nix-command flakes
```

___

## NixOS

NixOS comes preinstalled with the Nix package manager, execute the following within the project directory:

```bash
# Basic switch
sudo nixos-rebuild switch --flake ./#<hostname>

# Switch with upgrade
sudo nixos-rebuild switch --flake ./#<hostname> --upgrade

# Example
sudo nixos-rebuild switch --flake ./#AMZ-Linux
```

___

## Mac (Nix Darwin)

[Nix Darwin](https://github.com/LnL7/nix-darwin) is similar to NixOS. This project aims to bring the convenience of a declarative system approach to macOS.

An additional installation step is required:

```bash
# Nix Package Manager is needed for this step
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer

# Run the installer
./result/bin/darwin-installer
```

After Nix Darwin has been installed, execute the following within the project directory:

```bash
# Basic switch
darwin-rebuild switch --flake ./#<hostname>

# Example (inside root of project)
darwin-rebuild switch --flake ./#AMZ-MacBook
```

___

## Nix Flakes Commands

Inside the root of the project directory execute the following:

```bash
# Updates flake.lock
nix flake update
```

## Nix Store Maintenance

Execute the following, if you would like to run garbage collection:

```bash
# NixOS
sudo nix-collect-garbage -d

# Nix Darwin
nix-collect-garbage -d 
```

___

## Resources & Manuals

### Guides

- [Zero to Nix](https://zero-to-nix.com/)

### Manuals

- [NixOS Manual](https://nixos.org/nixos/manual)
- [Nixpkgs Manual](https://nixos.org/nixpkgs/manual)
- [Nix Package Manager Manual](https://nixos.org/nix/manual)

### Nix & NixOS

- [NixOS - Homepage](https://nixos.org/)
- [NixOS - Github](https://github.com/NixOS)
- [NixOS - Nixpkgs](https://github.com/NixOS/nixpkgs)
- [NixOS - Package Search](https://search.nixos.org/packages)
- [NixOS - Options Search](https://search.nixos.org/options)
- [NixOS - Channel Status](https://status.nixos.org/)

### Home Manager (Home Directory Management)

- [Home Manager - Github](https://github.com/nix-community/home-manager)
- [Home Manager - Options Search](https://mipmip.github.io/home-manager-option-search)

### Projects Built With Nix

- [Devenv - Developer Environments](https://devenv.sh)
- [Cachix - CI/CD & Binary Cache](https://www.cachix.org/)
- [Garnix - CI/CD & Binary Cache](https://garnix.io/)
