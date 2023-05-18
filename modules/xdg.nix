#
#  Specific system XDG configuration settings module
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
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix *

{ config, lib, pkgs, ... }:

{
  # XDG - Freedesktop Specification Standard
  # https://specifications.freedesktop.org/
  # https://search.nixos.org/options?channel=unstable&show=xdg.autostart
  # xdg = {

  #   # XDG - Autostart
  #   # https://search.nixos.org/options?channel=unstable&show=xdg.autostart
  #   autostart.enable = true;

  #   # XDG - Icons
  #   # https://search.nixos.org/options?channel=unstable&show=xdg.icons
  #   icons.enable = true;

  #   # XDG - Menus
  #   # https://search.nixos.org/options?channel=unstable&show=xdg.menus
  #   menus.enable = true;

  #   # XDG - Mime
  #   # https://search.nixos.org/options?channel=unstable&show=xdg.mime
  #   mime.enable = true;

  #   # XDG - Sounds
  #   # https://search.nixos.org/options?channel=unstable&show=xdg.sounds
  #   sounds.enable = true;

  # };
}
