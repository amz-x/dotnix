{ config, lib, pkgs, ... }:

{
  # Programs
  programs = {
    # Pantheon Tweaks
    pantheon-tweaks.enable = true;

    # Dconf
    dconf.enable = true;

    # Steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    # ADB
    # adb.enable = true;

    # Gnome Disks
    gnome-disks.enable = true;
  };
}
