# Personal NixOS Configuration

![Screenshot](./data/nixos-screenshot.png "NixOS - Pantheon Desktop")

## Features

| Component             | Feature                   |
|-----------------------|---------------------------|
| Distro                | NixOS 22.11 (unstable)    |
| Linux Kernel          | Linux Kernel 6.0.X        |
| Display Manager       | LightDM                   |
| Desktop Environment   | Pantheon                  |
| Shell                 | Nushell                   |
| Prompt                | Starship                  |
| Editor                | Nano + VS Code (FHS)      |
| Firewall              | IPTables + Opensnitch     |

## Setup

Inside the root of the project directory execute the following

```bash
# Basic switch
sudo nixos-rebuild switch --flake /path/to/folder/#<hostname>

# Switch with upgrade
sudo nixos-rebuild switch --flake /path/to/folder/#<hostname> --upgrade
```

## Nix Store Maintenance

```bash
# Garbage Collection
sudo nix-collect-garbage -d
```
