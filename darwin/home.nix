#
#  Home-manager configuration for MacBook Pro
#
#  flake.nix
#   └─ ./darwin
#       ├─ ./default.nix
#       ├─ ./configuration.nix
#       └─ ./home.nix * 
#

{ config, pkgs, user, ... }:

{
  # Home Manager
  home = {

    # Username
    username = "${user}";
    
    # Home Directory
    homeDirectory = "/Users/${user}";

    # Home Packages
    packages = with pkgs; [
      awscli2
      coreutils
      wget
      jq
    ];

    # Session Variables
    sessionVariables = {
      EDITOR = "nano";
      STARSHIP_SHELL = "nu";
    };

    # Home State Version
    stateVersion = "22.11";
  };
  
  # Programs
  programs = {

    # Home Manager
    home-manager.enable = true;

    # Firefox
    # firefox = {
    #   enable = true;
    #   package = pkgs.firefox-unwrapped-bin;
    # };

    # Terminal
    alacritty = {
      enable = true;
      settings = {
        dynamic_title = true;
        decorations = "full";
        renderer = "gles2_pure";
        dynamic_padding = true;
        padding = {
          x = 3;
          y = 1;
        };
        offset = {
          x = -1;
          y = 0;
        };
      };
    };

    # GIT
    # https://mipmip.github.io/home-manager-option-search/?programs.git
    git = {
      # GIT - Enable
      # https://mipmip.github.io/home-manager-option-search/?programs.git.enable
      enable = true;

      # GIT - Username & Email
      # https://mipmip.github.io/home-manager-option-search/?programs.git.userName
      # https://mipmip.github.io/home-manager-option-search/?programs.git.userEmail
      userName = "Christopher Crouse";
      userEmail = "mail@amz-x.com";
      
      # GIT - Package
      # https://mipmip.github.io/home-manager-option-search/?programs.git.package
      package = pkgs.gitFull;

      # GIT - Default Ignores
      # https://mipmip.github.io/home-manager-option-search/?programs.git.ignores
      ignores = [ ".DS_Store" ];
    };

    # Nushell
    # https://mipmip.github.io/home-manager-option-search/?programs.nushell
    nushell = {
      
      # Nushell - Enable
      # https://mipmip.github.io/home-manager-option-search/?programs.nushell.enable
      enable = true;

      # Nushell - Package
      # https://mipmip.github.io/home-manager-option-search/?programs.nushell.package
      package = pkgs.nushell;

      # Nushell - Extra Configuration
      # https://mipmip.github.io/home-manager-option-search/?programs.nushell.extraConfig
      extraConfig = ''
        # PATH
        let-env PATH = "/Users/${user}/.nix-profile/bin";
        let-env PATH = ($env.PATH | append "/nix/var/nix/profiles/default/bin")
        let-env PATH = ($env.PATH | append "/etc/profiles/per-user/${user}/bin")
        let-env PATH = ($env.PATH | append "/run/current-system/sw/bin")
        let-env PATH = ($env.PATH | append "/nix/var/nix/profiles/default/bin")
        let-env PATH = ($env.PATH | append "/usr/local/bin")
        let-env PATH = ($env.PATH | append "/usr/bin")
        let-env PATH = ($env.PATH | append "/usr/sbin")
        let-env PATH = ($env.PATH | append "/bin")
        let-env PATH = ($env.PATH | append "/sbin")

        # CONFIG
        let-env config = {
          # Hide Banner
          show_banner: false

          # Direnv Hook
          # https://www.nushell.sh/cookbook/direnv.html#configuring-direnv
          hooks: {
            env_change: {
              PWD: [{
                code: "
                  let direnv = (direnv export json | from json)
                  let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
                  $direnv | load-env
                "
              }]
            }
          }
        }
      '';

      # Nushell - Extra Vars
      # https://mipmip.github.io/home-manager-option-search/?programs.nushell.extraConfig
      # extraEnv = '''';
    };



    # Starship Prompt
    # https://mipmip.github.io/home-manager-option-search/?programs.starship
    starship = {

      # Starship - Enable
      # https://mipmip.github.io/home-manager-option-search/?programs.starship.enable
      enable = true;

      # Starship - Bash Integration
      # https://mipmip.github.io/home-manager-option-search/?programs.starship.enableBashIntegration
      enableBashIntegration = true;

      # Starship - Nushell Integration
      # https://mipmip.github.io/home-manager-option-search/?programs.starship.enableNushellIntegration
      enableNushellIntegration = true;

      # Starship - ZSH Integration
      # https://mipmip.github.io/home-manager-option-search/?programs.starship.enableZshIntegration
      enableZshIntegration = true;
    };

    # Direnv
    # https://mipmip.github.io/home-manager-option-search/?programs.direnv
    direnv = {

      # Direnv - Enable
      # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enable
      enable = true;

      # Direnv - Bash Integration
      # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enableBashIntegration
      enableBashIntegration = true;

      # Direnv - ZSH Integration
      # https://mipmip.github.io/home-manager-option-search/?programs.direnv.enableZshIntegration
      enableZshIntegration = true;
      
      # Direnv - Nix Direnv
      # https://mipmip.github.io/home-manager-option-search/?programs.direnv.nix-direnv.enable
      nix-direnv.enable = true;
    };

    # ZSH
    # zsh = {
    #   # ZSH - Enable
    #   enable = true;

    #   # ZSH - Configuration
    #   autocd = true;
    #   dotDir = ".config/zsh";

    #   # ZSH - History
    #   history = {
    #     path = "${config.xdg.configHome}/zsh/zsh_history";
    #     save = 10000;
    #     size = 10000;
    #   };

    #   # ZSH - Initialize Extra
    #   initExtraBeforeCompInit = ''
    #     source "${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh"
    #     source "${pkgs.zinit}/share/zinit/zinit.zsh"

    #     zinit light zsh-users/zsh-completions
    #     zinit light zsh-users/zsh-autosuggestions
    #     zinit light zdharma-continuum/fast-syntax-highlighting

    #     zinit light mafredri/zsh-async
    #     zinit light caarlos0/zsh-pg
    #   '';

    #   # ZSH - Keybindings
    #   # https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/key-bindings.zsh
    #   initExtra = ''
    #     ## Keybindings ##

    #     # Make sure that the terminal is in application mode when zle is active, since only then values from $terminfo are valid
    #     if (( ''${+terminfo[smkx]} )) && (( ''${+terminfo[rmkx]} )); then
    #       function zle-line-init() {
    #         echoti smkx
    #       }
    #       function zle-line-finish() {
    #         echoti rmkx
    #       }
    #       zle -N zle-line-init
    #       zle -N zle-line-finish
    #     fi

    #     # Use emacs key bindings
    #     bindkey -e

    #     # [PageUp] - Up a line of history
    #     if [[ -n "''${terminfo[kpp]}" ]]; then
    #       bindkey -M emacs "''${terminfo[kpp]}" up-line-or-history
    #       bindkey -M viins "''${terminfo[kpp]}" up-line-or-history
    #       bindkey -M vicmd "''${terminfo[kpp]}" up-line-or-history
    #     fi
    #     # [PageDown] - Down a line of history
    #     if [[ -n "''${terminfo[knp]}" ]]; then
    #       bindkey -M emacs "''${terminfo[knp]}" down-line-or-history
    #       bindkey -M viins "''${terminfo[knp]}" down-line-or-history
    #       bindkey -M vicmd "''${terminfo[knp]}" down-line-or-history
    #     fi

    #     # Start typing + [Up-Arrow] - fuzzy find history forward
    #     if [[ -n "''${terminfo[kcuu1]}" ]]; then
    #       autoload -U up-line-or-beginning-search
    #       zle -N up-line-or-beginning-search

    #       bindkey -M emacs "''${terminfo[kcuu1]}" up-line-or-beginning-search
    #       bindkey -M viins "''${terminfo[kcuu1]}" up-line-or-beginning-search
    #       bindkey -M vicmd "''${terminfo[kcuu1]}" up-line-or-beginning-search
    #     fi
    #     # Start typing + [Down-Arrow] - fuzzy find history backward
    #     if [[ -n "''${terminfo[kcud1]}" ]]; then
    #       autoload -U down-line-or-beginning-search
    #       zle -N down-line-or-beginning-search

    #       bindkey -M emacs "''${terminfo[kcud1]}" down-line-or-beginning-search
    #       bindkey -M viins "''${terminfo[kcud1]}" down-line-or-beginning-search
    #       bindkey -M vicmd "''${terminfo[kcud1]}" down-line-or-beginning-search
    #     fi

    #     # [Home] - Go to beginning of line
    #     if [[ -n "''${terminfo[khome]}" ]]; then
    #       bindkey -M emacs "''${terminfo[khome]}" beginning-of-line
    #       bindkey -M viins "''${terminfo[khome]}" beginning-of-line
    #       bindkey -M vicmd "''${terminfo[khome]}" beginning-of-line
    #     fi
    #     # [End] - Go to end of line
    #     if [[ -n "''${terminfo[kend]}" ]]; then
    #       bindkey -M emacs "''${terminfo[kend]}"  end-of-line
    #       bindkey -M viins "''${terminfo[kend]}"  end-of-line
    #       bindkey -M vicmd "''${terminfo[kend]}"  end-of-line
    #     fi

    #     # [Shift-Tab] - move through the completion menu backwards
    #     if [[ -n "''${terminfo[kcbt]}" ]]; then
    #       bindkey -M emacs "''${terminfo[kcbt]}" reverse-menu-complete
    #       bindkey -M viins "''${terminfo[kcbt]}" reverse-menu-complete
    #       bindkey -M vicmd "''${terminfo[kcbt]}" reverse-menu-complete
    #     fi

    #     # [Backspace] - delete backward
    #     bindkey -M emacs '^?' backward-delete-char
    #     bindkey -M viins '^?' backward-delete-char
    #     bindkey -M vicmd '^?' backward-delete-char
        
    #     # [Delete] - delete forward
    #     if [[ -n "''${terminfo[kdch1]}" ]]; then
    #       bindkey -M emacs "''${terminfo[kdch1]}" delete-char
    #       bindkey -M viins "''${terminfo[kdch1]}" delete-char
    #       bindkey -M vicmd "''${terminfo[kdch1]}" delete-char
    #     else
    #       bindkey -M emacs "^[[3~" delete-char
    #       bindkey -M viins "^[[3~" delete-char
    #       bindkey -M vicmd "^[[3~" delete-char

    #       bindkey -M emacs "^[3;5~" delete-char
    #       bindkey -M viins "^[3;5~" delete-char
    #       bindkey -M vicmd "^[3;5~" delete-char
    #     fi

    #     # [Ctrl-Delete] - delete whole forward-word
    #     bindkey -M emacs '^[[3;5~' kill-word
    #     bindkey -M viins '^[[3;5~' kill-word
    #     bindkey -M vicmd '^[[3;5~' kill-word

    #     # [Ctrl-RightArrow] - move forward one word
    #     bindkey -M emacs '^[[1;5C' forward-word
    #     bindkey -M viins '^[[1;5C' forward-word
    #     bindkey -M vicmd '^[[1;5C' forward-word
        
    #     # [Ctrl-LeftArrow] - move backward one word
    #     bindkey -M emacs '^[[1;5D' backward-word
    #     bindkey -M viins '^[[1;5D' backward-word
    #     bindkey -M vicmd '^[[1;5D' backward-word

    #     # [Esc-w] - Kill from the cursor to the mark
    #     bindkey '\ew' kill-region

    #     # [Esc-l] - run command: ls
    #     bindkey -s '\el' 'ls\n'

    #     # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
    #     bindkey '^r' history-incremental-search-backward
        
    #     # [Space] - don't do history expansion
    #     bindkey ' ' magic-space

    #     # Edit the current command line in $EDITOR
    #     autoload -U edit-command-line
    #     zle -N edit-command-line
    #     bindkey '\C-x\C-e' edit-command-line

    #     # file rename magick
    #     bindkey "^[m" copy-prev-shell-word
    #   '';
    # };

  };
}
