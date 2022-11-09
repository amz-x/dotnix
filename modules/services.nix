{ config, lib, pkgs, ... }:

{
  # System Services
  services = {
    # X11
    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Video Drivers
      videoDrivers = [ "amdgpu" ];

      # Desktop Manager
      desktopManager = {

        # Pantheon Desktop Environment
        pantheon = {
          enable = true;
          
          # Pantheon Switchboard Plugs
          extraSwitchboardPlugs = with pkgs; [ 
            pantheon-tweaks
          ];

          # Pantheon Wingpanel Indicators
          extraWingpanelIndicators = with pkgs; [
            wingpanel-indicator-ayatana
          ];
        };
      };
    };

    # Sound
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    # Flatpak
    flatpak.enable = true;

    # Firmware Update Service
    fwupd.enable = true;

    # Touchegg
    touchegg.enable = false;

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
      drivers = with pkgs; [ hplip ];
      startWhenNeeded = true;
      webInterface = false;
      listenAddresses = [];    
    };

    # Scanning
    saned.enable = true;

    # SSD TRIM
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    # Firewall
    opensnitch = {
      enable = true;
      settings = {
        DefaultAction = "deny";
        DefaultDuration = "until restart";
        Firewall = "iptables";
        LogLevel = 2;
        ProcMonitorMethod = "ebpf";
      };
    };

    # Mullvad (VPN)
    # mullvad-vpn = {
    #  enable = true;
    #  package = pkgs.mullvad-vpn;
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