{ config, lib, pkgs, ... }:

{
  # System Environment VPN Packages
  environment.systemPackages = with pkgs; [
    mullvad-vpn
  ];

  # System VPN Services
  services = {
    # Mullvad (VPN)
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
