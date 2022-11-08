
{ config, lib, pkgs, ... }:

{
  # XDG
  xdg = {
    # XDG Meta
    autostart.enable = true;
    mime.enable = true;
    icons.enable = true;

    # XDG Portal
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };
}