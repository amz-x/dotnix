#
#  Specific system security configuration settings module
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
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

  # Security - Networking
  # https://search.nixos.org/options?channel=unstable&show=networking
  networking = {

    # Firewall - Defaults
    # https://search.nixos.org/options?channel=unstable&show=networking.firewall
    firewall = {
      enable = true;
      extraPackages = with pkgs; [ ipset ];
      autoLoadConntrackHelpers = true;
    };
  };

  # Security - Services
  services = {
    # Firewall - Opensnitch
    # https://search.nixos.org/options?channel=unstable&show=services.opensnitch
    opensnitch = {
      enable = true;
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
