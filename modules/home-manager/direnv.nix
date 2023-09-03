#
#  Specific system direnv configuration module for home manager
#

{ lib, config, pkgs, ... }:

{
  # Direnv
  # https://mipmip.github.io/home-manager-option-search/?programs.direnv
  programs.direnv = {

    # Direnv - Enable
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enable
    enable = true;

    # Direnv - Bash Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enableBashIntegration
    enableBashIntegration = true;

    # Direnv - Nushell Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enableNushellIntegration
    enableNushellIntegration = true;

    # Direnv - ZSH Integration
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enableZshIntegration
    enableZshIntegration = true;
    
    # Direnv - Nix Direnv
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv.nix-direnv.enable
    nix-direnv.enable = true;
  };
}
