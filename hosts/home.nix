{ config, lib, pkgs, user, ... }:

{
  # Home Manager
  home = {
    # Username & Home Directory
    username = "${user}";
    homeDirectory = "/home/${user}";

    # State Version
    stateVersion = "22.11";

    # Packages
    packages = with pkgs; [
      # Utilities
      bashInteractive
      coreutils
      wget
      # Developer Tools
      awscli2
      direnv
      docker-compose
      docker-buildx
      # Applications
      firefox
      google-chrome
    ];
  };

  # Programs
  programs = {
    # Home Manager
    home-manager.enable = true;

    # GIT
    git = {
      enable = true;
      userName = "Christopher Crouse";
      userEmail = "mail@amz-x.com";
    };

    # Nushell
    nushell.enable = true;

    # Starship Prompt
    starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };

    # DirEnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  # Services
  services = {
    # Opensnitch UI
    opensnitch-ui.enable = true;
  };
}
