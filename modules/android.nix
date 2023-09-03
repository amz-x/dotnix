#
#  Specific system Android configuration settings for desktop
#

{ config, lib, pkgs, ... }:

{
  # ADB (Android Debug Bridge)
  # https://search.nixos.org/options?channel=channel=23.05&show=programs.adb.enable
  programs.adb.enable = true;
  
  # Environment - System Packages - Android Studio (Development)
  # https://search.nixos.org/options?channel=channel=23.05&show=environment.systemPackages
  # environment.systemPackages = with pkgs; [
  #   android-studio
  # ];
}
