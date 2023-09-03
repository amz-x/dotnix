#
#  Specific system home configuration settings for desktop
#

{ lib, config, pkgs, user, ... }:

{
  # Home Manager
  # https://nix-community.github.io/home-manager/options.html
  home = {
    # Username & Home Directory
    username = "${user}";

    # Home Directory
    # https://nix-community.github.io/home-manager/options.html#opt-home.homeDirectory
    homeDirectory = "/home/${user}";

    # State Version
    # https://nix-community.github.io/home-manager/options.html#opt-home.stateVersion
    stateVersion = "23.11";

    # Home Packages
    # https://nix-community.github.io/home-manager/options.html#opt-home.packages
    packages = with pkgs; [
      # AWS CLI
      awscli2
      # Utilities
      localsend
    ];
  };

  # Programs
  programs = {

    # Home Manager
    # https://nix-community.github.io/home-manager/options.html#opt-programs.home-manager.enable
    home-manager.enable = true;

    # GNU Info
    # https://nix-community.github.io/home-manager/options.html#opt-programs.info.enable
    info.enable = true;

    # Nix Index
    # https://nix-community.github.io/home-manager/options.html#opt-programs.nix-index
    nix-index.enable = true;

    # Nushell (https://www.nushell.sh/)
    # https://nix-community.github.io/home-manager/options.html#opt-programs.nushell
    nushell = {

      # Nushell - Enable
      # https://nix-community.github.io/home-manager/options.html#opt-programs.nushell.enable
      enable = true;

      # Nushell - Package
      # https://nix-community.github.io/home-manager/options.html#opt-programs.nushell.package
      package = pkgs.nushell;

      # Nushell - Shell Aliases
      # https://nix-community.github.io/home-manager/options.html#opt-programs.nushell.shellAliases
      shellAliases = {
        code = "codium";
        ls = "ls -a";
      };

      # Nushell - Extra Configuration
      # https://nix-community.github.io/home-manager/options.html#opt-programs.nushell.extraConfig
      extraConfig = ''
        # Nushell Configuration
        $env.config = ($env | default {} config).config

        # Nushell Configuration - Hide Banner
        $env.config = ($env.config | upsert show_banner false)
      '';
    };
  };

  # Services
  services = {
    # Firewall - Opensnitch UI
    # https://nix-community.github.io/home-manager/options.html#opt-services.opensnitch-ui.enable
    opensnitch-ui.enable = true;
  };
}
