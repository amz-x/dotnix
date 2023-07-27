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
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       └─ ./vpn.nix *

{ config, lib, pkgs, ... }:

{
  # Services
  # https://search.nixos.org/options?channel=unstable&show=services
  services = {
    
    # IVPN
    # https://search.nixos.org/options?channel=unstable&show=services.ivpn
    ivpn = {

      # IVPN - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.ivpn.enable
      enable = false;
    };

    # Netbird
    # https://search.nixos.org/options?channel=unstable&show=services.netbird
    netbird = {
      
      # Netbird - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.netbird.enable
      enable = false;
      
      # Netbird - Package
      # https://search.nixos.org/options?channel=unstable&show=services.netbird.package
      package = pkgs.netbird;
    };
  };
}
