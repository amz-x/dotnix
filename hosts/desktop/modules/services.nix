#
#  Specific system services configuration settings module
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
#       ├─ ./services.nix *
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       └─ ./vpn.nix

{ config, lib, pkgs, user, ... }:

{
  # System Services
  services = {

    # FWUPD - Firmware Update Service
    # https://search.nixos.org/options?channel=nixos-unstable&show=services.fwupd
    fwupd = {

      # FWUPD - Enable
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.fwupd.enable
      enable = true;

      # FWUPD - Package
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.fwupd.package
      package = pkgs.fwupd;
    };

    # Avahi
    # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi
    avahi = {

      # Avahi - Enable
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi
      enable = true;

      # Avahi - mDNS NSS (Name Service Switch)
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi.nssmdns
      nssmdns = true;
      
      # Avahi - IPV6
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi.ipv6
      ipv6 = false;

      # Avahi - Firewall
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi.openFirewall
      openFirewall = true;

      # Avahi - Publish
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi.publish
      publish = {

        # Avahi - Publish - Enable
        # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi.publish.enable
        enable = true;

        # Avahi - Publish - User Services
        # https://search.nixos.org/options?channel=nixos-unstable&show=services.avahi.publish.userServices
        userServices = true;
      };
    };

    # Printing (CUPS)
    # https://search.nixos.org/options?channel=nixos-unstable&show=services.printing
    printing = {

      # Printing - Enable
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.printing.enable
      enable = true;

      # Printing - Drivers
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.printing.drivers
      drivers = with pkgs; [ gutenprint hplip ];

      # Printing - Start when needed
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.printing.startWhenNeeded
      startWhenNeeded = true;
      
      # Printing - Web interface
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.printing.webInterface
      webInterface = false; 
    };

    # Scanning
    # https://search.nixos.org/options?channel=nixos-unstable&show=services.saned.enable
    saned.enable = true;

    # FSTRIM (SSD TRIM)
    # https://search.nixos.org/options?channel=nixos-unstable&show=services.fstrim
    fstrim = {

      # FSTRIM - Enable
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.fstrim.enable
      enable = true;

      # FSTRIM
      # https://search.nixos.org/options?channel=nixos-unstable&show=services.fstrim.interval
      interval = "weekly";
    };
  };
}
