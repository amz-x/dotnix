#
#  Specific system syncthing configuration settings module for home manager
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
#       ├─ ./networking.nix
#       ├─ ./openrgb.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix *
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # RTSP Simple Server
  # https://search.nixos.org/options?channel=unstable&show=services.rtsp-simple-server
  # services.rtsp-simple-server = {

  #   # RTSP Simple Server - Enable
  #   # https://search.nixos.org/options?channel=unstable&show=services.rtsp-simple-server.enable
  #   enable = true;

  #   # RTSP Simple Server - Settings
  #   # https://search.nixos.org/options?channel=unstable&show=services.rtsp-simple-server.settings
  #   settings = {
  #     # Logging
  #     logDestinations = [ "stdout" ];
  #     logFile = "/var/log/rtsp-simple-server/rtsp-simple-server.log";
  #     logLevel = "info";
  #     paths = {
  #       mystream = {};
  #     };
  #   };
  # };

  # # Default packages install system-wide
  # # https://search.nixos.org/packages?channel=unstable
  # environment.systemPackages = with pkgs; [
  #   ffmpeg
  # ];
}
