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
  # https://nix-community.github.io/home-manager/options.html
  home = {
    # Username & Home Directory
    username = "${user}";
    homeDirectory = "/home/${user}";

    # State Version
    stateVersion = "22.11";

    # Home Packages
    packages = with pkgs; [
      # AWS CLI
      awscli2
      # Railway CLI
      railway
    ];
  };

  # Temporary Workaround
  # Issue: https://github.com/nushell/nushell/issues/8804#issuecomment-1500742582
  xdg.configFile."nushell/env.nu".text = ''
    starship init nu
    | str replace --string 'PROMPT_COMMAND = {' 'PROMPT_COMMAND = { ||'
    | str replace --string 'PROMPT_COMMAND_RIGHT = {' 'PROMPT_COMMAND_RIGHT = { ||'
    | save -f ~/.cache/starship/init.nu
  '';

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

      # Nushell - Extra Configuration
      extraConfig = ''
        let-env config = { show_banner: false }
      '';
    };
  };

  # Services
  services = {
    # Firewall - Opensnitch UI
    opensnitch-ui.enable = true;
  };
}
