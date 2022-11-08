
{ lib, inputs, nixpkgs, home-manager, user, hostname, location, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  ${hostname} = lib.nixosSystem {
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