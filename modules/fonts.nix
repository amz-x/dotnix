{ config, lib, pkgs, ... }:

{
  # Fonts
  fonts = {
    # Enable default fonts
    enableDefaultFonts = true;
    enableGhostscriptFonts = true;

    # Font configuration
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [
         "Noto Color Emoji"
        ];
        monospace = [
          "Hack"
          "Inconsolata"
          "Source Sans Mono"
          "Liberation Mono"
          "DejaVu Mono"
        ];
        sansSerif = [
          "Inter"
          "Liberation Sans"
          "Source Sans"
        ];
        serif = [
          "Liberation Serif"
          "Source Serif"
        ];
      };
    };

    # Font Directory
    fontDir.enable = true;

    # Font Packages
    fonts = with pkgs; [
      dejavu_fonts
      fira-code-symbols
      hack-font
      inconsolata
      inter
      liberation_ttf
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      open-dyslexic
      open-sans
      source-sans
      source-serif
      roboto
      roboto-mono
    ];
  };
}
