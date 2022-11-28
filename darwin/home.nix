#
#  Home-manager configuration for MacBook Pro
#
#  flake.nix
#   └─ ./darwin
#       ├─ ./default.nix
#       ├─ ./configuration.nix
#       └─ ./home.nix * 
#

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

    # Starship Prompt
    starship = {
      enable = true;
      settings = {};
    };

    # DirEnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
