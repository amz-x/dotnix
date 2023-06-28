#
#  Specific system configuration settings for desktop
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
#   │        ├─ default.nix *
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
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./virtualisation.nix
#       └─ ./vpn.nix

{ lib, pkgs, user, hostname, ... }:

{
  imports =
    [(import ./hardware.nix)] ++
    [(import ../../modules/android.nix)] ++
    [(import ../../modules/audio.nix)] ++
    [(import ../../modules/fonts.nix)] ++
    [(import ../../modules/gaming.nix)] ++
    [(import ../../modules/networking.nix)] ++
    [(import ../../modules/pantheon.nix)] ++
    [(import ../../modules/security.nix)] ++
    [(import ../../modules/services.nix)] ++
    [(import ../../modules/virtualisation.nix)] ++
    [(import ../../modules/vpn.nix)];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "AMZ";
    shell = pkgs.nushell;
    extraGroups = [
      # Default
      "wheel"
      "networkmanager"
      "pipewire"
      "tty"
      "users"
      # Recommended
      "audio"
      "camera"
      "input"
      "lp"
      "scanner"
      "sound"
      "video"
      # Development
      "docker"
    ];
  };

  # Environment settings
  environment = {

    # Include ~/.local/bin/ in $PATH
    localBinInPath = true;

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
      gitFull
      glxinfo
      jq
      nano
      ntfs3g
      pciutils
      pinentry
      sbctl
      screenfetch
      starship
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
      chromium
      bitwarden
      bitwarden-cli
      dbeaver
      discord
      dconf
      gimp
      homebank
      lapce
      librewolf
      libreoffice
      nextcloud-client
      rustdesk
      rustscan
      spotify
      thunderbird
      # Development - Nix
      nixd
      nixfmt
      nixpkgs-fmt
      nix-direnv
      # Development - Docker
      docker
      docker-compose
      docker-buildx
      # Development - Databases
      pgcli
      postgresql
      # Development - AI / ROCm Stack
      rocminfo
      rocm-core
      rocm-device-libs
      rocm-runtime
      # Tools - Networking
      dig
      ldns
      networkmanagerapplet
      traceroute
      wireguard-tools
      # Tools - Security
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

  # Font Configuration
  fonts = {
    # Defaults
    enableDefaultFonts = true;
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
  nixpkgs = {
    # Nixpkgs Configuration
    config = {
      # Allow proprietary software
      allowUnfree = true;
    };
  };

  # NixOS System Settings
  system.stateVersion = "23.05";
}
