#
#  Specific system VPN configuration settings module
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
#       ├─ ./pantheon.nix
#       ├─ ./programs.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix *
#       └─ ./xdg.nix

{ config, lib, pkgs, user, ... }:

{
  # Cloudfare WARP
  # PR: https://github.com/NixOS/nixpkgs/pull/168092
  # Issue: https://discourse.nixos.org/t/cant-start-cloudflare-warp-cli/23267
  imports = [
    ./cloudflare-warp.nix
  ];

  # System VPN Services
  services = {
    # Cloudflare Warp
    cloudflare-warp = {
      enable = true;

      # @TODO - Need a better way to handle this
      certificate = "/home/${user}/.config/cloudflare/warp/cert/Cloudflare_CA.crt";
    };
  };
}
