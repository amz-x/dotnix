{ config, lib, pkgs, ... }:

{
  # Programs
  programs = {
    # ADB
    adb.enable = true;

    # Dconf
    dconf.enable = true;

    # Steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    # Gnome Disks
    gnome-disks.enable = true;
  };
}
