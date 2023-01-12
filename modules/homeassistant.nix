#
#  Specific system home assistant configuration settings module
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
#       ├─ ./homeassistant.nix *
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       └─ ./xdg.nix


{ config, lib, pkgs, ... }:

{
  # Home Assistant
  # https://search.nixos.org/options?channel=unstable&show=services.home-assistant
  services.home-assistant = {

    # Home Assistant - Enable
    # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.enable
    enable = true;

    # Home Assistant - Extra Components
    # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.extraComponents
    extraComponents = [
      # List of components required to complete the onboarding
      "default_config"
      "met"
      "esphome"
      # List of additional components
      "adguard"
      "cpuspeed"
      "fail2ban"
      "ffmpeg"
      "hddtemp"
      "shopping_list"
    ];

    # Home Assistant - Config
    # # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config
    config = {
      
      # Home Assistant - Config - Home Assistant
      # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.homeassistant
      homeassistant = {

        # Home Assistant - Config - Home Assistant - Name
        # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.homeassistant.name
        name = "Home";

        # Home Assistant - Config - Home Assistant - Unit System
        # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.homeassistant.unit_system
        unit_system = "metric";

        # Home Assistant - Config - Home Assistant - Temperature Unit
        # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.homeassistant.temperature_unit
        temperature_unit = "C";

        # Home Assistant - Config - Home Assistant - HTTP
        # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.http
        http = {

          # Home Assistant - Config - Home Assistant - HTTP - Server Host 
          # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.http.server_host
          server_host = [
            "0.0.0.0"
            "::1"
          ];

          # Home Assistant - Config - Home Assistant - HTTP - Server Host 
          # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.http.server_port
          server_port = 8125;
        };
      };
    };
  };
}
