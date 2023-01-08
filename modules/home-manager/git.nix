#
#  Specific system Android configuration settings for desktop
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix
#   │   └─ ./home.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./home-manager
#       │    ├─ git.nix *
#       │    └─ starship.nix
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
  # GIT
  # https://mipmip.github.io/home-manager-option-search/?programs.git
  programs.git = {
    # GIT - Enable
    # https://mipmip.github.io/home-manager-option-search/?programs.git.enable
    enable = true;

    # GIT - User Name 
    # https://mipmip.github.io/home-manager-option-search/?programs.git.userName
    userName = "Christopher Crouse";

    # GIT - User Email
    # https://mipmip.github.io/home-manager-option-search/?programs.git.userEmail
    userEmail = "mail@amz-x.com";
    
    # GIT - Package
    # https://mipmip.github.io/home-manager-option-search/?programs.git.package
    package = pkgs.gitFull;

    # GIT - Default Ignores
    # https://mipmip.github.io/home-manager-option-search/?programs.git.ignores
    ignores = [
      ".DS_Store"
    ];
  };
}
