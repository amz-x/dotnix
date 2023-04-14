#
#  Home-manager configuration for MacBook Pro
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix
#   │   └─ ./home.nix *
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
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./openrgb.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

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
      nushell
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
    #   package = pkgs.firefox;
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
  };
}
