#
#  Specific system configuration settings for desktop
#

{ inputs, nixpkgs, home-manager, user, location, ... }:

let
  # Linux Architecture
  # System Options: [ "aarch64-linux" "x86_64-linux" ]
  system    = "x86_64-linux";
  hostname  = "AMZ-LTP-71";
  pkgs      = import nixpkgs { inherit system; config.allowUnfree = true; };
  lib       = nixpkgs.lib;
in
{
  # Linux Desktop
  "${hostname}" = lib.nixosSystem {
    # Linux Architecture
    inherit system;
    specialArgs = { inherit inputs pkgs user hostname location; };
    modules = [
      # Secure Boot (Lanzeboote)
      # lanzaboote.nixosModules.lanzaboote
      
      # System / Desktop
      ./configuration.nix
      
      # Home Manager
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = {
          imports = [(import ../home.nix)] ++
                    [(import ../../modules/home-manager/direnv.nix)] ++
                    [(import ../../modules/home-manager/git.nix)] ++
                    [(import ../../modules/home-manager/vscode.nix)] ++
                    [(import ../../modules/home-manager/starship.nix)];
        };
      }
    ];
  };
}
