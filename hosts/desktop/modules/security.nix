#
#  Specific system security configuration settings module
#

{ config, lib, pkgs, ... }:

{
  # Security - System
  # https://search.nixos.org/options?channel=unstable&show=security
  security = {

    # Security - Polkit
    # https://search.nixos.org/options?channel=unstable&show=security.polkit
    polkit.enable = true;

    # Security - Rootkit
    # https://search.nixos.org/options?channel=unstableable&show=security.rtkit
    rtkit.enable = true;

    # Security - TPM2
    # https://search.nixos.org/options?channel=unstable&show=security.tpm2
    tpm2.enable = true;
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
      # allowedTCPPorts = [ ];

      # Networking - Firewall - UDP Ports
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.allowedUDPPorts
      # allowedUDPPorts = [ ];

      # Networking - Firewall - UDP Ports Ranges
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.allowedUDPPortRanges
      # allowedUDPPortRanges = [ ];

      # Networking - Firewall - Logging - Refused Connections
      # https://search.nixos.org/options?channel=unstable&show=networking.firewall.logRefusedConnections
      logRefusedConnections = true;
    };
  };

  # Services
  # https://search.nixos.org/options?channel=unstable&show=services
  services = {
    
    # Services - SSH Guard
    # https://search.nixos.org/options?channel=unstable&show=services.sshguard
    sshguard = {
      
      # Services - SSH Guard - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.sshguard.enable
      enable = true;
    };

    # Services - ClamAV
    # https://search.nixos.org/options?channel=unstable&show=services.clamav
    clamav = {
      # Note: Download / Update ClamAV database if service fails to start
      # https://discourse.nixos.org/t/how-to-use-clamav-in-nixos/19782/

      # Services - ClamAV - Deamon
      # https://search.nixos.org/options?channel=unstable&show=services.clamav.daemon
      daemon = {
        enable = true;
        settings = {
          ScanOnAccess = true;
          MaxThreads = 4;
          OnAccessExcludeRootUID = true;
          OnAccessMountPath = "/";
          OnAccessExcludePath = "/nix/store";
          OnAccessExcludeUname = "clamav";
        };
      };

      # Services - ClamAV - Updater
      # https://search.nixos.org/options?channel=unstable&show=services.clamav.updater
      updater = {
        enable = true;
        interval = "daily";
      };
    };

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
        Firewall          = "nftables";
        LogLevel          = 2;
        ProcMonitorMethod = "ebpf";
        Stats = {
          MaxEvents       = 200;
          MaxStats        = 50;
        };
      };
    };
  };

  # Programs
  # https://search.nixos.org/options?channel=unstable&show=programs
  programs = {
    # GPG Agent
    # https://search.nixos.org/options?channel=unstable&show=programs.gnupg.agent
    gnupg.agent = {
      
      # GPG Agent - Enable
      # https://search.nixos.org/options?channel=unstable&show=programs.gnupg.agent.enable
      enable = true;

      # GPG Agent - Pinentry Flavor
      # https://search.nixos.org/options?channel=unstable&show=programs.gnupg.agent.pinentryFlavor
      # pinentryFlavor = "gnome3";
    };
  };
}
