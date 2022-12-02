#
#  Home-manager configuration for MacBook Pro
#
#  flake.nix
#   └─ ./darwin
#       ├─ ./default.nix
#       ├─ ./configuration.nix
#       └─ ./home.nix * 
#

{ pkgs, ... }:

{
  # Home Manager
  home = {
    packages = with pkgs; [];
    stateVersion = "22.11";
  };
  
  # Home Manager - Programs
  programs = {
    # Home Manager
    home-manager.enable = true;

    # GIT
    git = {
      enable = true;
      userName = "Christopher Crouse";
      userEmail = "mail@amz-x.com";
    };

    # Terminal
    alacritty = {
      enable = true;
    };

    # ZSH
    zsh = {
      enable = true;

      # ZSH - Configuration
      autocd = true;
      dotDir = ".config/zsh";

      # ZSH - Initialize Extra
      initExtra = "source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh";

      # ZSH - Additional Shell Plugins & Integrations
      enableCompletion = true;
      enableBashCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
    };

    # Starship Prompt
    starship = {
      enable = true;

      # Bash & ZSH Integration
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # DirEnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
