#
#  Specific system DE configuration settings module
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
#       ├─ ./asus.nix *
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./homeassistant.nix
#       ├─ ./networking.nix
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
  # Programs - ROG Control Center
  # https://search.nixos.org/options?channel=23.05&show=programs.rog-control-center
  programs.rog-control-center = {
    # ROG Control Center - Enable
    # https://search.nixos.org/options?channel=23.05&show=programs.rog-control-center.enable
    enable = true;
        
    # ROG Control Center - Auto Start
    # https://search.nixos.org/options?channel=23.05&show=programs.rog-control-center.autoStart
    autoStart = true;
  };
    
  # Services - ASUS Deamon
  # https://search.nixos.org/options?channel=23.05&show=services.asusd
  services.asusd = {
    # Services - ASUS Deamon - Enable
    # https://search.nixos.org/options?channel=23.05&show=services.asusd.enable
    enable = true;
      
    # Services - ASUS Deamon - Enable
    # https://search.nixos.org/options?channel=23.05&show=services.asusd.enableUserService
    enableUserService = true;
  };
}
