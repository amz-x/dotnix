# Personal NixOS Configuration

![Screenshot](./data/nixos-screenshot.png "NixOS - Pantheon Desktop")

## Features

### NixOS

| Component             | Feature                   |
|-----------------------|---------------------------|
| Linux Distro          | NixOS 23.05 (Stoat)       |
| Linux Kernel          | Linux Kernel 6.1.X        |
| Display Manager       | LightDM                   |
| Desktop Environment   | Pantheon                  |
| Shell                 | Nushell                   |
| Prompt                | Starship                  |
| Editor                | Nano + VS Code (FHS)      |
| Firewall              | IPTables + Opensnitch     |

### Nix Darwin
| Component             | Feature                   |
|-----------------------|---------------------------|
| OS                    | Mac OSX (latest)          |
| Shell                 | Nushell                   |
| Prompt                | Starship                  |
| Editor                | Nano + VS Code (FHS)      |

---

## Setup

### Nix Package Manager

Installing the Nix Package Manager (standalone), needed for Mac setup.

```bash
# Linux (non-NixOS)
sh <(curl -L https://nixos.org/nix/install) --daemon

# Mac
sh <(curl -L https://nixos.org/nix/install)

# Windows (run in WSL)
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

[The official nix package manager installation guide](https://nixos.org/download.html#download-nix)

### Enabling Nix Flakes

Edit **/etc/nix/nix.conf** and add/modify the following line:

```bash
experimental-features = nix-command flakes
```

---

## NixOS

NixOS comes preinstalled with the Nix package manager, execute the following pointing to the project directory:

```bash
# Basic switch
sudo nixos-rebuild switch --flake /path/to/folder/#<hostname>

# Switch with upgrade
sudo nixos-rebuild switch --flake /path/to/folder/#<hostname> --upgrade

# Example
sudo nixos-rebuild switch --flake ./#AMZ-Linux
```

---

## Mac (Nix Darwin)

[Nix Darwin](https://github.com/LnL7/nix-darwin) is similar to NixOS. This project aims to bring the convenience of a declarative system approach to macOS.

An additional installation step is required:

```bash
# Nix Package Manager is needed for this step
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer

# Run the installer
./result/bin/darwin-installer
```

After Nix Darwin has been installed, execute the following pointing to the project directory:

```bash
# Basic switch
sudo darwin-rebuild switch --flake /path/to/folder/#<hostname>

# Switch with upgrade
sudo darwin-rebuild switch --flake /path/to/folder/#<hostname> --upgrade

# Example (inside root of project)
sudo darwin-rebuild switch --flake ./#AMZ-MacBook
```

---

## Nix Flakes Commands

Inside the root of the project directory execute the following:

```bash
# Updates flake.lock
sudo nix flake update
```

## Nix Store Maintenance

Execute the following, if you would like to run garbage collection:

```bash
# Garbage Collection
sudo nix-collect-garbage -d
```

---

## Resources & Manuals

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
