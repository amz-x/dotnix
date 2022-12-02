{ config, lib, pkgs, ... }:

{
  # Fonts
  fonts = {

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
