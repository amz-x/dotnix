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
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

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
    [(import ../../modules/vpn.nix)] ++
    [(import ../../modules/xdg.nix)];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "AMZ";
    shell = pkgs.nushell;
    extraGroups = [
     "wheel"
     "networkmanager"
     "docker"
     "audio"
     "sound"
     "video"
     "pipewire"
     "warp"
     "input"
     "tty"
     "camera"
     "lp"
     "scanner"
     "adbusers"
     "users"
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
      TERM = "io.elementary.terminal";
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
      gitFull
      ntfs3g
      opencl-info
      pciutils
      starship
      util-linux
      xdg-user-dirs
      # Libraries
      glib
      gst_all_1.gstreamer
      # Icons
      nixos-icons
      # Applications - CLI
      cabextract
      glxinfo
      jq
      nano
      restic
      screenfetch
      wget
      # Applications - GUI
      appeditor
      bitwarden
      dbeaver
      dconf
      discord
      firefox
      gimp-with-plugins
      google-chrome
      libreoffice
      mailspring
      monitor
      onlyoffice-bin
      postman
      rustdesk
      simplenote
      slack
      spotify
      torrential
      vscode-fhs
      zoom-us
      # Applications - Gnome
      gnome.dconf-editor
      gnome.simple-scan
      # Development - Clang
      clang-ocl
      clang-tools
      # Development - GCC & GDB
      gcc12
      gdb
      # Development - LLVM ROCm Stack (ADMGPU)
      llvmPackages_rocm.clang
      llvmPackages_rocm.llvm
      # Development - Vulkan
      vulkan-headers
      vulkan-loader
      vulkan-tools
      vulkan-tools-lunarg
      # Development - Vulkan Extensions & Layers
      vulkan-extension-layer
      vulkan-validation-layers
      # Development - Nix
      rnix-lsp
      nix-direnv
      nixfmt
      nixpkgs-fmt
      # Development - Ruby
      bundix
      # Development - Docker
      docker
      docker-compose
      docker-buildx
      # Development - Databases
      pgcli
      postgresql
      # Development - Terraform
      terraform
      terraform-docs
      terraform-landscape
      terraform-ls
      terrascan
      tflint      
      # Tools - Networking
      dig
      ldns
      traceroute
      netbird
      netbird-ui
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
    # Enable Defaults
    enableDefaultFonts = true;
    enableGhostscriptFonts = true;

    # Font configuration
    fontconfig = {
      enable = true;
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
  nix = {
    # Nix Package
    package = pkgs.nix;

    # Automatic garbage collection
    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 2d";
    };

    # Settings
    settings = {
      # Trusted Users
      trusted-users = [ "root" "${user}" ];
      # Optimise syslinks
      auto-optimise-store = true;
      # Enable nix flakes on system
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Nixpkgs
  nixpkgs = {

    # Local System Optimizations
    # localSystem = {
    #   # GCC (GNU C Compiler)
    #   # https://github.com/NixOS/nixpkgs/blob/master/lib/systems/architectures.nix
    #   system = "x86_64-linux";
    #   gcc = {
    #     arch = "znver3";
    #     tune = "znver3";
    #   };
    # };

    # Nixpkgs Configuration
    config = {
      # Allow proprietary software
      allowUnfree = true;
    };
  };

  # NixOS System Settings
  system = {
    # System Version
    stateVersion = "22.11"; 
  };
}
