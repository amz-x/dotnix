{ config, lib, pkgs, ... }:

{
  # Security
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}