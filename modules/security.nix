#
#  Specific system security configuration settings module
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./fonts.nix
#       ├─ ./home.nix
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
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Security - Networking
  networking = {
   # Firewall - IP tables
    firewall = {
      enable = true;
      extraPackages = with pkgs; [ ipset ];
      autoLoadConntrackHelpers = true;
    };
  };

  # Security - Services
  services = {
    # Firewall - Opensnitch
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
