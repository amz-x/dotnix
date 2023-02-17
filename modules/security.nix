#
#  Specific system security configuration settings module
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
#       ├─ ./openrgb.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix *
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
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

    # Networking - Firewall
    # https://search.nixos.org/options?channel=unstable&show=networking.firewall
    firewall = {

      # Networking - Firewall - Enable (Enabled by default)
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.enable
      enable = true;
      
      # Networking - Firewall - Extra Packages
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.extraPackages
      extraPackages = with pkgs; [ ipset ];
      
      # Networking - Firewall - Connection Track Helpers
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.autoLoadConntrackHelpers
      autoLoadConntrackHelpers = true;

      # Networking - Firewall - Connection Tracking Modules
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.connectionTrackingModules
      connectionTrackingModules = [ ];
      
      # Networking - Firewall - TCP Ports
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.allowedTCPPorts
      allowedTCPPorts = [
        # Gnome Network Displays
        7236
        7250
      ];

      # Networking - Firewall - UDP Ports
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.allowedUDPPorts
      allowedUDPPorts = [
        # Gnome Network Displays
        7236
        5353
      ];

      # Networking - Firewall - Logging - Refused Connections (Enabled by default)
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.logRefusedConnections
      logRefusedConnections = true;
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
      enable = false;

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

  # Services
  # https://search.nixos.org/options?channel=unstable&show=programs
  programs = {

    # Firejail
    # https://search.nixos.org/options?channel=unstable&show=programs.firejail
    firejail = {

      # Firejail - Enable
      # https://search.nixos.org/options?channel=unstable&show=programs.firejail.enable
      enable = true;

      # Firejail - Wrapped Binaries
      # https://search.nixos.org/options?channel=unstable&show=programs.firejail.wrappedBinaries
      wrappedBinaries = {

        firefox = {
          executable  = "${lib.getBin pkgs.firefox}/bin/firefox";
          profile     = "${pkgs.firejail}/etc/firejail/firefox.profile";
        };

        google-chrome = {
          executable  = "${lib.getBin pkgs.google-chrome}/bin/google-chrome-stable";
          profile     = "${pkgs.firejail}/etc/firejail/google-chrome.profile";
        };

        mailspring = {
          executable  = "${lib.getBin pkgs.mailspring}/bin/mailspring";
          profile     = "${pkgs.firejail}/etc/firejail/mailspring.profile";
        };

        slack = {
          executable  = "${lib.getBin pkgs.slack}/bin/slack";
          profile     = "${pkgs.firejail}/etc/firejail/slack.profile";
        };
      };
    };
  };
}
