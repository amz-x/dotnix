#
#  Specific system home configuration settings for desktop
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix
#   │   └─ ./home.nix
#   │
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix *
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
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, pkgs, user, ... }:

{
  # Home Manager
  # https://nix-community.github.io/home-manager/options.html
  home = {
    # Username & Home Directory
    username = "${user}";
    homeDirectory = "/home/${user}";

    # State Version
    stateVersion = "22.11";

    # Home Packages
    packages = with pkgs; [
      awscli2
    ];
  };

  # Programs
  programs = {

    # Home Manager
    home-manager.enable = true;

    # Info
    info.enable = true;

    # Nix-Index
    # nix-index.enable = true;

    # Nushell
    # https://www.nushell.sh/
    nushell = {
      
      # Nushell - Enable
      enable = true;

      # Nushell - Package
      package = pkgs.nushell;

      # Nushell - Extra Configuration
      extraConfig = ''
        let-env config = {
          # Show / Hide Banner
          show_banner: false
        }
      '';
    };
  };

  # Services
  # services = {
  #   # Firewall - Opensnitch UI
  #   opensnitch-ui.enable = true;
  # };
}
