#
#  Specific system VPN configuration settings module
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
#       ├─ ./homeassistant.nix
#       ├─ ./networking.nix
#       ├─ ./openrgb.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix *
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, user, ... }:

{

  # Default packages install system-wide
  # https://search.nixos.org/packages?channel=unstable
  environment.systemPackages = with pkgs; [
    ivpn
    ivpn-service
  ];

  # System Services
  # https://search.nixos.org/options?channel=unstable&show=services
  # services = {

  #   # Netbird (https://netbird.io)
  #   # https://search.nixos.org/options?channel=unstable&show=services.netbird
  #   netbird = {
      
  #     # Netbird - Enable
  #     # https://search.nixos.org/options?channel=unstable&show=services.netbird.enable
  #     enable = false;
      
  #     # Netbird - Package
  #     # https://search.nixos.org/options?channel=unstable&show=services.netbird.package
  #     package = pkgs.netbird;
  #   };
  # };
}
