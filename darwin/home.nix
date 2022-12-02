#
#  Home-manager configuration for MacBook Pro
#
#  flake.nix
#   └─ ./darwin
#       ├─ ./default.nix
#       ├─ ./configuration.nix
#       └─ ./home.nix * 
#

{ config, pkgs, ... }:

{
  # Home Manager
  home = {
    # Home Packages
    packages = with pkgs; [
      awscli2
      coreutils
      wget
      jq
    ];

    # Home State Version
    stateVersion = "22.11";
  };
  
  # Programs
  programs = {

    # Home Manager
    home-manager.enable = true;

    # Info
    info.enable = true;

    # Nix-Index
    nix-index.enable = true;

    # Terminal
    alacritty = {
      enable = true;
      settings = {
        offset = {
          x = -1;
          y = 0;
        };
      };
    };

    # GIT
    git = {
      # GIT - Enable
      enable = true;

      # GIT - Username & Email
      userName = "Christopher Crouse";
      userEmail = "mail@amz-x.com";
      
      # GIT - Package
      package = pkgs.gitFull;

      # GIT - Default Ignores
      ignores = [ ".DS_Store" ];
    };

    # ZSH
    zsh = {
      # ZSH - Enable
      enable = true;

      # ZSH - Configuration
      autocd = true;
      dotDir = ".config/zsh";

      # ZSH - Initialize Extra
      initExtraBeforeCompInit = ''
        source "${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh"
        source "${pkgs.zinit}/share/zinit/zinit.zsh"

        zinit light zsh-users/zsh-completions
        zinit light zsh-users/zsh-autosuggestions
        zinit light zdharma-continuum/fast-syntax-highlighting

        zinit light mafredri/zsh-async
        zinit light caarlos0/zsh-pg
      '';
      
      # ZSH - History
      history = {
        path = "${config.xdg.dataHome}/zsh/zsh_history";
        save = 10000;
        size = 10000;
      };
    };

    # Starship Prompt
    starship = {
      # Starship - Enable Management
      enable = true;

      # Bash & ZSH Integration
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # DirEnv
    direnv = {
      # DirEnv - Enable Management
      enable = true;

      # DirEnv - Enable Bash & ZSH Integration
      enableBashIntegration = true;
      enableZshIntegration = true;
      
      # DirEnv - Nix DirEnv
      nix-direnv.enable = true;
    };
  };
}
