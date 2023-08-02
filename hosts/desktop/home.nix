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
    homeDirectory = "/home/${user}";

    # State Version
    stateVersion = "23.11";

    # Home Packages
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
    home-manager.enable = true;

    # Info
    info.enable = true;

    # Nix-Index
    nix-index.enable = true;

    # Nushell
    # https://www.nushell.sh/
    nushell = {

      # Nushell - Enable
      enable = true;

      # Nushell - Package
      package = pkgs.nushell;

      # Nushell Environment File
      extraEnv = ''
        let starship_cache = "${config.xdg.cacheHome}/starship"
        if not ($starship_cache | path exists) {
          mkdir $starship_cache
        }

        let starship_cache_config = '
          $env.STARSHIP_SHELL = "nu"
          $env.STARSHIP_SESSION_KEY = (random chars -l 16)
          $env.PROMPT_MULTILINE_INDICATOR = (^/etc/profiles/per-user/${user}/bin/starship prompt --continuation)

          # Does not play well with default character module.
          # TODO: Also Use starship vi mode indicators?
          $env.PROMPT_INDICATOR = ""

          $env.PROMPT_COMMAND = { ||
            # jobs are not supported
            let width = (term size).columns
            ^/etc/profiles/per-user/${user}/bin/starship prompt $"--cmd-duration=($env.CMD_DURATION_MS)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)"
          }

          # Whether we have config items
          let has_config_items = (not ($env | get -i config | is-empty))

          $env.config = if $has_config_items {
            $env.config | upsert render_right_prompt_on_last_line true
          } else {
            { render_right_prompt_on_last_line: true }
          }

          $env.PROMPT_COMMAND_RIGHT = { ||
            let width = (term size).columns
            ^/etc/profiles/per-user/${user}/bin/starship prompt --right $"--cmd-duration=($env.CMD_DURATION_MS)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)"
          }
        ';

        echo $starship_cache_config | save --force ${config.xdg.cacheHome}/starship/init.nu
      '';

      # Nushell - Configuration File
      configFile.text = lib.mkForce ''
        # Nushell Configuration - Starship Prompt
        source ${config.xdg.cacheHome}/starship/init.nu

        # Nushell Configuration
        $env.config = ($env | default {} config).config

        # Nushell Configuration - Hide Banner
        $env.config = ($env.config | upsert show_banner false)

        # Nushell Configuration - Hooks
        $env.config = ($env.config | default {} hooks)
        $env.config = ($env.config | update hooks ($env.config.hooks | default [] pre_prompt))
        $env.config = ($env.config | update hooks.pre_prompt ($env.config.hooks.pre_prompt | append {
          code: "
            let direnv = (${lib.getBin pkgs.direnv}/bin/direnv export json | from json)
            let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
            $direnv | load-env
            "
        }))
      '';
    };
  };

  # Services
  services = {
    # Firewall - Opensnitch UI
    opensnitch-ui.enable = true;
  };
}
