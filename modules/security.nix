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
        DefaultDuration = "5m";
        Firewall = "iptables";
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
