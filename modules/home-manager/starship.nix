#
#  Specific system starship prompt configuration settings module for home manager
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix
#   │   └─ ./home.nix
#   │
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   │
#   └─ ./modules
#       ├─ ./home-manager
#       │    ├─ direnv.nix
#       │    ├─ git.nix
#       │    ├─ starship.nix *
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix 
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./openrgb.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Starship Prompt
  # https://mipmip.github.io/home-manager-option-search/?programs.starship
  programs.starship = {

    # Starship - Enable
    # https://mipmip.github.io/home-manager-option-search/?programs.starship.enable
    enable = true;

    # Starship - Bash Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.starship.enableBashIntegration
    enableBashIntegration = true;

    # Starship - Nushell Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.starship.enableNushellIntegration
    enableNushellIntegration = true;

    # Starship - ZSH Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.starship.enableZshIntegration
    enableZshIntegration = true;
  };
}
