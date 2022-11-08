{ config, lib, pkgs, ... }:

{
  # Virtualisation
  virtualisation = {
    # Docker
    docker.rootless = {
      enable = true;
      package = pkgs.docker;
    };
  };
}