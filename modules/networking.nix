#
#  Specific system networking configuration settings module
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./networking.nix *
#       ├─ ./pantheon.nix
#       ├─ ./programs.nix
#       ├─ ./security.nix 
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, hostname, ... }:

{
  # Networking
  networking = {

    # Hostname
    hostName = "${hostname}";

    # Default Gateway
    defaultGateway = "192.168.50.1";

    # Hosts
    hosts = {
      "127.0.0.1" = [ "${hostname}"       ];
      "1.1.1.1"   = [ "one.one.one.one"   ];
      "1.0.0.1"   = [ "one.zero.zero.one" ];
      "9.9.9.9"   = [ "dns.quad9.net"     ];
      "9.9.9.11"  = [ "dns11.quad9.net"   ];
    };

    # Network Manager
    # DNS options: [ "default", "dnsmasq", "unbound", "systemd-resolved", "none" ]
    networkmanager = {
      enable = true;
    };

    # Openresolv 
    resolvconf = {
      enable = true;
      dnsSingleRequest = true;
    };
  };
}
