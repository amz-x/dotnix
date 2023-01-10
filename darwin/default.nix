#
#  These are the different profiles that can be used when building on MacOS
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix *
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
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

{ lib, inputs, nixpkgs, home-manager, darwin, user, ...}:

let
  # Darwin Architecture
  # System Options: [ "aarch64-darwin" "x86_64-darwin" ]
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
          imports = [(import ./home.nix)] ++
                    [(import ../modules/home-manager/direnv.nix)] ++
                    [(import ../modules/home-manager/git.nix)] ++
                    [(import ../modules/home-manager/starship.nix)];
        };
      }
    ];
  };
}
