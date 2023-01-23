#
#  Specific system direnv configuration module for home manager
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
#       │    ├─ direnv.nix *
#       │    ├─ git.nix
#       │    ├─ starship.nix
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
  # Direnv
  # https://mipmip.github.io/home-manager-option-search/?programs.direnv
  programs.direnv = {

    # Direnv - Enable
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enable
    enable = true;

    # Direnv - Bash Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enableBashIntegration
    enableBashIntegration = true;

    # Direnv - ZSH Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enableZshIntegration
    enableZshIntegration = true;
    
    # Direnv - Nix Direnv
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.nix-direnv.enable
    nix-direnv.enable = true;
  };
}
