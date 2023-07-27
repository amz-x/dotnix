#
#  Specific system networking configuration settings module
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix
#   │   └─ ./home.nix
#   │
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   │
#   └─ ./modules
#       ├─ ./home-manager
#       │    ├─ direnv.nix
#       │    ├─ git.nix
#       │    ├─ starship.nix
#       │    ├─ vscode.nix
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./homeassistant.nix
#       ├─ ./networking.nix *
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       └─ ./vpn.nix

{ config, lib, pkgs, ... }:

{
  # Networking
  # https://search.nixos.org/options?channel=unstable&show=networking
  networking = {

    # Networking - Hostname
    # https://search.nixos.org/options?channel=unstable&show=networking.networkmanager.enable
    hostName = "AMZ-Linux";

    # Networking - Hosts
    # https://search.nixos.org/options?channel=unstable&show=networking.hosts
    hosts = {
      "127.0.0.1" = [ "AMZ-Linux"         ];
      "1.1.1.1"   = [ "one.one.one.one"   ];
      "1.0.0.1"   = [ "one.zero.zero.one" ];
      "9.9.9.9"   = [ "dns.quad9.net"     ];
      "9.9.9.11"  = [ "dns11.quad9.net"   ];
    };

    # Networking - Wireguard
    # https://search.nixos.org/options?channel=unstable&show=networking.wireguard 
    wireguard = {
      # Networking - Wireguard - Enable
      # https://search.nixos.org/options?channel=unstable&show=networking.wireguard.enable
      enable = true;
    };

    # Networking - IP Route 2
    # https://search.nixos.org/options?channel=unstable&show=networking.iproute2
    iproute2 = {
      # Networking - IP Route 2 - Enable
      # https://search.nixos.org/options?channel=unstable&show=networking.iproute2.enable
      enable = true;
    };

    # Networking - Network Manager
    # https://search.nixos.org/options?channel=unstable&show=networking.networkmanager
    networkmanager = {

      # Networking - Network Manager - Enable
      # https://search.nixos.org/options?channel=unstable&show=networking.networkmanager.enable
      enable = true;

      # Networking - Network Manager - DNS
      # DNS options: [ "default", "dnsmasq", "unbound", "systemd-resolved", "none" ]
      # https://search.nixos.org/options?channel=unstable&show=networking.networkmanager.dns
      # dns = "default";

      # Networking - Network Manager - Firewall Backend
      # https://search.nixos.org/options?channel=unstable&show=networking.networkmanager.firewallBackend
      firewallBackend = "nftables";
    };

    # Networking - Resolvconf
    # https://search.nixos.org/options?channel=unstable&show=networking.resolvconf
    resolvconf = {

      # Networking - Resolvconf - Enable
      # https://search.nixos.org/options?channel=unstable&show=networking.resolvconf.enable
      enable = true;

      # Networking - Resolvconf - DNS Single Request
      # https://search.nixos.org/options?channel=unstable&show=networking.resolvconf.dnsSingleRequest
      dnsSingleRequest = true;

      # Networking - Resolvconf - DNS Single Request
      # https://search.nixos.org/options?channel=unstable&show=networking.resolvconf.dnsExtensionMechanism
      dnsExtensionMechanism = true;
    };
  };
}
