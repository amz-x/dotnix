#
#  Specific system git configuration module for home manager
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
#       │    ├─ git.nix *
#       │    ├─ starship.nix
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
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
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
    package = pkgs.git;

    # GIT - GPG Signing
    # https://mipmip.github.io/home-manager-option-search/?programs.git.signing
    signing = {

      # GIT - GPG Signing Key Fingerprint
      # https://mipmip.github.io/home-manager-option-search/?programs.git.signing.key
      key = "5B60 D309 E35C A3DD 6E9D 74D6 5242 BEFA DE97 4552";

      # GIT - GPG Signing By Default
      # https://mipmip.github.io/home-manager-option-search/?programs.git.signing.signByDefault
      signByDefault = true;
    };

    # GIT - Default Ignores
    # https://mipmip.github.io/home-manager-option-search/?programs.git.ignores
    ignores = [
      ".DS_Store"
    ];
  };
}
