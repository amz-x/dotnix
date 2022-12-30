{ config, lib, pkgs, ... }:

{
  # Programs
  programs = {
    # ADB (Android Debug Bridge)
    # https://search.nixos.org/options?channel=unstable&show=programs.adb.enable
    adb.enable = true;

    # Dconf
    # https://search.nixos.org/options?channel=unstable&show=programs.dconf.enable
    dconf.enable = true;

    # Steam
    # https://search.nixos.org/options?channel=unstable&show=programs.steam
    steam = {

      # Steam - Enable
      # https://search.nixos.org/options?channel=unstable&show=programs.steam.enable
      enable = true;

      # Steam - Remote Play
      # https://search.nixos.org/options?channel=unstable&show=programs.steam.remotePlay.openFirewall
      remotePlay.openFirewall = true;

      # Steam - Dedicated Server
      # https://search.nixos.org/options?channel=unstable&show=programs.steam.dedicatedServer.openFirewall
      dedicatedServer.openFirewall = true;
    };

    # Gnome Disks (UDisks2 graphical front-end)
    # https://search.nixos.org/options?channel=unstable&show=programs.gnome-disks.enable
    gnome-disks.enable = true;
  };
}
