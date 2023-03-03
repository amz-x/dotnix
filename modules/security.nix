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

    # Networking - Net Filter
    nftables.enable = true;

    # Networking - Firewall
    # https://search.nixos.org/options?channel=unstable&show=networking.firewall
    firewall = {

      # Networking - Firewall - Enable
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.enable
      enable = true;

      # Networking - Firewall - Package
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.package
      package = pkgs.nftables;
      
      # Networking - Firewall - Extra Packages
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.extraPackages
      extraPackages = with pkgs; [ ipset ];

      
      # Networking - Firewall - TCP Ports
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.allowedTCPPorts
      allowedTCPPorts = [ ];

      # Networking - Firewall - UDP Ports
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.allowedUDPPorts
      allowedUDPPorts = [ ];

      # Networking - Firewall - Logging - Refused Connections
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
      enable = true;

      # Services - Opensnitch - Settings
      # https://search.nixos.org/options?channel=unstable&show=services.opensnitch.settings
      settings = {
        DefaultAction     = "deny";
        DefaultDuration   = "until restart";
        LogLevel          = 2;
        ProcMonitorMethod = "ebpf";
        Stats = {
          MaxEvents       = 200;
          MaxStats        = 50;
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
        
        zoom = {
          executable  = "${lib.getBin pkgs.zoom-us}/bin/zoom-us";
          profile     = "${pkgs.zoom-us}/etc/firejail/zoom.profile";
        };
      };
    };
  };
}
