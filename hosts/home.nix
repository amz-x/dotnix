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
      jq
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
    # nushell.enable = true;
    
    # ZSH
    zsh = {
      # ZSH - Enable
      enable = true;

      # ZSH - Configuration
      autocd = true;
      dotDir = ".config/zsh";

      # ZSH - Initialize Extra
      initExtra = "source ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh";

      # ZSH - Additional Shell Integrations
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;

      # ZSH - Plugin Manager (@TODO)
      
      # ZSH - Configuration History
      history = {
        path = "${config.xdg.dataHome}/zsh/zsh_history";
        save = 10000;
        size = 10000;
      };
    };
     

    # Starship Prompt
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
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
    # opensnitch-ui.enable = true;
  };
}
