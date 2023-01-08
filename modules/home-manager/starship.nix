#
#  Specific system Android configuration settings for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./home-manager
#       │    ├─ git.nix
#       │    └─ starship.nix *
#       ├─ ./android.nix 
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
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
