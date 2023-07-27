#
#  Specific system syncthing configuration settings module for home manager
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
#       ├─ ./syncthing.nix *
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       └─ ./vpn.nix

{ config, lib, pkgs, user, ... }:

{
  # Syncthing
  # https://search.nixos.org/options?channel=unstable&show=services.syncthing
  services.syncthing = {

    # Syncthing - Enable
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.enable
    enable = false;

    # Syncthing - User
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.user
    user = "${user}";

    # Syncthing - Data Directory
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.dataDir
    dataDir = "/home/${user}";

    # Syncthing - Open Default Ports
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.openDefaultPorts
    openDefaultPorts = false;    
  };
}
