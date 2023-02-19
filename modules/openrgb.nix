#
#  Specific system DE configuration settings module
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
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./homeassistant.nix
#       ├─ ./networking.nix
#       ├─ ./openrgb.nix *
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
  # OpenRGB
  # https://search.nixos.org/options?channel=unstable&show=services.hardware.openrgb
  services.hardware.openrgb = {

    # OpenRGB - Enable
    # https://search.nixos.org/options?channel=unstable&show=services.hardware.openrgb.enable
    enable = false;

    # OpenRGB - Motherboard (AMD / Intel)
    # https://search.nixos.org/options?channel=unstable&show=services.hardware.openrgb.motherboard
    motherboard = "amd";

    # OpenRGB - Server Port
    # https://search.nixos.org/options?channel=unstable&show=services.hardware.openrgb.server.port
    server.port = 6742;
  };
}
