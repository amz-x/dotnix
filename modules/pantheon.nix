#
#  Specific system DE configuration settings module
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./pantheon.nix *
#       ├─ ./programs.nix
#       ├─ ./security.nix 
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
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

      # Video Drivers
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.videoDrivers
      videoDrivers = [ "amdgpu" ];

      # Desktop Manager
      # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager
      desktopManager = {

        # Pantheon Desktop Environment
        # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon
        pantheon = {

          # Pantheon - Enable
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon.enable
          enable = true;
          
          # Pantheon - Extra Switchboard Plugs
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon.extraSwitchboardPlugs
          extraSwitchboardPlugs = with pkgs; [ 
            pantheon-tweaks
          ];

          # Pantheon - Extra Wingpanel Indicators
          # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.pantheon.extraWingpanelIndicators
          extraWingpanelIndicators = with pkgs; [ ];
        };

        # Xterm
        # https://search.nixos.org/options?channel=unstable&show=services.xserver.desktopManager.xterm.enable
        xterm.enable = false;
      };
    };

    # Touchegg
    # https://search.nixos.org/options?channel=unstable&show=services.touchegg
    touchegg.enable = false;
  };

  # Pantheon Tweaks
  # https://search.nixos.org/options?channel=unstable&show=programs.pantheon-tweaks
  programs.pantheon-tweaks.enable = true;

  # Pantheon Excluded Packages
  # https://search.nixos.org/options?channel=unstable&show=environment.pantheon.excludePackages
  environment.pantheon.excludePackages = with pkgs.pantheon; [
    elementary-mail
  ];
}
