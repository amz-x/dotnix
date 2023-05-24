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
#       │    ├─ vscode.nix
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
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Services
  # https://search.nixos.org/options?channel=23.05&show=services
  services = {
    # Pipewire
    # https://search.nixos.org/options?channel=23.05&show=services.pipewire
    pipewire = {
      # Pipewire - Enable
      # https://search.nixos.org/options?channel=23.05&show=services.pipewire.enable
      enable = true;

      # Pipewire - Enable automatically run pipewire when connections are made to the pipewire socket
      # https://search.nixos.org/options?channel=23.05&show=services.pipewire.socketActivation
      socketActivation = true;

      # Pipewire - Wireplumber
      # https://search.nixos.org/options?channel=23.05&show=services.pipewire.wireplumber
      wireplumber = {
        # Pipewire - Wireplumber - Enable Wireplumber, a modular session / policy manager for PipeWire
        # https://search.nixos.org/options?channel=23.05&show=services.pipewire.wireplumber.enable
        enable = true;
        
        # Pipewire - Wireplumber Package
        # https://search.nixos.org/options?channel=23.05&show=services.pipewire.wireplumber.package
        package = pkgs.wireplumber;
      };

      # Pipewire - ALSA
      # https://search.nixos.org/options?channel=23.05&show=services.pipewire.alsa
      alsa = {
        # Pipewire - ALSA - Enable
        # https://search.nixos.org/options?channel=23.05&show=services.pipewire.alsa.enable
        enable = true;

        # Pipewire - ALSA - Enable 32-bit ALSA support on 64-bit systems
        # https://search.nixos.org/options?channel=23.05&show=services.pipewire.alsa.support32Bit
        support32Bit = true;
      };

      # Pipewire - Pulseaudio
      # https://search.nixos.org/options?channel=23.05&show=services.pipewire.pulse.enable
      pulse.enable = true;

      # Pipewire - JACK
      # https://search.nixos.org/options?channel=23.05&show=services.pipewire.jack.enable
      jack.enable = true;     
    };
  };
}
