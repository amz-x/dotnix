#
#  These are the different profiles that can be used when building on MacOS
#
#  flake.nix
#   └─ ./darwin
#       ├─ ./default.nix *
#       ├─ ./configuration.nix
#       └─ ./home.nix
#

{ lib, inputs, nixpkgs, home-manager, darwin, user, ...}:

let
  # Darwin Architecture
  system = "x86_64-darwin";

  # Hostname
  hostname = "AMZ-MacBook";
in
{
  # MacBook Pro
  "${hostname}" = darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs user hostname; };
    modules = [
      # MacBook Pro Configuration
      ./configuration.nix

      # Home Manager
      home-manager.darwinModules.home-manager {
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
