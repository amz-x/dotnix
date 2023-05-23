# It defines all the packages, dependencies and other configuration needed to build the project.
# The main entry point is the flake.nix file, which contains all the necessary information to build and run the project.

{
  # Flake description
  description = "Personal NixOS Configuration";

  # Flake inputs
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";

    # Darwin
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake outputs
  outputs = inputs @ { self, nixpkgs, home-manager, darwin, ... }:
    let 
      user = "amz";
      location = "$HOME/Workspace/amz/dotnix";
    in
    {
      # Nix OS
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user location;
        }
      );

      # Nix Darwin
      darwinConfigurations = (
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user location darwin;
        }
      );
    };    
}
