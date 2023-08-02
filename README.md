# Personal NixOS System Configuration

![Screenshot](./data/nixos-screenshot.png "NixOS - Pantheon Desktop")

## NixOS Features

- NixOS 23.11 (Tapir)
- Home Manager
- Linux Kernel 6.4.6-zen1
- Mesa 23.1.3
- LightDM (Display Manager)
- Pantheon Desktop Environment
- Nushell
- Starship Prompt
- Nano CLI Editor
- Visual Studio Code
- Opensnitch
- Steam

___

## NixOS

NixOS comes preinstalled with the Nix package manager, update the nix package manager configuration to enable the `nix-command` & `flakes` experimental features.

### Enabling Nix Flakes

Edit **/etc/nix/nix.conf** and add/modify the following line:

```conf
experimental-features = nix-command flakes
```

### Setup

Execute the following within the project directory:

```bash
# Basic switch
sudo nixos-rebuild switch --flake ./#machine-hostname

# Switch with upgrade
sudo nixos-rebuild switch --flake ./#machine-hostname --upgrade

# Example
sudo nixos-rebuild switch --flake ./#AMZ-Linux
```

___

## Nix Flakes Commands

Inside the root of the project directory execute the following:

```bash
# Updates flake.lock
nix flake update

# Updates flake.lock with refreshed cache
nix flake update --refresh
```

## Nix Store Maintenance

Execute the following, if you would like to run garbage collection:

```bash
sudo nix-collect-garbage -d
```

___

## Resources & Manuals

### Guides

- [Zero to Nix](https://zero-to-nix.com/)

### Installers

- [The Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

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
