#
#  Specific system VPN configuration settings module
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
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
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
  # imports = [
  #   ./sub/cloudflare-warp.nix
  # ];
  # services = {
  #   cloudflare-warp = {
  #     enable = true;
  #
  #     # @TODO - Need a better way to handle this
  #     certificate = "/home/${user}/.config/cloudflare/warp/cert/Cloudflare_CA.crt";
  #   };
  # };

  # System Services
  # https://search.nixos.org/options?channel=unstable&show=services
  services = {

    # Netbird (https://netbird.io)
    # https://search.nixos.org/options?channel=unstable&show=services.netbird
    netbird = {

      # Netbird - Enable
      # https://search.nixos.org/options?channel=unstable&show=services.netbird.enable
      enable = true;

      # Netbird - Package
      # https://search.nixos.org/options?channel=unstable&show=services.netbird.package
      package = pkgs.netbird;
    };   
  };
}
