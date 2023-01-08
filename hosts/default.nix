#
#  Specific system configuration settings for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix *
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

{ lib, inputs, nixpkgs, home-manager, user, location, ... }:

let
  # Linux Architecture
  # System Options: [ "aarch64-linux" "x86_64-linux" ]
  system = "x86_64-linux";

  hostname = "AMZ-Linux"; 

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  # Linux Desktop
  "${hostname}" = lib.nixosSystem {
    # Linux Architecture
    inherit system;
    specialArgs = { inherit inputs pkgs user hostname location; };
    modules = [
      # System / Desktop
      ./desktop

      # Home Manager
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = {
          imports = [(import ./home.nix)];
        };
      }
    ];
  };
}
