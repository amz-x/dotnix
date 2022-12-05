{ config, lib, pkgs, ... }:

{
  # Pantheon DE - Service
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

    # Touchegg
    touchegg.enable = false;
  };

  # Pantheon Tweaks
  programs.pantheon-tweaks.enable = true;

  # Pantheon Excluded Packages
  environment.pantheon.excludePackages = with pkgs.pantheon; [
    elementary-mail
  ];
}
