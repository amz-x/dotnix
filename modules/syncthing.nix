#
#  Specific system syncthing configuration settings module for home manager
#

{ config, lib, pkgs, user, ... }:

{
  # Syncthing
  # https://search.nixos.org/options?channel=unstable&show=services.syncthing
  services.syncthing = {

    # Syncthing - Enable
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.enable
    enable = false;

    # Syncthing - User
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.user
    user = "${user}";

    # Syncthing - Data Directory
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.dataDir
    dataDir = "/home/${user}";

    # Syncthing - Open Default Ports
    # https://search.nixos.org/options?channel=unstable&show=services.syncthing.openDefaultPorts
    openDefaultPorts = false;    
  };
}
