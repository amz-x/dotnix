#
#  Specific system DE configuration settings module
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
#       ├─ ./openrgb.nix
#       ├─ ./pantheon.nix *
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # GNOME DE - Service
  services = {

    # X11 (X Server)
    # https://search.nixos.org/options?channel=unstable&show=services.xserver
    xserver = {

      # Enable the X11 windowing system
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.enable
      enable = true;

      # Keyboard Layout
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.layout
      layout = "za";

      # XServer - LibInput
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.libinput
      libinput = {

        # XServer - LibInput - Enable
        # https://search.nixos.org/options?channel=unstable&show=services.xserver.libinput.enable
        enable = true;

        # XServer - LibInput - Mouse & Mousepad Configuration
        # https://search.nixos.org/options?channel=unstable&show=services.xserver.libinput.mouse
        mouse = {

          # XServer - LibInput - Mouse - Tapping
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.libinput.mouse.tapping
          tapping = true;

          # XServer - LibInput - Mouse - Scroll Method
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.libinput.mouse.scrollMethod
          scrollMethod = "twofinger";

          # XServer - LibInput - Mouse - Enable Horizontal Scrolling
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.libinput.mouse.horizontalScrolling
          horizontalScrolling = true;
          
          # XServer - LibInput - Mouse - Disable Left Handed Configuration
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.libinput.mouse.leftHanded
          leftHanded = false;
        };
      };

      # XServer - Video Drivers
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.videoDrivers
      videoDrivers = [ 
        "amdgpu"
        "modesetting"
      ];

      # XServer - Modules
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.modules
      # https://search.nixos.org/packages?channel=unstable&type=packages&query=xorg
      modules = with pkgs.xorg; [ 
        xf86videoamdgpu
        xf86inputlibinput
      ];

      # XServer - Exclude Packages
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.excludePackages
      excludePackages = with pkgs; [ xterm ];

      # XServer - Display Manager - GDM
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.displayManager
      displayManager.gdm.enable = true;

      # XServer - Desktop Manager
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager
      desktopManager = {

        #  XServer - Desktop Manager - GNOME Desktop Environment (DE)
        # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.gnome
        gnome = {
          # XServer - Desktop Manager - GNOME - Enable
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.gnome.enable
          enable = true;

          # XServer - Desktop Manager - GNOME - Debugging
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.gnome.debug
          debug = false;
        };
      };
    };

    # GNOME
    # https://search.nixos.org/options?channel=unstable&show=services.gnome
    gnome = {
      core-developer-tools.enable = true;
      core-os-services.enable = true;
      core-shell.enable = true;
      core-utilities.enable = true;
      gnome-browser-connector.enable = true;
      gnome-keyring.enable = true;
    };

    # Flatpak
    # https://search.nixos.org/options?channel=unstable&show=services.flatpak.enable
    flatpak.enable = true;

    # UPower
    # https://search.nixos.org/options?channel=unstable&show=services.upower.enable
    upower.enable = true;

    # System76 Scheduler
    # https://search.nixos.org/options?channel=unstable&show=services.system76-scheduler
    system76-scheduler.settings.processScheduler.foregroundBoost.enable = true;
  };

  # Programs
  # https://search.nixos.org/options?channel=unstable&show=programs
  programs = {

    # Programs - Dconf
    # https://search.nixos.org/options?channel=unstable&show=programs.dconf.enable
    dconf.enable = true;
    
    # Programs - Evince
    # https://search.nixos.org/options?channel=unstable&show=programs.evince.enable
    evince.enable = true;

    # Programs - File-Roller
    # https://search.nixos.org/options?channel=unstable&show=programs.file-roller.enable
    file-roller.enable = true;

    # Programs - GNOME Disks (UDisks2 graphical front-end)
    # https://search.nixos.org/options?channel=unstable&show=programs.gnome-disks.enable
    gnome-disks.enable = true;

    # Programs - Geary
    # https://search.nixos.org/options?channel=unstable&show=programs.geary
    geary.enable = true;

    # Programs - KDE Connect
    # https://search.nixos.org/options?channel=unstable&show=programs.kdeconnect
    kdeconnect.enable = true;

    # Programs - XWayland
    # https://search.nixos.org/options?channel=unstable&show=programs.xwayland
    xwayland.enable = true;
  };

  # Enviroment - System Packages
  # https://search.nixos.org/options?channel=unstable&show=environment.systemPackages
  environment.systemPackages = with pkgs; [
    # Applications
    gnome-extension-manager
    gnome-keysign
    # Applications - Gnome
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome.seahorse
    gnome.simple-scan
    # Gnome Extensions
    gnomeExtensions.arcmenu
    gnomeExtensions.coverflow-alt-tab
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.nextcloud-folder
    gnomeExtensions.user-themes
    # Applications - Other
    baobab
    dippi
    soundux
  ];
}
