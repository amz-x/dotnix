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
  # Pantheon DE - Service
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

      # XServer - Desktop Manager
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager
      desktopManager = {

        #  XServer - Desktop Manager - Pantheon Desktop Environment (DE)
        # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon
        pantheon = {

          # Pantheon - Enable
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon.enable
          enable = true;

          # XServer - Desktop Manager - Pantheon DE - Debugging
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon.debug
          debug = false;

          # Pantheon - Extra Switchboard Plugs
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon.extraSwitchboardPlugs
          extraSwitchboardPlugs = with pkgs; [ 
            pantheon-tweaks
          ];

          # Pantheon - Extra Wingpanel Indicators
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon.extraWingpanelIndicators
          # extraWingpanelIndicators = with pkgs; [ ];
        };
      };
    };

    # Flatpak
    # https://search.nixos.org/options?channel=unstable&show=services.flatpak.enable
    flatpak.enable = true;

    # Touchegg
    # https://search.nixos.org/options?channel=unstable&show=services.touchegg.enable
    touchegg.enable = true;

    # UPower
    # https://search.nixos.org/options?channel=unstable&show=services.upower.enable
    upower.enable = true;
  };

  # Programs
  # https://search.nixos.org/options?channel=unstable&show=programs
  programs = {

    # Programs - Dconf
    # https://search.nixos.org/options?channel=unstable&show=programs.dconf.enable
    dconf.enable = true;

    # Programs - Gnome Disks (UDisks2 graphical front-end)
    # https://search.nixos.org/options?channel=unstable&show=programs.gnome-disks.enable
    gnome-disks.enable = true;

    # Programs - Pantheon Tweaks
    # https://search.nixos.org/options?channel=unstable&show=programs.pantheon-tweaks
    pantheon-tweaks.enable = true;
  };

  # Environment - Pantheon Excluded Packages
  # https://search.nixos.org/options?channel=unstable&show=environment.pantheon.excludePackages
  environment.pantheon.excludePackages = [ ];

  # Enviroment - System Packages
  # https://search.nixos.org/options?channel=unstable&show=environment.systemPackages
  environment.systemPackages = with pkgs; [
    # Applications - Pantheon
    appeditor
    ciano
    dippi
    monitor
    torrential
    # Applications - Gnome
    gnome.dconf-editor
    gnome.seahorse
    gnome.simple-scan
    gnome-keysign
    # Applications - GTK
    baobab
  ];

  # XDG - Freedesktop Specification Standard
  # https://specifications.freedesktop.org/
  # https://search.nixos.org/options?channel=unstable&show=xdg.autostart
  xdg = {

    # XDG - Autostart
    # https://search.nixos.org/options?channel=unstable&show=xdg.autostart
    autostart.enable = true;

    # XDG - Icons
    # https://search.nixos.org/options?channel=unstable&show=xdg.icons
    icons.enable = true;

    # XDG - Menus
    # https://search.nixos.org/options?channel=unstable&show=xdg.menus
    menus.enable = true;

    # XDG - Mime
    # https://search.nixos.org/options?channel=unstable&show=xdg.mime
    mime.enable = true;

    # XDG - Sounds
    # https://search.nixos.org/options?channel=unstable&show=xdg.sounds
    sounds.enable = true;

    # XDG - Portal
    # https://search.nixos.org/options?channel=unstable&show=xdg.portal
    portal = {

      # XDG - Portal - Enable
      # https://search.nixos.org/options?channel=unstable&show=xdg.portal.enable      
      enable = true;
      
      # XDG - Portal - Extra Portals
      # https://search.nixos.org/options?channel=unstable&show=xdg.portal.extraPortals
      extraPortals = with pkgs; [
        # Pantheon
        pantheon.elementary-files
        pantheon.elementary-settings-daemon
        pantheon.xdg-desktop-portal-pantheon
        # GTK
        xdg-desktop-portal-gtk
      ];
    };
  };
}
