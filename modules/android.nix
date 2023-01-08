#
#  Specific system Android configuration settings for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./android.nix *
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
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
