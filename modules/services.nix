{ config, lib, pkgs, ... }:

{
  # System Services
  services = {

    # FWUPD - Firmware Update Service
    # https://search.nixos.org/options?channel=nixos-23.05&show=services.fwupd
    fwupd = {

      # FWUPD - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.fwupd.enable
      enable = true;

      # FWUPD - Package
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.fwupd.package
      package = pkgs.fwupd;
    };

    # Avahi
    # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi
    avahi = {

      # Avahi - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi
      enable = true;

      # Avahi - mDNS NSS (Name Service Switch)
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi.nssmdns
      nssmdns = true;
      
      # Avahi - IPV6
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi.ipv6
      ipv6 = false;

      # Avahi - Firewall
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi.openFirewall
      openFirewall = true;

      # Avahi - Publish
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi.publish
      publish = {

        # Avahi - Publish - Enable
        # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi.publish.enable
        enable = true;

        # Avahi - Publish - User Services
        # https://search.nixos.org/options?channel=nixos-23.05&show=services.avahi.publish.userServices
        userServices = true;
      };
    };

    # Printing (CUPS)
    # https://search.nixos.org/options?channel=nixos-23.05&show=services.printing
    printing = {

      # Printing - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.printing.enable
      enable = true;

      # Printing - Drivers
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.printing.drivers
      drivers = with pkgs; [ gutenprint hplip ];

      # Printing - Start when needed
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.printing.startWhenNeeded
      startWhenNeeded = true;
      
      # Printing - Web interface
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.printing.webInterface
      webInterface = false; 
    };

    # Scanning
    # https://search.nixos.org/options?channel=nixos-23.05&show=services.saned.enable
    saned.enable = true;

    # FSTRIM (SSD TRIM)
    # https://search.nixos.org/options?channel=nixos-23.05&show=services.fstrim
    fstrim = {

      # FSTRIM - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.fstrim.enable
      enable = true;

      # FSTRIM
      # https://search.nixos.org/options?channel=nixos-23.05&show=services.fstrim.interval
      interval = "weekly";
    };
  };
}
