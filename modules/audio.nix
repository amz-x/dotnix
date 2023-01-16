#
#  Specific system audio configuration settings module
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
#       ├─ ./audio.nix *
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./homeassistant.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # System Services
  services = {
    # Pipewire
    # https://search.nixos.org/options?channel=unstable&show=services.pipewire
    pipewire = {
      # Pipewire - Enable
      enable = true;

      # Pipewire - Enable automatically run pipewire when connections are made to the pipewire socket
      socketActivation = true;

      # Pipewire - Wireplumber
      wireplumber = {
        # Pipewire - Wireplumber - Enable Wireplumber, a modular session / policy manager for PipeWire
        enable = true;
        # Pipewire - Wireplumber Package 
        package = pkgs.wireplumber;
      };

      # Pipewire - ALSA
      alsa = {
        # Pipewire - ALSA - Enable
        enable = true;
        # Pipewire - ALSA - Enable 32-bit ALSA support on 64-bit systems
        support32Bit = true;
      };

      # Pipewire - Pulseaudio
      pulse.enable = true;

      # Pipewire - JACK
      jack.enable = true;     
    };
  };
}
