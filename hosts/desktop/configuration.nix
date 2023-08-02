#
#  Specific system configuration settings for desktop
#

{ lib, pkgs, user, ... }:

{
  imports =
    [(import ./hardware.nix)] ++
    [(import ./modules/android.nix)] ++
    [(import ./modules/audio.nix)] ++
    [(import ./modules/fonts.nix)] ++
    [(import ./modules/gaming.nix)] ++
    [(import ./modules/networking.nix)] ++
    [(import ./modules/pantheon.nix)] ++
    [(import ./modules/security.nix)] ++
    [(import ./modules/services.nix)] ++
    [(import ./modules/virtualisation.nix)] ++
    [(import ./modules/vpn.nix)];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = lib.mkDefault true;
    description = "AMZ";
    shell = pkgs.nushell;
    extraGroups = [
      # Default
      "wheel"
      "networkmanager"
      "pipewire"
      # Recommended
      "audio"
      "camera"
      "input"
      "lp"
      "scanner"
      "sound"
      "video"
      # Development
      "podman"
    ];
  };

  # Environment settings
  environment = {

    # Include ~/.local/bin/ in $PATH
    # localBinInPath = true;

    # Variables
    variables = {
      # EDITOR
      EDITOR = "nano";
      # TERMINAL
      TERM = "xterm-256color";
    };

    # Shells
    shells = with pkgs; [
      bashInteractive
      nushell
    ];

    # Default packages install system-wide
    # https://search.nixos.org/packages?channel=unstable
    systemPackages = with pkgs; [
      # System Tools & Utilities
      coreutils
      gnupg
      git
      glxinfo
      jq
      nano
      ntfs3g
      nvme-cli
      pciutils
      pinentry
      sbctl
      screenfetch
      starship
      tree
      util-linux
      wget
      xdg-user-dirs
      # Libraries
      ffmpeg
      glib
      glibc
      gst_all_1.gstreamer
      libnotify
      # Icons
      nixos-icons
      # Applications - GUI
      firefox
      bitwarden
      dbeaver
      discord
      dconf
      gimp
      google-chrome
      lapce
      libreoffice
      librewolf
      nextcloud-client
      rustdesk
      rustscan
      spotify
      # Development - Nix
      nil
      nixfmt
      nixpkgs-fmt
      nix-direnv
      # Development - Databases
      pgcli
      postgresql
      # Development - AI / ROCm Stack
      rocminfo
      rocm-core
      rocm-device-libs
      rocm-runtime
      # Virtualisation - Docker
      podman
      podman-compose
      # Tools - Networking
      dig
      ldns
      traceroute
      wireguard-tools
      # Tools - Security
      nikto
      vulnix
    ];

    # Unix ODBC Drivers
    unixODBCDrivers = with pkgs.unixODBCDrivers; [ 
      psql
      sqlite
      msodbcsql17
    ];
  };

  # Timezone
  # https://search.nixos.org/options?channel=unstable&show=time.timeZone
  time.timeZone = "Africa/Johannesburg";

  # Internationalisation
  # https://search.nixos.org/options?channel=unstable&show=i18n
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "en_ZA.UTF-8/UTF-8" ];
    extraLocaleSettings = {
      LC_ADDRESS = "en_ZA.UTF-8";
      LC_IDENTIFICATION = "en_ZA.UTF-8";
      LC_MEASUREMENT = "en_ZA.UTF-8";
      LC_MONETARY = "en_ZA.UTF-8";
      LC_NAME = "en_ZA.UTF-8";
      LC_NUMERIC = "en_ZA.UTF-8";
      LC_PAPER = "en_ZA.UTF-8";
      LC_TELEPHONE = "en_ZA.UTF-8";
      LC_TIME = "en_ZA.UTF-8";
    };
  };

  # Font Configuration
  # https://search.nixos.org/options?channel=unstable&show=fonts
  fonts = {
    # Defaults
    enableGhostscriptFonts = true;

    # Font configuration
    fontconfig = {
      enable = true;
      cache32Bit = true;
      useEmbeddedBitmaps = true;
      hinting = {
        enable = true;
        autohint = true;
        style = "slight";
      };
      defaultFonts = {
        emoji = [
         "Noto Color Emoji"
        ];
        monospace = [
          "Hack"
          "Inconsolata"
          "Source Sans Mono"
          "Liberation Mono"
          "DejaVu Mono"
        ];
        sansSerif = [
          "Inter"
          "Liberation Sans"
          "Source Sans"
        ];
        serif = [
          "Liberation Serif"
          "Source Serif"
        ];
      };
    };
  };

  # Nix Package Manager
  # https://search.nixos.org/options?channel=unstable&show=nix
  nix = {
    # Nix Package
    package = pkgs.nix;

    # Automatic garbage collection
    # https://search.nixos.org/options?channel=unstable&show=nix.gc
    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 2d";
    };

    # Settings
    # https://search.nixos.org/options?channel=unstable&show=nix.settings
    settings = {
      # Optimise syslinks
      auto-optimise-store = true;

      # Trusted Users
      trusted-users = [
        "root"
        "${user}"
      ];

      # Enable nix flakes on system
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Nixpkgs
  # https://search.nixos.org/options?channel=unstable&show=nixpkgs
  nixpkgs = {
    # Hostplatform
    hostPlatform = lib.mkDefault "x86_64-linux";
    # Nixpkgs Configuration
    config = {
      # Allow proprietary software
      allowUnfree = true;
    };
  };

  # NixOS Packages Documentation
  # https://search.nixos.org/options?channel=unstable&show=documentation.enable
  documentation.enable = lib.mkDefault true;

  # NixOS System Settings
  # https://search.nixos.org/options?channel=unstable&show=system.stateVersion
  system.stateVersion = "23.11";
}
