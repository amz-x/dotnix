#
#  Specific system fonts configuration settings module
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix
#   │   └─ ./home.nix
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
#       ├─ ./fonts.nix *
#       ├─ ./gaming.nix
#       ├─ ./homeassistant.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Fonts
  # https://search.nixos.org/options?channel=unstable&show=fonts
  fonts = {

    # Font Directory
    # https://search.nixos.org/options?channel=unstable&show=fonts.fontDir
    fontDir.enable = true;

    # Font Packages
    # https://search.nixos.org/options?channel=unstable&show=fonts.fonts
    fonts = with pkgs; [
      dejavu_fonts
      fira-code-symbols
      hack-font
      inconsolata
      inter
      iosevka
      liberation_ttf
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      open-dyslexic
      open-sans
      roboto
      roboto-mono
      source-sans
      source-serif
    ];
  };
}
