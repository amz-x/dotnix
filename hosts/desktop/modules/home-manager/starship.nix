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
#       │    ├─ vscode.nix
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
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       └─ ./vpn.nix

{ config, lib, pkgs, ... }:

{
  # Starship Prompt
  # https://nix-community.github.io/home-manager/options.html#opt-programs.starship
  programs.starship = {

    # Starship - Enable
    # https://nix-community.github.io/home-manager/options.html#opt-programs.starship.enable
    enable = true;

    # Starship - Bash Integration
    # https://nix-community.github.io/home-manager/options.html#opt-programs.starship.enableBashIntegration
    enableBashIntegration = true;

    # Starship - Nushell Integration
    # https://nix-community.github.io/home-manager/options.html#opt-programs.starship.enableNushellIntegration
    enableNushellIntegration = true; 

    # Starship - ZSH Integration
    # https://nix-community.github.io/home-manager/options.html#opt-programs.starship.enableZshIntegration
    enableZshIntegration = true;

    # Starship - Settings
    # https://nix-community.github.io/home-manager/options.html#opt-programs.starship.settings
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      # add_newline = false;
      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };
      # package.disabled = true;
    };
  };
}
