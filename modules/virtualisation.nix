{ config, lib, pkgs, ... }:

{
  # Virtualisation
  virtualisation = {
    # Docker
    docker = {
      enable = true;
      package = pkgs.docker;
    };
  };
}
