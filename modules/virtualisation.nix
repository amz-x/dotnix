{ config, lib, pkgs, ... }:

{
  # Virtualisation
  virtualisation = {
    # Docker (Rootless - Works similar to Podman)
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
