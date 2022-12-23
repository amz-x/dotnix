{ config, lib, pkgs, ... }:

{
  # System Services
  services = {

    # Flatpak
    flatpak.enable = true;

    # Firmware Update Service
    fwupd.enable = true;

    # Avahi
    avahi = {
      enable = true;
      nssmdns = true;
      ipv6 = false;
      publish.enable = false;
    };

    # Printing (CUPS)
    printing = {
      enable = true;
      drivers = with pkgs; [ gutenprint hplip ];
      startWhenNeeded = true;
      webInterface = false; 
    };

    # Scanning
    saned.enable = true;

    # SSD TRIM
    fstrim = {
      enable = true;
      interval = "weekly";
    };

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
