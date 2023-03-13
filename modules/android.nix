#
#  Specific system Android configuration settings for desktop
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
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix *
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
#       └─ ./xdg.nix


{ config, lib, pkgs, ... }:

{
  # ADB (Android Debug Bridge)
  # https://search.nixos.org/options?channel=unstable&show=programs.adb.enable
  programs.adb.enable = true;
  
  # Environment - System Packages - Android Studio (Development)
  # https://search.nixos.org/options?channel=unstable&show=environment.systemPackages
  environment.systemPackages = with pkgs; [
    android-studio
  ];
}
