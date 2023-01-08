#
#  Specific system security configuration settings module
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
#       │    ├─ git.nix
#       │    └─ starship.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./programs.nix
#       ├─ ./security.nix *
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Security - System
  # https://search.nixos.org/options?channel=unstable&show=security
  security = {

    # Security - Polkit
    # https://search.nixos.org/options?channel=unstable&show=security.polkit
    polkit.enable = true;

    # Security - Rootkit
    # https://search.nixos.org/options?channel=unstable&show=security.rtkit
    rtkit.enable = true;
  };

  # Networking
  # https://search.nixos.org/options?channel=unstable&show=networking
  networking = {

    # Networking - Firewall - Defaults
    # https://search.nixos.org/options?channel=unstable&show=networking.firewall
    firewall = {
      enable = true;
      extraPackages = with pkgs; [ ipset ];
      autoLoadConntrackHelpers = true;
    };
  };

  # Services
  # https://search.nixos.org/options?channel=unstable&show=services
  services = {

    # Services - Opensnitch
    # https://search.nixos.org/options?channel=unstable&show=services.opensnitch
    opensnitch = {
      
      # Services - Opensnitch - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.opensnitch.enable
      enable = true;

      # Services - Opensnitch - Settings
      # https://search.nixos.org/options?channel=unstable&show=services.opensnitch.settings
      settings = {
        DefaultAction = "deny";
        DefaultDuration = "until restart";
        LogLevel = 2;
        ProcMonitorMethod = "ebpf";
        Stats = {
          MaxEvents = 200;
          MaxStats = 50;
        };
      };
    };
  };
}
