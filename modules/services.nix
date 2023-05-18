{ config, lib, pkgs, ... }:

{
  # System Services
  services = {

    # FWUPD - Firmware Update Service
    # https://search.nixos.org/options?channel=unstable&show=services.fwupd
    fwupd = {

      # FWUPD - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.fwupd.enable
      enable = true;

      # FWUPD - Package
      # https://search.nixos.org/options?channel=unstable&show=services.fwupd.package
      package = pkgs.fwupd;
    };

    # Avahi
    # https://search.nixos.org/options?channel=unstable&show=services.avahi
    avahi = {

      # Avahi - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.avahi
      enable = true;

      # Avahi - mDNS NSS (Name Service Switch)
      # https://search.nixos.org/options?channel=unstable&show=services.avahi.nssmdns
      nssmdns = true;
      
      # Avahi - IPV6
      # https://search.nixos.org/options?channel=unstable&show=services.avahi.ipv6
      ipv6 = false;

      # Avahi - Firewall
      # https://search.nixos.org/options?channel=unstable&show=services.avahi.openFirewall
      openFirewall = true;

      # Avahi - Publish
      # https://search.nixos.org/options?channel=unstable&show=services.avahi.publish
      publish = {

        # Avahi - Publish - Enable
        # https://search.nixos.org/options?channel=unstable&show=services.avahi.publish.enable
        enable = true;

        # Avahi - Publish - User Services
        # https://search.nixos.org/options?channel=unstable&show=services.avahi.publish.userServices
        userServices = true;
      };
    };

    # Printing (CUPS)
    # https://search.nixos.org/options?channel=unstable&show=services.printing
    printing = {

      # Printing - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.printing.enable
      enable = true;

      # Printing - Drivers
      # https://search.nixos.org/options?channel=unstable&show=services.printing.drivers
      drivers = with pkgs; [ gutenprint hplip ];

      # Printing - Start when needed
      # https://search.nixos.org/options?channel=unstable&show=services.printing.startWhenNeeded
      startWhenNeeded = true;
      
      # Printing - Web interface
      # https://search.nixos.org/options?channel=unstable&show=services.printing.webInterface
      webInterface = false; 
    };

    # Scanning
    # https://search.nixos.org/options?channel=unstable&show=services.saned.enable
    saned.enable = true;

    # FSTRIM (SSD TRIM)
    # https://search.nixos.org/options?channel=unstable&show=services.fstrim
    fstrim = {

      # FSTRIM - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.fstrim.enable
      enable = true;

      # FSTRIM
      # https://search.nixos.org/options?channel=unstable&show=services.fstrim.interval
      interval = "weekly";
    };

    # Jellyfin
    # https://search.nixos.org/options?channel=unstable&show=services.jellyfin
    jellyfin = {
      # Jellyfin - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.jellyfin.enable
      enable = false;

      # Jellyfin - Package
      # https://search.nixos.org/options?channel=unstable&show=services.jellyfin.package
      package = pkgs.jellyfin;

      # Jellyfin - Open Firewall Ports
      # https://search.nixos.org/options?channel=unstable&show=services.jellyfin.openFirewall
      openFirewall = false;
    };

    # RTSP Server
    # https://search.nixos.org/options?channel=unstable&show=services.rtsp-simple-server
    # rtsp-simple-server = {
    #   # RTSP Server - Enable
    #   # https://search.nixos.org/options?channel=unstable&show=services.rtsp-simple-server.enable
    #   enable = false;
    # };

    # Wireguard Netmanager
    # wg-netmanager.enable = true;
    # Unbound
    # unbound = {
    #   enable = true;
    #   # Use and update root trust anchor for DNSSEC validation
    #   enableRootTrustAnchor = true;
    #   # Resolve local queries (i.e. add 127.0.0.1 to /etc/resolv.conf)
    #   resolveLocalQueries = true;
    #   # Local DNS caching
    #   settings = {
    #     server = {
    #       interface = "127.0.0.1";
    #       access-control = [
    #         "127.0.0.0/8 allow"
    #         "192.168.0.0/16 allow"
    #       ];
    #       do-not-query-localhost = false;
    #     };
        
    #     forward-zone = [
    #       {
    #         name = ".";
    #         forward-addr = [
    #           "9.9.9.9@53#dns.quad9.net"
    #           "9.9.9.11@53#dns11.quad9.net"
    #         ];
    #       }
    #     ];
    #   };
    # };

  

    # Samba
    # samba = {
    #  enable = true; 
    #  openFirewall = true;
    # };

  };
}
