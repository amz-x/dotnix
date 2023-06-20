#
#  Specific system gaming configuration settings module
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
#       ├─ ./gaming.nix *
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
  # Programs
  # https://search.nixos.org/options?channel=nixos-23.05&show=programs
  programs = {

    # Steam
    # https://search.nixos.org/options?channel=nixos-23.05&show=programs.steam
    steam = {

      # Steam - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=programs.steam.enable
      enable = true;

      # Steam - Remote Play
      # https://search.nixos.org/options?channel=nixos-23.05&show=programs.steam.remotePlay.openFirewall
      remotePlay.openFirewall = true;

      # Steam - Dedicated Server
      # https://search.nixos.org/options?channel=nixos-23.05&show=programs.steam.dedicatedServer.openFirewall
      dedicatedServer.openFirewall = true;
    };


    # Gamemode
    # https://search.nixos.org/options?channel=nixos-23.05&show=programs.gamemode
    gamemode = {

      # Gamemode - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=programs.gamemode.enable
      enable = true;

      # Gamemode - Settings
      # https://search.nixos.org/options?channel=nixos-23.05&show=programs.gamemode.settings
      settings = {
        # General Configuration
        general = {
          renice = 10;
          ioprio = 0;
        };

        # GPU Configuration
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device              = 0;
          amd_performance_level   = "high";
        };

        # Custom Script Configuration
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end   = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };

  # Environment
  # https://search.nixos.org/options?channel=unstable&show=environment
  environment = {

    # MESA AMD's RADV
    # https://search.nixos.org/options?channel=unstable&show=environment.variables
    variables.AMD_VULKAN_ICD = "RADV";

    # System Packages
    # https://search.nixos.org/options?channel=unstable&show=environment.systemPackages
    systemPackages = with pkgs; [
      # SDL2
      SDL2
      SDL2_image
      # Gamemode
      gamemode
      # Vulkan
      vkbasalt
    ];
  };
}
