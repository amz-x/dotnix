#
#  Specific system VPN configuration settings module
#

{ config, lib, pkgs, ... }:

{
  # Services
  # https://search.nixos.org/options?channel=unstable&show=services
  services = {
    
    # Mullvad VPN
    # https://search.nixos.org/options?channel=unstable&show=services.mullvad
    mullvad-vpn = {

      # Mullvad VPN - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.mullvad.enable
      enable = true;
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
