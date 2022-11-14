#
#  Specific system configuration settings for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./desktop
#   │        ├─ default.nix *
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./fonts.nix
#       ├─ ./home.nix
#       ├─ ./programs.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       └─ ./xdg.nix

{ lib, pkgs, user, hostname, ... }:

{
  imports =                                              
    [(import ./hardware.nix)] ++
    [(import ../../modules/fonts.nix)] ++
    [(import ../../modules/programs.nix)] ++
    [(import ../../modules/security.nix)] ++
    [(import ../../modules/services.nix)] ++
    [(import ../../modules/virtualisation.nix)] ++
    [(import ../../modules/xdg.nix)];

  # Boot configuration
  boot = {

    # Plymouth
    plymouth.enable = true;
    
    # EFI boot loader
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "AMZ";
    extraGroups = [
     "wheel"
     "networkmanager"
     "docker"
     "audio"
     "sound"
     "video"
     "input"
     "tty"
     "camera"
     "lp"
     "scanner"
     "adbusers"
     "users"
    ];
    shell = pkgs.nushell;
  };

  # Environment settings
  environment = {

    # Include ~/.local/bin/ in $PATH
    localBinInPath = true;

    # Variables
    variables = {
      # MESA AMD's RADV
      AMD_VULKAN_ICD = "RADV";
      # TERMINAL
      TERM = "io.elementary.terminal";
      # EDITOR
      EDITOR = "nano";
    };

    # Shells
    shells = with pkgs; [
      bashInteractive
      nushell
    ];

    # Default packages install system-wide
    systemPackages = with pkgs; [
      # Utilities
      bashInteractive
      coreutils
      gcc
      gdb
      git
      glib
      ldns
      traceroute
      nano
      ntfs3g
      pciutils
      screenfetch
      starship
      util-linux
      wget
      xdg-user-dirs      
      # Nix utilities
      rnix-lsp
      nix-direnv
      nixfmt
      nixpkgs-fmt
      # Icons
      nixos-icons
      # Applications
      appeditor
      bitwarden
      discord
      firefox
      gimp-with-plugins
      google-chrome
      libreoffice
      vscode-fhs
      rustdesk
      simplenote
      slack
      spotify
      mailspring
      monitor      
      torrential
      zoom-us
      # Development
      bundix
      docker-compose
      docker-buildx
      # Databases
      pgcli
      postgresql
      # System utilities
      gst_all_1.gstreamer
      dconf
      gnome.dconf-editor
      gnome.simple-scan
      vulnix
      wireguard-tools
    ];

    # Pantheon Excluded Packages
    pantheon.excludePackages = with pkgs.pantheon; [
      elementary-mail
      epiphany
    ];

    # Unix ODBC Drivers
    unixODBCDrivers = with pkgs.unixODBCDrivers; [ 
      psql
      sqlite
      msodbcsql17
    ];
  };  

  # Timezone
  time.timeZone = "Africa/Johannesburg";

  # Internationalisation
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "en_ZA.UTF-8/UTF-8" ];
    extraLocaleSettings = {
      LC_TIME = "en_ZA.UTF-8";
      LC_MONETARY = "en_ZA.UTF-8";
    };
  };

  # Networking
  networking = {
    
    # Hostname
    hostName = "${hostname}";

    # Default Gateway
    defaultGateway = "192.168.50.1";

    # Hosts
    hosts = {
      "127.0.0.1" = [ "${hostname}" ];
      "1.1.1.1"   = [ "cloudflare-dns.com" ];
      "9.9.9.9"   = [ "dns.quad9.net" ];
      "9.9.9.11"  = [ "dns11.quad9.net" ];
    };

    # Network Manager
    # DNS options: [ "default", "dnsmasq", "unbound", "systemd-resolved", "none" ]
    networkmanager = {
      enable = true;
    };

    # Openresolv 
    resolvconf = {
      enable = true;
      dnsSingleRequest = true;
    };
  };

  # Nix Package Manager
  nix = {    

    # Settings
    settings = {
      # Optimise syslinks
      auto-optimise-store = true;
      # Enable nix flakes on system
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    # Automatic garbage collection
    gc = {                                  
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };

  # Allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # NixOS Settings
  system = {
    # System Version
    stateVersion = "22.11"; 
  };  
}
