#
#  Specific system home assistant configuration settings module
#

{ config, lib, pkgs, ... }:

{
  # Home Assistant
  # https://search.nixos.org/options?channel=unstable&show=services.home-assistant
  services.home-assistant = {

    # Home Assistant - Enable
    # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.enable
    enable = false;

    # Home Assistant - Package
    # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.package
    # package = pkgs.home-assistant;

    # Home Assistant - Open Firewall
    # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.openFirewall
    openFirewall = false;

    # Home Assistant - Extra Components
    # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.extraComponents
    extraComponents = [
      # List of components required to complete the onboarding
      "met"
      "esphome"
      # List of additional components
      "adguard"
      "cpuspeed"
      "fail2ban"
      "ffmpeg"
      "hddtemp"
      "shopping_list"
      "webostv"
    ];

    # Home Assistant - Extra Packages
    # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.extraPackages
    extraPackages =  python3Packages: with python3Packages; [
      aiohomekit
      pyipp
      psycopg2
      radios
      securetar
    ];

    # Home Assistant - Config
    # # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config
    config = {

      # Home Assistant - Config - Home Assistant
      # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.homeassistant
      homeassistant = {
        # Home Assistant - Configuration
        # https://www.home-assistant.io/docs/configuration/basic/
        name              = "Home";
        unit_system       = "metric";
        temperature_unit  = "C";
        country           = "ZA";
        internal_url      = "http://homeassistant.local:8123";
      };

      default_config = {};

      # Home Assistant - Config - HTTP
      # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.http
      # http = {
      #   # Home Assistant - Config - HTTP - Server Host 
      #   # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.http.server_host
      #   server_host = [
      #     "0.0.0.0"
      #     "::"
      #   ];
      #   # Home Assistant - Config - HTTP - Server Host 
      #   # https://search.nixos.org/options?channel=unstable&show=services.home-assistant.config.http.server_port
      #   server_port = 8123;
      # };
      
    };
  };
}
