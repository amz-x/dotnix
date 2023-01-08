#
#  Specific system gaming configuration settings module
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./home-manager
#       │    ├─ git.nix
#       │    └─ starship.nix
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix *
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix 
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Steam
  # https://search.nixos.org/options?channel=unstable&show=programs.steam
  programs.steam = {

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

  # Environment
  # https://search.nixos.org/options?channel=unstable&show=environment
  environment = {

    # MESA AMD's RADV
    # https://search.nixos.org/options?channel=unstable&show=environment.variables
    variables.AMD_VULKAN_ICD = "RADV";
    
    # System Packages
    # https://search.nixos.org/options?channel=unstable&show=environment.systemPackages
    systemPackages = with pkgs; [
      # Proton
      protonup-ng
      protontricks
      # Vulkan
      vkbasalt
    ];
  };
}
