#
#  Specific system VPN configuration settings module
#

{ config, lib, pkgs, ... }:

{
  # Services
  # https://search.nixos.org/options?channel=unstable&show=services
  services = {
    
    # IVPN
    # https://search.nixos.org/options?channel=unstable&show=services.ivpn
    ivpn = {

      # IVPN - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.ivpn.enable
      enable = false;
    };

    # Netbird
    # https://search.nixos.org/options?channel=unstable&show=services.netbird
    netbird = {
      
      # Netbird - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.netbird.enable
      enable = false;
      
      # Netbird - Package
      # https://search.nixos.org/options?channel=unstable&show=services.netbird.package
      package = pkgs.netbird;
    };
  };
}
